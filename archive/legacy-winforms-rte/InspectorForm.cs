using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace FM26RTE;

/// <summary>
/// Hex viewer + manual byte/value editor centered on an address.
/// </summary>
public class InspectorForm : Form
{
    private readonly Target _target;
    private IntPtr _baseAddr;
    private int _bytesBefore = 128;
    private int _bytesAfter = 800;

    private readonly TextBox _addrBox;
    private readonly NumericUpDown _beforeBox;
    private readonly NumericUpDown _afterBox;
    private readonly Button _refreshBtn;
    private readonly RichTextBox _hexView;

    // Edit row
    private readonly TextBox _editAddr;
    private readonly ComboBox _editType;
    private readonly TextBox _editValue;
    private readonly Button _writeBtn;
    private readonly Label _writeStatus;

    // Known Fields panel — pulls Core + PPM subset from the central PlayerFields registry.
    private readonly FlowLayoutPanel _knownFieldsPanel;
    private readonly Dictionary<string, TextBox> _knownFieldBoxes = new();

    private static readonly FieldDef[] KnownFields =
        PlayerFields.All.Where(f =>
            f.Category == FieldCat.Core ||
            f.Category == FieldCat.PPM ||
            f.Category == FieldCat.Position).ToArray();

    public InspectorForm(Target target, IntPtr addr)
    {
        _target = target;
        _baseAddr = addr;

        Text = $"Inspector @ 0x{addr.ToInt64():X}";
        Width = 1000; Height = 700;
        Font = new Font("Segoe UI", 9f);

        // Address row
        var addrRow = new FlowLayoutPanel { Dock = DockStyle.Top, Height = 36, Padding = new Padding(8, 6, 8, 0) };
        addrRow.Controls.Add(new Label { Text = "Center:", AutoSize = true, Padding = new Padding(0, 6, 4, 0) });
        _addrBox = new TextBox { Width = 180, Text = $"0x{_baseAddr.ToInt64():X}", Font = new Font("Cascadia Mono, Consolas", 9f) };
        addrRow.Controls.Add(_addrBox);
        addrRow.Controls.Add(new Label { Text = "before:", AutoSize = true, Padding = new Padding(8, 6, 4, 0) });
        _beforeBox = new NumericUpDown { Width = 70, Minimum = 0, Maximum = 4096, Value = _bytesBefore, Increment = 16 };
        addrRow.Controls.Add(_beforeBox);
        addrRow.Controls.Add(new Label { Text = "after:", AutoSize = true, Padding = new Padding(8, 6, 4, 0) });
        _afterBox = new NumericUpDown { Width = 70, Minimum = 16, Maximum = 16384, Value = _bytesAfter, Increment = 16 };
        addrRow.Controls.Add(_afterBox);
        _refreshBtn = new Button { Text = "Refresh", Width = 80 };
        _refreshBtn.Click += (_, __) => RefreshView();
        addrRow.Controls.Add(_refreshBtn);
        Controls.Add(addrRow);

        // Hex view
        _hexView = new RichTextBox
        {
            Dock = DockStyle.Fill,
            ReadOnly = true,
            Font = new Font("Cascadia Mono, Consolas", 9.5f),
            WordWrap = false,
            BackColor = Color.FromArgb(248, 248, 248),
            DetectUrls = false,
        };
        Controls.Add(_hexView);

        // Known Fields Panel (Docked Right)
        _knownFieldsPanel = new FlowLayoutPanel
        {
            Dock = DockStyle.Right,
            Width = 220,
            Padding = new Padding(10),
            FlowDirection = FlowDirection.TopDown,
            BackColor = Color.WhiteSmoke,
            BorderStyle = BorderStyle.FixedSingle
        };
        _knownFieldsPanel.Controls.Add(new Label { Text = "Known Fields (from Center)", Font = new Font("Segoe UI", 9f, FontStyle.Bold), AutoSize = true, Margin = new Padding(0, 0, 0, 10) });

        foreach (var f in KnownFields)
        {
            var row = new FlowLayoutPanel { Width = 200, Height = 28, Margin = new Padding(0) };
            row.Controls.Add(new Label { Text = f.KorName, Width = 100, TextAlign = ContentAlignment.MiddleLeft });
            var tb = new TextBox { Width = 60, Name = f.Name, Tag = f };
            tb.KeyDown += OnKnownFieldKeyDown;
            row.Controls.Add(tb);
            _knownFieldBoxes[f.Name] = tb;
            _knownFieldsPanel.Controls.Add(row);
        }
        Controls.Add(_knownFieldsPanel);

        // Edit row
        var editRow = new FlowLayoutPanel { Dock = DockStyle.Bottom, Height = 64, Padding = new Padding(8, 6, 8, 6), BackColor = Color.FromArgb(245, 245, 245) };
        editRow.Controls.Add(new Label { Text = "Write to:", AutoSize = true, Padding = new Padding(0, 6, 4, 0) });
        _editAddr = new TextBox { Width = 180, Text = $"0x{_baseAddr.ToInt64():X}", Font = new Font("Cascadia Mono, Consolas", 9f) };
        editRow.Controls.Add(_editAddr);
        editRow.Controls.Add(new Label { Text = "type:", AutoSize = true, Padding = new Padding(8, 6, 4, 0) });
        _editType = new ComboBox { Width = 90, DropDownStyle = ComboBoxStyle.DropDownList };
        _editType.Items.AddRange(new object[] { "uint8", "int8", "uint16", "int16", "uint32", "int32", "uint64", "int64", "float", "bytes-hex" });
        _editType.SelectedIndex = 4; // uint32 default
        editRow.Controls.Add(_editType);
        editRow.Controls.Add(new Label { Text = "value:", AutoSize = true, Padding = new Padding(8, 6, 4, 0) });
        _editValue = new TextBox { Width = 200 };
        editRow.Controls.Add(_editValue);
        _writeBtn = new Button { Text = "Write", Width = 80 };
        _writeBtn.Click += OnWrite;
        editRow.Controls.Add(_writeBtn);
        _writeStatus = new Label { AutoSize = true, Padding = new Padding(8, 6, 0, 0), ForeColor = Color.Gray };
        editRow.Controls.Add(_writeStatus);
        Controls.Add(editRow);

        Shown += (_, __) => RefreshView();
        _hexView.MouseClick += OnHexClick;
    }

