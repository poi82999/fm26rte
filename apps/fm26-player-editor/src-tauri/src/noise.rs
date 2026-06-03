/// 스카우트 능력치 기반 정규분포 노이즈 모듈.
///
/// 스카우터의 JCA(현재 능력 판단) / JPA(성장 가능성 판단)에 따라
/// 선수의 CA/PA에 결정론적 오차를 적용한다.
///
/// 수학 모델:
///   σ = (10 / 1.6448536269514722) × √(20 / attribute)
///   능력 20 → 약 90% 확률로 ±10 이내
///   능력  1 → 약 90% 확률로 ±45 이내
///
/// 시드가 동일하면 항상 같은 결과를 반환한다 (결정론적).

const STANDARD_NORMAL_90_TWO_SIDED_Z: f64 = 1.644_853_626_951_472_2;
const HIGH_SKILL_WITHIN_TEN_SIGMA: f64 = 10.0 / STANDARD_NORMAL_90_TWO_SIDED_Z;

/// 스카우터 능력치에 따른 표준편차를 계산한다.
fn scout_sigma(attribute: u8) -> f64 {
    let attr = (attribute as f64).clamp(1.0, 20.0);
    HIGH_SKILL_WITHIN_TEN_SIGMA * (20.0 / attr).sqrt()
}

/// 선수의 실제 PA에 스카우터 JPA 기반 노이즈를 적용한다.
///
/// - `real_pa`: 실제 PA (1~200)
/// - `scout_attr`: 스카우터의 JPA (1~20)
/// - `seed`: 결정론적 시드 (예: 선수 UID + 스카우터 속성 해시)
///
/// 같은 `(real_pa, scout_attr, seed)` 조합은 항상 같은 결과를 반환한다.
pub(super) fn apply_potential_noise(real_pa: u16, scout_attr: u8, seed: u64) -> u16 {
    sample_rating(real_pa, scout_attr, seed)
}

/// 선수의 실제 CA에 스카우터 JCA 기반 노이즈를 적용한다.
///
/// 샘플링된 CA가 표시 PA보다 높으면 PA를 올리지 않고 경계에서 반사한다.
/// 예: 표시 PA보다 5 높게 샘플링되면 표시 PA보다 5 낮은 값으로 바꾼다.
pub(super) fn apply_current_noise(
    real_ca: u16,
    scout_attr: u8,
    seed: u64,
    observed_pa_ceiling: u16,
) -> u16 {
    reflect_under_ceiling(
        sample_rating(real_ca, scout_attr, seed),
        observed_pa_ceiling,
    )
}

fn sample_rating(real_value: u16, scout_attr: u8, seed: u64) -> u16 {
    let sigma = scout_sigma(scout_attr);
    let noise = seeded_normal(seed, sigma);
    let noised = real_value as f64 + noise;
    noised.round().clamp(1.0, 200.0) as u16
}

fn reflect_under_ceiling(value: u16, ceiling: u16) -> u16 {
    if value <= ceiling {
        return value;
    }

    let reflected = i32::from(ceiling) - (i32::from(value) - i32::from(ceiling));
    reflected.clamp(1, i32::from(ceiling.max(1))) as u16
}

/// 스카우터 + 선수 UID를 결합해 결정론적 시드를 만든다.
pub(super) fn scout_seed(player_uid: u32, scout_attr: u8, salt: u8) -> u64 {
    let mut s = player_uid as u64;
    s ^= (scout_attr as u64) << 32;
    s ^= (salt as u64) << 48;
    // splitmix64 finalizer로 충분히 섞는다
    splitmix64(s)
}

/// splitmix64 — 시드를 균일하게 섞는 해시 함수.
fn splitmix64(mut state: u64) -> u64 {
    state = state.wrapping_add(0x9e3779b97f4a7c15);
    state = (state ^ (state >> 30)).wrapping_mul(0xbf58476d1ce4e5b9);
    state = (state ^ (state >> 27)).wrapping_mul(0x94d049bb133111eb);
    state ^ (state >> 31)
}

