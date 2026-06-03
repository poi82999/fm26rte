import re

file_path = r"c:\Users\신민석\dev\fm26-rte\fm26-rte-tauri\src-tauri\src\comparisons.rs"

with open(file_path, "r", encoding="utf-8") as f:
    content = f.read()

# Helper to remove a player from everywhere
def remove_player(name):
    global content
    # matches ("이름", "국적"), or ("이름", "국적")
    # also handles trailing or leading commas
    content = re.sub(r'^[ \t]*\("'+name+r'",.*?\),?\s*$', '', content, flags=re.MULTILINE)
    content = re.sub(r'\("'+name+r'",.*?\),?\s*', '', content)

def add_player_to_block(pa, position, strength, name, nation):
    global content
    # Find the block
    pattern = r'(comparison_ref!\(\s*' + str(pa) + r',\s*\d+,\s*' + position + r',\s*' + strength + r',\s*\[)'
    replacement = r'\1\n            ("' + name + '", "' + nation + '"),'
    
    if re.search(pattern, content):
        content = re.sub(pattern, replacement, content)
    else:
        print(f"Warning: Block {pa} {position} {strength} not found!")

# 1. Promote John Stones
remove_player("존 스톤스")
add_player_to_block(160, "Defender", "Technical", "존 스톤스", "잉글랜드")

# 2. Promote Riyad Mahrez
remove_player("리야드 마레즈")
add_player_to_block(160, "Midfielder", "Technical", "리야드 마레즈", "알제리")

# 3. Promote Edin Dzeko
remove_player("에딘 제코")
add_player_to_block(160, "Forward", "Mental", "에딘 제코", "보스니아 헤르체고비나")

# 4. Promote Ricardo Carvalho
remove_player("히카르두 카르발류")
add_player_to_block(170, "CenterBack", "Mental", "히카르두 카르발류", "포르투갈")

# 5. Promote Casemiro
remove_player("카세미루")
add_player_to_block(170, "DefensiveMidfielder", "Physical", "카세미루", "브라질")

# 6. Demote Ederson & Alisson
remove_player("에데르송")
remove_player("알리송")
add_player_to_block(170, "Goalkeeper", "Technical", "에데르송", "브라질")
add_player_to_block(170, "Goalkeeper", "Technical", "알리송", "브라질")

# 7. Demote Tierney, Mendy
remove_player("키어런 티어니")
remove_player("페를랑 멘디")
add_player_to_block(160, "Defender", "Physical", "키어런 티어니", "스코틀랜드")
add_player_to_block(160, "Defender", "Physical", "페를랑 멘디", "프랑스")

# 8. Demote Pau Torres, Romagnoli
remove_player("파우 토레스")
remove_player("알레시오 로마뇰리")
add_player_to_block(160, "Defender", "Technical", "파우 토레스", "스페인")
add_player_to_block(160, "Defender", "Technical", "알레시오 로마뇰리", "이탈리아")

# 9. Demote Nelson Semedo
remove_player("넬송 세메두")
add_player_to_block(160, "Defender", "Technical", "넬송 세메두", "포르투갈")

# 10. Demote Pulisic
remove_player("크리스티안 풀리식")
add_player_to_block(160, "Forward", "Physical", "크리스티안 풀리식", "미국")

# Cleanup any empty arrays like comparison_ref!(150, 159, Defender, Technical, [])
content = re.sub(r'(comparison_ref!\([^\[]+)\[\s*\]\s*\),', r'\1[("나초 페르난데스", "스페인")]\n    ),', content)

with open(file_path, "w", encoding="utf-8") as f:
    f.write(content)

print("Rebalance complete.")
