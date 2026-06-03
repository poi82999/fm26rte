using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FM26RTE;

public class MainForm : Form
{
    // ── Connection ──
    private Target _target;
    private readonly Label _statusLabel;

    // ── Scan ──
    private readonly TextBox _uidBox;
    private readonly Button _scanBtn;
    private readonly Label _scanStatus;
    private CancellationTokenSource _scanCts;

    // ── Player Editor Panel ──
    private readonly Panel _editorPanel;
    private readonly Label _editorTitle;
    private IntPtr _canonicalAddr = IntPtr.Zero;

    private readonly Dictionary<string, TextBox> _fieldBoxes = new();
    private readonly Dictionary<string, Label> _fieldLabels = new();

    public MainForm()
    {
        Text = "FM26 RTE — Player Editor";
        Width = 780; Height = 700;
        MinimumSize = new Size(700, 600);
        Font = new Font("Segoe UI", 9.5f);
        StartPosition = FormStartPosition.CenterScreen;
        BackColor = Color.FromArgb(30, 30, 40);
        ForeColor = Color.White;

        // ═══════ Top Bar ═══════
        var topBar = new Panel { Dock = DockStyle.Top, Height = 90, BackColor = Color.FromArgb(24, 24, 32) };

        var titleLabel = new Label
        {
            Text = "⚽ FM26 Real-Time Editor",
            Font = new Font("Segoe UI", 16f, FontStyle.Bold),
            ForeColor = Color.FromArgb(100, 200, 255),
            AutoSize = true,
            Location = new Point(20, 8),
        };
        topBar.Controls.Add(titleLabel);

        _statusLabel = new Label
        {
            Text = "게임에 연결되지 않음",
            Font = new Font("Segoe UI", 9f),
            ForeColor = Color.FromArgb(180, 180, 180),
            AutoSize = true,
            Location = new Point(22, 38),
        };
        topBar.Controls.Add(_statusLabel);

        // ── UID input row ──
        var uidLabel = new Label
        {
            Text = "Player UID:",
            ForeColor = Color.FromArgb(200, 200, 220),
            AutoSize = true,
            Location = new Point(22, 62),
        };
        topBar.Controls.Add(uidLabel);

        _uidBox = new TextBox
        {
            Width = 180,
            Location = new Point(110, 59),
            Font = new Font("Cascadia Mono, Consolas", 10f),
            BackColor = Color.FromArgb(50, 50, 65),
            ForeColor = Color.White,
            BorderStyle = BorderStyle.FixedSingle,
        };
        _uidBox.KeyDown += (s, ev) =>
        {
            if (ev.KeyCode == Keys.Enter) { ev.SuppressKeyPress = true; OnScanClick(s, ev); }
        };
        topBar.Controls.Add(_uidBox);

        _scanBtn = new Button
        {
            Text = "🔍 Scan",
            Width = 100, Height = 28,
            Location = new Point(300, 57),
            FlatStyle = FlatStyle.Flat,
            BackColor = Color.FromArgb(60, 130, 200),
            ForeColor = Color.White,
            Font = new Font("Segoe UI", 9f, FontStyle.Bold),
            Cursor = Cursors.Hand,
        };
        _scanBtn.FlatAppearance.BorderSize = 0;
        _scanBtn.Click += OnScanClick;
        topBar.Controls.Add(_scanBtn);

        _scanStatus = new Label
        {
            Text = "",
            ForeColor = Color.FromArgb(180, 180, 180),
            AutoSize = true,
            Location = new Point(410, 62),
        };
        topBar.Controls.Add(_scanStatus);

        var bulkBtn = new Button
        {
            Text = "📦 Bulk Dump",
            Width = 120, Height = 28,
            Location = new Point(630, 57),
            FlatStyle = FlatStyle.Flat,
            BackColor = Color.FromArgb(140, 100, 200),
            ForeColor = Color.White,
            Font = new Font("Segoe UI", 9f, FontStyle.Bold),
            Cursor = Cursors.Hand,
        };
        bulkBtn.FlatAppearance.BorderSize = 0;
        bulkBtn.Click += (_, __) =>
        {
            if (_target == null) TryAutoConnect();
            if (_target != null) new BulkDumpForm(_target).Show(this);
        };
        topBar.Controls.Add(bulkBtn);

        Controls.Add(topBar);

        // ═══════ Editor Panel (scrollable) ═══════
        _editorPanel = new Panel
        {
            Dock = DockStyle.Fill,
            AutoScroll = true,
            Padding = new Padding(20, 10, 20, 10),
            BackColor = Color.FromArgb(30, 30, 40),
            Visible = false,
        };

        _editorTitle = new Label
        {
            Text = "Player Record",
            Font = new Font("Segoe UI", 13f, FontStyle.Bold),
            ForeColor = Color.FromArgb(100, 220, 160),
            AutoSize = true,
            Location = new Point(20, 10),
        };
        _editorPanel.Controls.Add(_editorTitle);

        // Build field rows grouped by category
        int y = 45;
        FieldCat lastCat = (FieldCat)(-1);

        foreach (var f in PlayerFields.All)
        {
            if (f.Category != lastCat)
            {
                // Category header
                var catName = f.Category switch
                {
                    FieldCat.Core => "기본 정보",
                    FieldCat.Hidden => "히든 스탯  (실험적)",
                    FieldCat.Attr => "능력치 블록  (+0x064~)",
                    FieldCat.Position => "포지션 적합도  (1-20)",
                    FieldCat.PPM => "선호 플레이  (ID)",
                    _ => ""
                };
                var catColor = f.Category switch
                {
                    FieldCat.Core => Color.FromArgb(100, 200, 255),
                    FieldCat.Hidden => Color.FromArgb(180, 180, 180),
                    FieldCat.Attr => Color.FromArgb(120, 220, 160),
                    FieldCat.Position => Color.FromArgb(255, 200, 80),
                    FieldCat.PPM => Color.FromArgb(200, 150, 255),
                    _ => Color.White
                };

                if (lastCat != (FieldCat)(-1)) y += 8; // extra gap between sections

                var catLabel = new Label
                {
                    Text = $"━━  {catName}",
                    Font = new Font("Segoe UI", 10f, FontStyle.Bold),
                    ForeColor = catColor,
                    AutoSize = true,
                    Location = new Point(20, y),
                };
                _editorPanel.Controls.Add(catLabel);
                y += 28;
                lastCat = f.Category;
            }

            // Field row
            var nameLabel = new Label
            {
                Text = $"{f.KorName} ({f.Name})",
                ForeColor = Color.FromArgb(200, 200, 220),
                Width = 200,
                Location = new Point(30, y + 3),
                TextAlign = ContentAlignment.MiddleLeft,
            };
            _editorPanel.Controls.Add(nameLabel);

            var valueBox = new TextBox
            {
                Width = 80,
                Location = new Point(240, y),
                Font = new Font("Cascadia Mono, Consolas", 10f),
                BackColor = Color.FromArgb(50, 50, 65),
                ForeColor = Color.White,
                BorderStyle = BorderStyle.FixedSingle,
                Name = f.Name,
                Tag = f,
                TextAlign = HorizontalAlignment.Center,
            };
            valueBox.KeyDown += OnFieldKeyDown;
            _editorPanel.Controls.Add(valueBox);
            _fieldBoxes[f.Name] = valueBox;

            var infoLabel = new Label
            {
                Text = "",
                ForeColor = Color.FromArgb(130, 130, 150),
                AutoSize = true,
                Location = new Point(330, y + 3),
            };
            _editorPanel.Controls.Add(infoLabel);
            _fieldLabels[f.Name] = infoLabel;

            y += 30;
        }

        // ── Refresh + Inspector buttons ──
        y += 10;
        var refreshBtn = new Button
        {
            Text = "⟳ Refresh All",
            Width = 120, Height = 30,
            Location = new Point(30, y),
            FlatStyle = FlatStyle.Flat,
            BackColor = Color.FromArgb(60, 130, 200),
            ForeColor = Color.White,
            Font = new Font("Segoe UI", 9f, FontStyle.Bold),
            Cursor = Cursors.Hand,
        };
        refreshBtn.FlatAppearance.BorderSize = 0;
        refreshBtn.Click += (_, __) => RefreshAllFields();
        _editorPanel.Controls.Add(refreshBtn);

        var inspectBtn = new Button
        {
            Text = "🔬 Hex Inspector",
            Width = 140, Height = 30,
            Location = new Point(160, y),
            FlatStyle = FlatStyle.Flat,
            BackColor = Color.FromArgb(80, 80, 100),
            ForeColor = Color.White,
            Font = new Font("Segoe UI", 9f),
            Cursor = Cursors.Hand,
        };
        inspectBtn.FlatAppearance.BorderSize = 0;
        inspectBtn.Click += (_, __) =>
        {
            if (_canonicalAddr != IntPtr.Zero && _target != null)
                new InspectorForm(_target, _canonicalAddr).Show(this);
        };
        _editorPanel.Controls.Add(inspectBtn);

        Controls.Add(_editorPanel);

        // ═══════ Placeholder (shown before scan) ═══════
        var placeholder = new Label
        {
            Name = "placeholder",
            Text = "Player UID를 입력하고 Scan을 눌러주세요.\n\n게임(FM26)이 실행 중이어야 합니다.",
            Font = new Font("Segoe UI", 12f),
            ForeColor = Color.FromArgb(120, 120, 140),
            TextAlign = ContentAlignment.MiddleCenter,
            Dock = DockStyle.Fill,
        };
        Controls.Add(placeholder);

        // ═══════ Startup ═══════
        Shown += OnShown;
        FormClosing += (_, __) => { _scanCts?.Cancel(); _scanCts?.Dispose(); _target?.Dispose(); };
    }

