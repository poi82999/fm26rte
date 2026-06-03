using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FM26RTE;

/// <summary>
/// Batch position-aptitude extractor. Input lines like:
///   GK     12345     Alisson
///   DC,DR  67890
/// First whitespace-separated token = position label(s), second = UID, rest = optional name.
/// Output is one TSV row per input — the 24 aptitude bytes plus CA/PA/BY/BM for sanity checks.
/// </summary>
public class BulkDumpForm : Form
{
    private readonly Target _target;
    private readonly TextBox _input;
    private readonly TextBox _output;
    private readonly Button _runBtn;
    private readonly Button _copyBtn;
    private readonly Label _status;
    private CancellationTokenSource _cts;

    private const int PosBlockOffset = 0x285;
    private const int PosBlockSize = 24;

    public BulkDumpForm(Target target)
    {
        _target = target;

        Text = "Bulk Dump — 포지션 적합도 일괄 추출";
        Width = 1100; Height = 640;
        Font = new Font("Segoe UI", 9.5f);
        StartPosition = FormStartPosition.CenterParent;

        var split = new SplitContainer
        {
            Dock = DockStyle.Fill,
            Orientation = Orientation.Vertical,
            SplitterDistance = 380,
        };

        var inputPanel = new Panel { Dock = DockStyle.Fill, Padding = new Padding(8) };
        inputPanel.Controls.Add(new Label
        {
            Text = "입력 (한 줄당: 라벨  UID  [이름])\n공백/탭 구분, # 주석, 빈 줄 무시",
            AutoSize = true,
            ForeColor = Color.DimGray,
        });
        _input = new TextBox
        {
            Multiline = true,
            ScrollBars = ScrollBars.Vertical,
            Font = new Font("Cascadia Mono, Consolas", 9.5f),
            Dock = DockStyle.Fill,
            AcceptsTab = true,
            WordWrap = false,
        };
        _input.Text = string.Join(Environment.NewLine, new[]
        {
            "# 예시 — 게임 UI에서 본 라벨 그대로",
            "# GK    12345    Alisson",
            "# DC    67890    Van Dijk",
            "",
        });
        var inputBody = new Panel { Dock = DockStyle.Fill, Padding = new Padding(0, 36, 0, 0) };
        inputBody.Controls.Add(_input);
        inputPanel.Controls.Add(inputBody);
        split.Panel1.Controls.Add(inputPanel);

        var outputPanel = new Panel { Dock = DockStyle.Fill, Padding = new Padding(8) };
        outputPanel.Controls.Add(new Label
        {
            Text = "출력 (TSV)",
            AutoSize = true,
            ForeColor = Color.DimGray,
        });
        _output = new TextBox
        {
            Multiline = true,
            ScrollBars = ScrollBars.Both,
            Font = new Font("Cascadia Mono, Consolas", 9f),
            Dock = DockStyle.Fill,
            ReadOnly = true,
            WordWrap = false,
            BackColor = Color.FromArgb(248, 248, 248),
        };
        var outputBody = new Panel { Dock = DockStyle.Fill, Padding = new Padding(0, 24, 0, 0) };
        outputBody.Controls.Add(_output);
        outputPanel.Controls.Add(outputBody);
        split.Panel2.Controls.Add(outputPanel);

        Controls.Add(split);

        var bottom = new FlowLayoutPanel
        {
            Dock = DockStyle.Bottom,
            Height = 44,
            Padding = new Padding(8, 6, 8, 6),
            BackColor = Color.FromArgb(245, 245, 245),
        };
        _runBtn = new Button { Text = "▶ Run", Width = 100, Height = 30 };
        _runBtn.Click += OnRun;
        bottom.Controls.Add(_runBtn);

        _copyBtn = new Button { Text = "📋 Copy TSV", Width = 110, Height = 30, Enabled = false };
        _copyBtn.Click += (_, __) =>
        {
            if (!string.IsNullOrEmpty(_output.Text))
                Clipboard.SetText(_output.Text);
        };
        bottom.Controls.Add(_copyBtn);

        _status = new Label
        {
            AutoSize = true,
            Padding = new Padding(12, 8, 0, 0),
            ForeColor = Color.DimGray,
        };
        bottom.Controls.Add(_status);

        Controls.Add(bottom);

        FormClosing += (_, __) => _cts?.Cancel();
    }

    private async void OnRun(object sender, EventArgs e)
    {
        var lines = ParseInput(_input.Text);
        if (lines.Count == 0)
        {
            _status.Text = "입력에 유효한 라인이 없습니다.";
            _status.ForeColor = Color.Crimson;
            return;
        }

        _runBtn.Enabled = false;
        _copyBtn.Enabled = false;
        _cts?.Dispose();
        _cts = new CancellationTokenSource();
        var ct = _cts.Token;

        var sb = new StringBuilder();
        sb.AppendLine("label\tuid\tname\taddr\tCA\tPA\tBY\tBM\tn_cand\tpos[24]");
        _output.Text = sb.ToString();

        for (int i = 0; i < lines.Count; i++)
        {
            if (ct.IsCancellationRequested) break;
            var (label, uid, name) = lines[i];

            _status.Text = $"[{i + 1}/{lines.Count}] {label}  UID={uid}  스캔 중…";
            _status.ForeColor = Color.DimGray;

            var hits = await Task.Run(() => PersonScanner.FindAll(_target, uid, ct), ct);

            string row;
            if (hits.Count == 0)
            {
                row = $"{label}\t{uid}\t{name}\t-\t-\t-\t-\t-\t0\t-";
            }
            else
            {
                var h = hits[0];
                var bytes = _target.Read((IntPtr)((long)h.Addr + PosBlockOffset), PosBlockSize);
                var posStr = bytes != null
                    ? string.Join(",", bytes.Select(b => b.ToString(CultureInfo.InvariantCulture)))
                    : "READ_FAIL";
                row = $"{label}\t{uid}\t{name}\t0x{h.Addr.ToInt64():X}\t{h.CA}\t{h.PA}\t{h.BirthYear}\t{h.BirthMonth}\t{hits.Count}\t{posStr}";
            }

            sb.AppendLine(row);
            _output.Text = sb.ToString();
            _output.SelectionStart = _output.Text.Length;
            _output.ScrollToCaret();
        }

        _status.Text = $"완료 — {lines.Count}건";
        _status.ForeColor = Color.DarkGreen;
        _runBtn.Enabled = true;
        _copyBtn.Enabled = true;
    }

    private static List<(string label, uint uid, string name)> ParseInput(string text)
    {
        var result = new List<(string, uint, string)>();
        if (string.IsNullOrWhiteSpace(text)) return result;

        foreach (var raw in text.Split('\n'))
        {
            var line = raw.Trim();
            if (line.Length == 0 || line.StartsWith("#")) continue;

            var parts = line.Split(new[] { ' ', '\t' }, 3, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length < 2) continue;

            var label = parts[0];
            if (!TryParseUid(parts[1], out uint uid)) continue;
            var name = parts.Length >= 3 ? parts[2].Trim() : "";

            result.Add((label, uid, name));
        }
        return result;
    }

    private static bool TryParseUid(string s, out uint v)
    {
        s = (s ?? "").Trim();
        if (s.StartsWith("0x", StringComparison.OrdinalIgnoreCase))
            return uint.TryParse(s.AsSpan(2), NumberStyles.HexNumber, null, out v);
        return uint.TryParse(s, out v);
    }
}