    private void RefreshView()
    {
        if (!TryParseAddr(_addrBox.Text, out long addr))
        {
            _hexView.Text = "(invalid address)";
            return;
        }
        _baseAddr = (IntPtr)addr;
        _bytesBefore = (int)_beforeBox.Value;
        _bytesAfter = (int)_afterBox.Value;

        var startAddr = (IntPtr)((long)_baseAddr - _bytesBefore);
        var len = _bytesBefore + _bytesAfter;
        var bytes = _target.Read(startAddr, len);
        if (bytes == null)
        {
            _hexView.Text = $"(read failed @ 0x{(long)startAddr:X}, {len} bytes — region unmapped or RPM error)";
            return;
        }

        Render(startAddr, bytes, _baseAddr);
        RefreshKnownFields();
    }

    private void RefreshKnownFields()
    {
        foreach (var f in KnownFields)
        {
            var fieldAddr = (IntPtr)((long)_baseAddr + f.Offset);
            var data = _target.Read(fieldAddr, f.Size);

            if (data == null || data.Length != f.Size)
            {
                _knownFieldBoxes[f.Name].Text = "ERR";
                continue;
            }

            _knownFieldBoxes[f.Name].Text = (f.Size == 2 ? BitConverter.ToInt16(data, 0) : data[0]).ToString();
        }
    }

    private void OnKnownFieldKeyDown(object sender, KeyEventArgs e)
    {
        if (e.KeyCode != Keys.Enter || sender is not TextBox tb) return;
        e.Handled = true;
        e.SuppressKeyPress = true;

        var f = (FieldDef)tb.Tag;
        var fieldAddr = (IntPtr)((long)_baseAddr + f.Offset);

        if (!int.TryParse(tb.Text, out int val))
        {
            MessageBox.Show("Invalid number");
            return;
        }

        byte[] bytes = f.Size == 2 ? BitConverter.GetBytes((short)val) : new[] { (byte)val };
        if (_target.TryWrite(fieldAddr, bytes))
        {
            tb.BackColor = Color.LightGreen;
            var t = new System.Windows.Forms.Timer { Interval = 500 };
            t.Tick += (_, __) => { tb.BackColor = SystemColors.Window; t.Stop(); t.Dispose(); };
            t.Start();
            RefreshView();
        }
        else
        {
            MessageBox.Show("Write failed.");
        }
    }