    // ────────────────────────────────────────────────
    // Startup: auto-connect to fm.exe
    // ────────────────────────────────────────────────
    private void OnShown(object sender, EventArgs e)
    {
        TryAutoConnect();
    }

    private void TryAutoConnect()
    {
        var fmProc = Process.GetProcessesByName("fm").FirstOrDefault();
        if (fmProc == null)
        {
            _statusLabel.Text = "⚠ FM26 프로세스를 찾을 수 없습니다. 게임을 먼저 실행해 주세요.";
            _statusLabel.ForeColor = Color.FromArgb(255, 180, 80);
            return;
        }

        try
        {
            _target = Target.Attach(fmProc.Id);
            _statusLabel.Text = $"✓ {fmProc.ProcessName} (PID {fmProc.Id}) 에 연결됨";
            _statusLabel.ForeColor = Color.FromArgb(100, 220, 160);
        }
        catch (Exception ex)
        {
            _statusLabel.Text = $"✗ 연결 실패: {ex.Message}";
            _statusLabel.ForeColor = Color.FromArgb(255, 100, 100);
        }
    }

    // ────────────────────────────────────────────────
    // Scan: find UID → auto-detect Person Record
    // ────────────────────────────────────────────────
    private async void OnScanClick(object sender, EventArgs e)
    {
        // Auto-connect if not connected
        if (_target == null) TryAutoConnect();
        if (_target == null)
        {
            MessageBox.Show(this, "FM26 프로세스에 연결할 수 없습니다.\n게임이 실행 중인지 확인해 주세요.",
                "연결 실패", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            return;
        }

        if (!TryParseUid(_uidBox.Text, out uint uid))
        {
            MessageBox.Show(this, "유효한 Player UID를 입력해 주세요. (숫자 또는 0x...)");
            return;
        }

        _scanBtn.Enabled = false;
        _scanStatus.Text = "스캔 중…";
        _scanStatus.ForeColor = Color.FromArgb(180, 180, 180);
        _scanCts?.Dispose();
        _scanCts = new CancellationTokenSource();
        var sw = Stopwatch.StartNew();

        try
        {
            var hits = await Task.Run(() => PersonScanner.FindAll(_target, uid, _scanCts.Token,
                (done, total) =>
                {
                    if (IsDisposed) return;
                    BeginInvoke((Action)(() =>
                    {
                        _scanStatus.Text = $"스캔 중… {done}/{total} regions";
                    }));
                }));

            _canonicalAddr = PickHit(hits);

            if (_canonicalAddr != IntPtr.Zero)
            {
                var extra = hits.Count > 1 ? $"  ({hits.Count} candidates)" : "";
                _scanStatus.Text = $"✓ ({sw.Elapsed.TotalSeconds:F1}s) — 0x{_canonicalAddr.ToInt64():X}{extra}";
                _scanStatus.ForeColor = Color.FromArgb(100, 220, 160);

                var placeholder = Controls.Find("placeholder", false);
                if (placeholder.Length > 0) placeholder[0].Visible = false;

                _editorTitle.Text = $"Player UID {uid}  —  Record @ 0x{_canonicalAddr.ToInt64():X}";
                RefreshAllFields();
                _editorPanel.Visible = true;
            }
            else
            {
                _scanStatus.Text = $"⚠ 유효한 레코드를 찾지 못했습니다 ({sw.Elapsed.TotalSeconds:F1}s)";
                _scanStatus.ForeColor = Color.FromArgb(255, 180, 80);
                _editorPanel.Visible = false;
            }
        }
        catch (Exception ex)
        {
            _scanStatus.Text = $"✗ 스캔 실패: {ex.Message}";
            _scanStatus.ForeColor = Color.FromArgb(255, 100, 100);
        }
        finally
        {
            _scanBtn.Enabled = true;
        }
    }

    private IntPtr PickHit(List<PersonHit> hits)
    {
        if (hits == null || hits.Count == 0) return IntPtr.Zero;
        if (hits.Count == 1) return hits[0].Addr;

        using var dlg = new Form
        {
            Text = $"{hits.Count}개 후보 — 진짜 레코드를 골라주세요",
            Width = 520, Height = 360,
            StartPosition = FormStartPosition.CenterParent,
            MinimizeBox = false, MaximizeBox = false,
            FormBorderStyle = FormBorderStyle.FixedDialog,
        };
        var lb = new ListBox { Dock = DockStyle.Fill, Font = new Font("Cascadia Mono, Consolas", 9.5f) };
        foreach (var h in hits)
            lb.Items.Add($"0x{h.Addr.ToInt64():X}   CA={h.CA,3}  PA={h.PA,3}  BY={h.BirthYear}  BM={h.BirthMonth,2}");
        lb.SelectedIndex = 0;
        var ok = new Button { Text = "OK", Dock = DockStyle.Bottom, Height = 32, DialogResult = DialogResult.OK };
        dlg.AcceptButton = ok;
        dlg.Controls.Add(lb);
        dlg.Controls.Add(ok);
        return dlg.ShowDialog(this) == DialogResult.OK && lb.SelectedIndex >= 0
            ? hits[lb.SelectedIndex].Addr
            : hits[0].Addr;
    }


    // ────────────────────────────────────────────────
    // Field reading / writing
    // ────────────────────────────────────────────────
    private void RefreshAllFields()
    {
        if (_canonicalAddr == IntPtr.Zero || _target == null) return;

        foreach (var f in PlayerFields.All)
        {
            var addr = (IntPtr)((long)_canonicalAddr + f.Offset);
            var data = _target.Read(addr, f.Size);
            if (data == null || data.Length != f.Size)
            {
                _fieldBoxes[f.Name].Text = "ERR";
                continue;
            }

            int val = f.Size == 2 ? BitConverter.ToInt16(data, 0) : data[0];
            _fieldBoxes[f.Name].Text = val.ToString();

            // Position color hint
            if (f.Category == FieldCat.Position)
            {
                var color = val switch
                {
                    >= 18 => Color.FromArgb(40, 180, 80),   // 자연스러움 (green)
                    >= 14 => Color.FromArgb(100, 200, 255),  // 능숙 (blue)
                    >= 10 => Color.FromArgb(255, 200, 80),   // 적절 (yellow)
                    >= 5  => Color.FromArgb(200, 130, 60),   // 서투름 (orange)
                    _     => Color.FromArgb(130, 130, 150),  // 부적합 (gray)
                };
                _fieldBoxes[f.Name].ForeColor = color;
                _fieldLabels[f.Name].Text = val switch
                {
                    20 => "★ 자연스러움",
                    >= 18 => "자연스러움",
                    >= 14 => "능숙",
                    >= 10 => "적절",
                    >= 5  => "서투름",
                    >= 2  => "부적합",
                    _ => "-"
                };
                _fieldLabels[f.Name].ForeColor = color;
            }
        }
    }

    private void OnFieldKeyDown(object sender, KeyEventArgs e)
    {
        if (e.KeyCode != Keys.Enter || sender is not TextBox tb) return;
        e.Handled = true;
        e.SuppressKeyPress = true;
        if (_canonicalAddr == IntPtr.Zero || _target == null) return;

        var f = (FieldDef)tb.Tag;
        var addr = (IntPtr)((long)_canonicalAddr + f.Offset);
        if (!int.TryParse(tb.Text, out int val))
        {
            MessageBox.Show("유효한 숫자를 입력하세요.");
            return;
        }

        byte[] bytes = f.Size == 2 ? BitConverter.GetBytes((short)val) : new[] { (byte)val };
        if (_target.TryWrite(addr, bytes))
        {
            tb.BackColor = Color.FromArgb(40, 100, 60);
            var timer = new System.Windows.Forms.Timer { Interval = 600 };
            timer.Tick += (_, __) => { tb.BackColor = Color.FromArgb(50, 50, 65); timer.Stop(); timer.Dispose(); };
            timer.Start();
            RefreshAllFields();
        }
        else
        {
            MessageBox.Show("메모리 쓰기 실패. 관리자 권한으로 실행했는지 확인하세요.");
        }
    }

    // ────────────────────────────────────────────────
    // Helpers
    // ────────────────────────────────────────────────
    private static bool TryParseUid(string s, out uint v)
    {
        s = (s ?? "").Trim();
        if (s.StartsWith("0x", StringComparison.OrdinalIgnoreCase))
            return uint.TryParse(s.AsSpan(2), NumberStyles.HexNumber, null, out v);
        return uint.TryParse(s, out v);
    }

}