/// 시드 기반 결정론적 정규분포 샘플 (Box-Muller 변환).
fn seeded_normal(seed: u64, sigma: f64) -> f64 {
    // 두 개의 독립 균일 분포 난수 생성 (0, 1) 범위
    let u1 = to_unit_open(splitmix64(seed));
    let u2 = to_unit_open(splitmix64(seed.wrapping_add(1)));

    // Box-Muller 변환
    let z = (-2.0 * u1.ln()).sqrt() * (2.0 * std::f64::consts::PI * u2).cos();
    z * sigma
}

/// u64를 (0, 1) 범위의 f64로 변환한다. 0과 1은 제외.
fn to_unit_open(value: u64) -> f64 {
    // 상위 52비트를 사용하고 (0, 1) 범위로 매핑
    let mantissa = (value >> 12) | 0x3FF0_0000_0000_0000;
    let result = f64::from_bits(mantissa) - 1.0;
    // ln(0) 방지를 위해 최소값 보장
    if result <= 0.0 {
        f64::MIN_POSITIVE
    } else {
        result
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sigma_at_20_gives_about_6() {
        let s = scout_sigma(20);
        assert!(
            (s - HIGH_SKILL_WITHIN_TEN_SIGMA).abs() < 0.001,
            "σ(20) = {s}"
        );
    }

    #[test]
    fn sigma_at_1_gives_about_27() {
        let s = scout_sigma(1);
        assert!((s - 27.18).abs() < 0.2, "σ(1) = {s}");
    }

    #[test]
    fn noise_is_deterministic() {
        let a = apply_potential_noise(150, 15, 12345);
        let b = apply_potential_noise(150, 15, 12345);
        assert_eq!(a, b);
    }

    #[test]
    fn noise_clamps_to_valid_range() {
        // 아주 낮은 능력치 스카우터로 많이 반복해도 1~200 범위 유지
        for seed in 0..1000 {
            let v = apply_potential_noise(5, 1, seed);
            assert!(v >= 1 && v <= 200, "out of range: {v}");
        }
    }

    #[test]
    fn high_skill_jpa_scout_is_accurate_around_pa_180() {
        // 능력 20 스카우터: PA 180을 약 90% 확률로 170~190 안에 둔다.
        let real = 180u16;
        let mut within_10 = 0;
        for uid in 0..10_000u32 {
            let seed = scout_seed(uid, 20, 0);
            let observed = apply_potential_noise(real, 20, seed);
            if (observed as i32 - real as i32).unsigned_abs() <= 10 {
                within_10 += 1;
            }
        }
        assert!(
            (8_850..=9_150).contains(&within_10),
            "능력 20 JPA 스카우터: {within_10}/10000 이 ±10 이내"
        );
    }

    #[test]
    fn low_skill_scout_has_more_variance() {
        let real = 150u16;
        let mut within_10_high = 0;
        let mut within_10_low = 0;
        for uid in 0..1000u32 {
            let seed_h = scout_seed(uid, 20, 0);
            let seed_l = scout_seed(uid, 5, 0);
            if (apply_potential_noise(real, 20, seed_h) as i32 - real as i32).unsigned_abs() <= 10 {
                within_10_high += 1;
            }
            if (apply_potential_noise(real, 5, seed_l) as i32 - real as i32).unsigned_abs() <= 10 {
                within_10_low += 1;
            }
        }
        assert!(
            within_10_high > within_10_low,
            "high={within_10_high}, low={within_10_low}: 높은 능력치가 더 정확해야 함"
        );
    }

    #[test]
    fn ca_noise_reflects_below_observed_pa_ceiling() {
        assert_eq!(reflect_under_ceiling(185, 180), 175);
        assert_eq!(reflect_under_ceiling(181, 180), 179);
        assert_eq!(reflect_under_ceiling(170, 180), 170);
    }

    #[test]
    fn observed_ca_never_exceeds_observed_pa() {
        let observed_pa = 176u16;
        for uid in 0..10_000u32 {
            let seed = scout_seed(uid, 1, 0);
            let observed_ca = apply_current_noise(175, 1, seed, observed_pa);
            assert!(
                observed_ca <= observed_pa,
                "observed_ca={observed_ca}, observed_pa={observed_pa}"
            );
        }
    }
}