    private void Render(IntPtr startAddr, byte[] bytes, IntPtr highlight)
    {
        var sb = new StringBuilder();
        const int width = 16;
        for (int i = 0; i < bytes.Length; i += width)
        {
            var rowAddr = (long)startAddr + i;
            sb.Append($"{rowAddr:X12}  ");
            int rowEnd = Math.Min(i + width, bytes.Length);
            for (int j = i; j < rowEnd; j++)
            {
                sb.Append(bytes[j].ToString("X2"));
                sb.Append(j + 1 == rowEnd ? "  " : " ");
            }
            // pad if row is short
            for (int j = rowEnd - i; j < width; j++) sb.Append("   ");
            sb.Append("  ");
            for (int j = i; j < rowEnd; j++)
            {
                byte b = bytes[j];
                sb.Append(b >= 0x20 && b < 0x7F ? (char)b : '.');
            }
            sb.Append('\n');
        }

        // Append decoded interpretations for the highlight position
        if (highlight != IntPtr.Zero)
        {
            int off = (int)((long)highlight - (long)startAddr);
            sb.Append("\n--- Decoded at center ---\n");
            void deco(int sz, string label, Func<int, string> fmt)
            {
                if (off >= 0 && off + sz <= bytes.Length)
                    sb.Append($"  {label,-12} {fmt(off)}\n");
            }
            deco(1, "uint8",   o => bytes[o].ToString());
            deco(1, "int8",    o => ((sbyte)bytes[o]).ToString());
            deco(2, "uint16",  o => BitConverter.ToUInt16(bytes, o).ToString());
            deco(2, "int16",   o => BitConverter.ToInt16(bytes, o).ToString());
            deco(4, "uint32",  o => BitConverter.ToUInt32(bytes, o).ToString());
            deco(4, "int32",   o => BitConverter.ToInt32(bytes, o).ToString());
            deco(4, "float",   o => BitConverter.ToSingle(bytes, o).ToString("R"));
            deco(8, "uint64",  o => BitConverter.ToUInt64(bytes, o).ToString());
            deco(8, "int64",   o => BitConverter.ToInt64(bytes, o).ToString());
            deco(8, "ptr",     o => $"0x{BitConverter.ToInt64(bytes, o):X}");
        }

        _hexView.Text = sb.ToString();
        // Naive highlight: find the row with the center offset and color it.
        if (highlight != IntPtr.Zero)
        {
            int centerOff = (int)((long)highlight - (long)startAddr);
            // Row layout: 12 (addr) + 2 (sep) + 15*3 + 4 (last byte "XX  ") + 2 + 16 (ascii) + 1 (\n) = 82
            int rowStartChar = (centerOff / 16) * 82;
            try
            {
                _hexView.Select(0, _hexView.Text.Length);
                _hexView.SelectionColor = Color.Black;
                int startCol = 12 + 2 + (centerOff % 16) * 3;
                int absStart = rowStartChar + startCol;
                if (absStart < _hexView.Text.Length)
                {
                    _hexView.Select(absStart, 11); // 4 bytes = "XX XX XX XX" (11 chars)
                    _hexView.SelectionColor = Color.Crimson;
                    _hexView.SelectionFont = new Font(_hexView.Font, FontStyle.Bold);
                }
                _hexView.Select(0, 0);
            }
            catch { }
        }
    }

    private void OnHexClick(object sender, MouseEventArgs e)
    {
        // Click on a hex byte in the view -> set the edit address to that byte.
        int charIdx = _hexView.GetCharIndexFromPosition(e.Location);
        int line = _hexView.GetLineFromCharIndex(charIdx);
        if (line < 0) return;

        // Reconstruct: each hex line begins with 12 hex digits of address, then "  ", then 16 * "XX " bytes.
        int lineStart = _hexView.GetFirstCharIndexFromLine(line);
        int colInLine = charIdx - lineStart;
        if (colInLine < 14) return; // clicked on address area

        int byteOffset = (colInLine - 14) / 3;
        if (byteOffset < 0 || byteOffset > 15) return;

        var lineText = _hexView.Lines.Length > line ? _hexView.Lines[line] : "";
        if (lineText.Length < 12) return;
        if (!long.TryParse(lineText.Substring(0, 12), NumberStyles.HexNumber, null, out long lineAddr)) return;

        long target = lineAddr + byteOffset;
        _editAddr.Text = $"0x{target:X}";
        _writeStatus.Text = $"clicked offset 0x{target - (long)_baseAddr:+#;-#;0} from center";
        _writeStatus.ForeColor = Color.DimGray;
    }

    private void OnWrite(object sender, EventArgs e)
    {
        if (!TryParseAddr(_editAddr.Text, out long addr))
        {
            _writeStatus.Text = "invalid address"; _writeStatus.ForeColor = Color.Crimson; return;
        }

        var type = (string)_editType.SelectedItem;
        var raw = _editValue.Text.Trim();
        byte[] bytes;
        try { bytes = EncodeValue(type, raw); }
        catch (Exception ex)
        {
            _writeStatus.Text = $"encode error: {ex.Message}"; _writeStatus.ForeColor = Color.Crimson; return;
        }

        // Confirmation: writing to a real game is a destructive action.
        var oldBytes = _target.Read((IntPtr)addr, bytes.Length);
        var oldStr = oldBytes != null ? BitConverter.ToString(oldBytes).Replace("-", " ") : "(read failed)";
        var msg = $"Write {bytes.Length} bytes at 0x{addr:X}?\n\n" +
                  $"old: {oldStr}\n" +
                  $"new: {BitConverter.ToString(bytes).Replace("-", " ")}";
        if (MessageBox.Show(this, msg, "Confirm write", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) != DialogResult.OK)
            return;

        bool ok = _target.TryWrite((IntPtr)addr, bytes);
        if (ok)
        {
            _writeStatus.Text = $"wrote {bytes.Length} bytes."; _writeStatus.ForeColor = Color.DarkGreen;
            RefreshView();
        }
        else
        {
            _writeStatus.Text = "WriteProcessMemory failed."; _writeStatus.ForeColor = Color.Crimson;
        }
    }

    private static byte[] EncodeValue(string type, string raw)
    {
        switch (type)
        {
            case "uint8":  return new[] { byte.Parse(raw, NumberStyles.Integer, CultureInfo.InvariantCulture) };
            case "int8":   return new[] { (byte)sbyte.Parse(raw, CultureInfo.InvariantCulture) };
            case "uint16": return BitConverter.GetBytes(ushort.Parse(raw, CultureInfo.InvariantCulture));
            case "int16":  return BitConverter.GetBytes(short.Parse(raw, CultureInfo.InvariantCulture));
            case "uint32": return BitConverter.GetBytes(uint.Parse(raw, CultureInfo.InvariantCulture));
            case "int32":  return BitConverter.GetBytes(int.Parse(raw, CultureInfo.InvariantCulture));
            case "uint64": return BitConverter.GetBytes(ulong.Parse(raw, CultureInfo.InvariantCulture));
            case "int64":  return BitConverter.GetBytes(long.Parse(raw, CultureInfo.InvariantCulture));
            case "float":  return BitConverter.GetBytes(float.Parse(raw, CultureInfo.InvariantCulture));
            case "bytes-hex":
                {
                    var s = raw.Replace(" ", "").Replace("-", "").Replace("0x", "");
                    if (s.Length % 2 != 0) throw new Exception("hex must be even length");
                    var bs = new byte[s.Length / 2];
                    for (int i = 0; i < bs.Length; i++) bs[i] = byte.Parse(s.AsSpan(i * 2, 2), NumberStyles.HexNumber);
                    return bs;
                }
            default: throw new Exception("unknown type");
        }
    }

    private static bool TryParseAddr(string s, out long v)
    {
        s = (s ?? "").Trim();
        if (s.StartsWith("0x", StringComparison.OrdinalIgnoreCase))
            return long.TryParse(s.AsSpan(2), NumberStyles.HexNumber, null, out v);
        return long.TryParse(s, out v);
    }
}
