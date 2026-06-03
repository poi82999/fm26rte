using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FM26RTE;

public sealed class MvpMainForm : Form
{
    private enum PageKind
    {
        Basic,
        Attributes,
        Goalkeeping,
        Hidden,
        Positions,
        Traits,
    }

    private readonly Label _connectionLabel;
    private readonly TextBox _uidBox;
    private readonly Button _scanButton;
    private readonly Label _scanLabel;
    private readonly Label _playerLabel;
    private readonly FlowLayoutPanel _pagePanel;
    private readonly Panel _fieldHost;

    private Target _target;
    private CancellationTokenSource _scanCts;
    private PlayerEditPointers _pointers;
    private PageKind? _selectedPage;
    private readonly Dictionary<string, EditFieldState> _states = new();

    public MvpMainForm()
    {
        Text = "FM26 선수 에디터";
        Width = 1180;
        Height = 760;
        MinimumSize = new Size(980, 640);
        StartPosition = FormStartPosition.CenterScreen;
        Font = new Font("Segoe UI", 9.5f);

        var root = new TableLayoutPanel { Dock = DockStyle.Fill, RowCount = 2, ColumnCount = 1 };
        root.RowStyles.Add(new RowStyle(SizeType.Absolute, 92));
        root.RowStyles.Add(new RowStyle(SizeType.Percent, 100));
        Controls.Add(root);

        var top = new Panel
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(14, 10, 14, 8),
            BackColor = Color.FromArgb(245, 247, 250),
        };
        root.Controls.Add(top, 0, 0);

        top.Controls.Add(new Label
        {
            Text = "FM26 선수 에디터",
            Font = new Font("Segoe UI", 15f, FontStyle.Bold),
            AutoSize = true,
            Location = new Point(14, 8),
        });

        _connectionLabel = new Label
        {
            Text = "연결되지 않음",
            AutoSize = true,
            ForeColor = Color.DimGray,
            Location = new Point(18, 40),
        };
        top.Controls.Add(_connectionLabel);

        top.Controls.Add(new Label { Text = "선수 UID", AutoSize = true, Location = new Point(18, 66) });

        _uidBox = new TextBox
        {
            Width = 180,
            Location = new Point(92, 62),
            Font = new Font("Cascadia Mono, Consolas", 10f),
        };
        _uidBox.KeyDown += (_, e) =>
        {
            if (e.KeyCode != Keys.Enter) return;
            e.SuppressKeyPress = true;
            OnScanClick(this, EventArgs.Empty);
        };
        top.Controls.Add(_uidBox);

        _scanButton = new Button { Text = "검색", Width = 86, Height = 28, Location = new Point(282, 61) };
        _scanButton.Click += OnScanClick;
        top.Controls.Add(_scanButton);

        _scanLabel = new Label { AutoSize = true, ForeColor = Color.DimGray, Location = new Point(380, 66) };
        top.Controls.Add(_scanLabel);

        _playerLabel = new Label
        {
            Text = "불러온 선수가 없습니다",
            AutoSize = true,
            ForeColor = Color.FromArgb(40, 95, 150),
            Location = new Point(620, 66),
        };
        top.Controls.Add(_playerLabel);

        var body = new SplitContainer
        {
            Dock = DockStyle.Fill,
            SplitterDistance = 230,
            FixedPanel = FixedPanel.Panel1,
        };
        root.Controls.Add(body, 0, 1);

        _pagePanel = new FlowLayoutPanel
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(12),
            FlowDirection = FlowDirection.TopDown,
            WrapContents = false,
            AutoScroll = true,
            BackColor = Color.FromArgb(252, 252, 252),
        };
        body.Panel1.Controls.Add(_pagePanel);

        _fieldHost = new Panel { Dock = DockStyle.Fill, Padding = new Padding(16), AutoScroll = true, BackColor = Color.White };
        body.Panel2.Controls.Add(_fieldHost);

        BuildPageButtons();
        RenderEmptyFieldHost();

        Shown += (_, _) => TryAutoConnect();
        FormClosing += (_, _) =>
        {
            _scanCts?.Cancel();
            _scanCts?.Dispose();
            _target?.Dispose();
        };
    }

    private void TryAutoConnect()
    {
        if (_target != null) return;

        var process = Process.GetProcessesByName("fm").FirstOrDefault();
        if (process == null)
        {
            _connectionLabel.Text = "fm.exe를 찾을 수 없습니다. FM26을 먼저 실행해 주세요.";
            _connectionLabel.ForeColor = Color.FromArgb(180, 100, 0);
            return;
        }

        try
        {
            _target = Target.Attach(process.Id);
            _connectionLabel.Text = $"{process.ProcessName}.exe에 연결됨 (PID {process.Id})";
            _connectionLabel.ForeColor = Color.FromArgb(30, 130, 70);
        }
        catch (Exception ex)
        {
            _connectionLabel.Text = $"연결 실패: {ex.Message}";
            _connectionLabel.ForeColor = Color.Firebrick;
        }
    }

    private async void OnScanClick(object sender, EventArgs e)
    {
        TryAutoConnect();
        if (_target == null)
        {
            MessageBox.Show(this, "FM26 프로세스에 연결되지 않았습니다.", "연결 실패", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            return;
        }

        if (!TryParseUid(_uidBox.Text, out uint uid))
        {
            MessageBox.Show(this, "올바른 선수 UID를 입력해 주세요. 10진수와 0x 형식의 16진수를 지원합니다.");
            return;
        }

        _scanCts?.Cancel();
        _scanCts?.Dispose();
        _scanCts = new CancellationTokenSource();
        var token = _scanCts.Token;

        _scanButton.Enabled = false;
        _scanLabel.Text = "검색 중...";
        _scanLabel.ForeColor = Color.DimGray;
        _states.Clear();
        _pointers = default;
        _selectedPage = null;
        RenderEmptyFieldHost();

        var sw = Stopwatch.StartNew();
        try
        {
            var hits = await Task.Run(() => PlayerPointerScanner.FindByUid(
                _target,
                uid,
                token,
                (done, total) =>
                {
                    if (IsDisposed) return;
                    BeginInvoke((Action)(() => _scanLabel.Text = $"검색 중... {done}/{total}"));
                }), token);

            if (hits.Count == 0)
            {
                _scanLabel.Text = $"선수를 찾지 못했습니다 ({sw.Elapsed.TotalSeconds:F1}초)";
                _scanLabel.ForeColor = Color.FromArgb(180, 100, 0);
                _playerLabel.Text = "불러온 선수가 없습니다";
                return;
            }

            var hit = PickHit(hits);
            _pointers = hit.Pointers;
            _scanLabel.Text = $"찾음 ({sw.Elapsed.TotalSeconds:F1}초, 후보 {hits.Count}개)";
            _scanLabel.ForeColor = Color.FromArgb(30, 130, 70);
            _playerLabel.Text =
                $"UID {hit.Uid} | 인물 0x{hit.Pointers.Person.ToInt64():X} | 선수 0x{hit.Pointers.Player.ToInt64():X}";

            _selectedPage = PageKind.Basic;
            RenderPage(PageKind.Basic);
        }
        catch (OperationCanceledException)
        {
            _scanLabel.Text = "검색 취소됨";
            _scanLabel.ForeColor = Color.DimGray;
        }
        catch (Exception ex)
        {
            _scanLabel.Text = $"검색 실패: {ex.Message}";
            _scanLabel.ForeColor = Color.Firebrick;
        }
        finally
        {
            _scanButton.Enabled = true;
        }
    }

    private PlayerPointerHit PickHit(IReadOnlyList<PlayerPointerHit> hits)
    {
        if (hits.Count == 1) return hits[0];

        using var dlg = new Form
        {
            Text = "선수 후보 선택",
            Width = 720,
            Height = 360,
            StartPosition = FormStartPosition.CenterParent,
            MinimizeBox = false,
            MaximizeBox = false,
            FormBorderStyle = FormBorderStyle.FixedDialog,
        };

        var list = new ListBox { Dock = DockStyle.Fill, Font = new Font("Cascadia Mono, Consolas", 9.5f) };
        foreach (var hit in hits)
        {
            list.Items.Add(
                $"인물=0x{hit.Pointers.Person.ToInt64():X}  선수=0x{hit.Pointers.Player.ToInt64():X}  오프셋=0x{hit.DynamicOffset:X}");
        }
        list.SelectedIndex = 0;

        var ok = new Button { Text = "확인", Dock = DockStyle.Bottom, Height = 34, DialogResult = DialogResult.OK };
        dlg.AcceptButton = ok;
        dlg.Controls.Add(list);
        dlg.Controls.Add(ok);

        return dlg.ShowDialog(this) == DialogResult.OK && list.SelectedIndex >= 0 ? hits[list.SelectedIndex] : hits[0];
    }

    private void BuildPageButtons()
    {
        _pagePanel.Controls.Clear();
        _pagePanel.Controls.Add(new Label
        {
            Text = "항목",
            Font = new Font("Segoe UI", 11f, FontStyle.Bold),
            AutoSize = true,
            Margin = new Padding(0, 0, 0, 10),
        });

        foreach (var page in OrderedPages())
        {
            var button = new Button
            {
                Text = PageLabel(page),
                Width = 190,
                Height = 36,
                TextAlign = ContentAlignment.MiddleLeft,
                Tag = page,
                Margin = new Padding(0, 0, 0, 6),
            };
            button.Click += (_, _) =>
            {
                _selectedPage = page;
                RenderPage(page);
            };
            _pagePanel.Controls.Add(button);
        }
    }

    private void RenderEmptyFieldHost()
    {
        _fieldHost.Controls.Clear();
        _fieldHost.Controls.Add(new Label
        {
            Text = "선수 UID를 검색한 뒤 항목을 선택하세요.\r\n게임 안에서 확인 가능한 성격의 값은 바로 표시되고, 숨김/비공개 값은 '값 보기'를 눌러야 표시됩니다.",
            AutoSize = true,
            ForeColor = Color.DimGray,
            Location = new Point(16, 16),
        });
    }

    private void RenderPage(PageKind page)
    {
        _fieldHost.Controls.Clear();
        if (_pointers.Person == IntPtr.Zero || _pointers.Player == IntPtr.Zero)
        {
            RenderEmptyFieldHost();
            return;
        }

        switch (page)
        {
            case PageKind.Attributes:
                RenderAttributesPage();
                break;
            case PageKind.Positions:
                RenderPositionsPage();
                break;
            case PageKind.Traits:
                RenderTraitsPage();
                break;
            case PageKind.Goalkeeping:
                RenderSimpleList(PageLabel(page), PlayerEditCatalog.ByCategory(EditCategory.Goalkeeping));
                break;
            case PageKind.Hidden:
                RenderSimpleList(PageLabel(page), PlayerEditCatalog.ByCategory(EditCategory.Hidden));
                break;
            default:
                RenderSimpleList(PageLabel(page), PlayerEditCatalog.ByCategory(EditCategory.Basic));
                break;
        }
    }

    private void RenderSimpleList(string title, IEnumerable<EditFieldDef> fields)
    {
        AddTitle(title);
        int y = 52;
        foreach (var field in fields)
        {
            AddFieldRow(_fieldHost, field, 16, y, Math.Max(760, _fieldHost.ClientSize.Width - 56));
            y += 42;
        }
    }

    private void RenderAttributesPage()
    {
        AddTitle("능력치");

        var columns = new[]
        {
            (Title: "기술", Category: EditCategory.Technical, X: 16),
            (Title: "정신", Category: EditCategory.Mental, X: 330),
            (Title: "신체", Category: EditCategory.Physical, X: 644),
        };

        foreach (var column in columns)
        {
            _fieldHost.Controls.Add(new Label
            {
                Text = column.Title,
                Font = new Font("Segoe UI", 10.5f, FontStyle.Bold),
                AutoSize = true,
                Location = new Point(column.X, 52),
            });

            int y = 82;
            foreach (var field in PlayerEditCatalog.ByCategory(column.Category))
            {
                AddFieldRow(_fieldHost, field, column.X, y, 292, compact: true);
                y += 36;
            }
        }
    }

    private void RenderPositionsPage()
    {
        AddTitle("포지션 적합도");

        var pitch = new Panel
        {
            Width = 760,
            Height = 500,
            Location = new Point(16, 56),
            BackColor = Color.FromArgb(232, 244, 235),
            BorderStyle = BorderStyle.FixedSingle,
        };
        _fieldHost.Controls.Add(pitch);

        AddPositionBox(pitch, "pos_st", 278, 24);
        AddPositionBox(pitch, "pos_aml", 66, 96);
        AddPositionBox(pitch, "pos_amc", 278, 96);
        AddPositionBox(pitch, "pos_amr", 490, 96);
        AddPositionBox(pitch, "pos_ml", 66, 176);
        AddPositionBox(pitch, "pos_mc", 278, 176);
        AddPositionBox(pitch, "pos_mr", 490, 176);
        AddPositionBox(pitch, "pos_dm", 278, 256);
        AddPositionBox(pitch, "pos_wbl", 28, 292);
        AddPositionBox(pitch, "pos_wbr", 528, 292);
        AddPositionBox(pitch, "pos_dl", 66, 352);
        AddPositionBox(pitch, "pos_dc", 278, 352);
        AddPositionBox(pitch, "pos_dr", 490, 352);
        AddPositionBox(pitch, "pos_sw", 278, 404);
        AddPositionBox(pitch, "pos_gk", 278, 452);

        AddFieldRow(_fieldHost, PlayerEditCatalog.ByKey("preferred_central_position"), 770, 82, 270, compact: true);
    }

    private void RenderTraitsPage()
    {
        AddTitle("선호 플레이");
        int y = 52;

        foreach (var group in TraitGroups())
        {
            _fieldHost.Controls.Add(new Label
            {
                Text = group.Title,
                Font = new Font("Segoe UI", 10.5f, FontStyle.Bold),
                AutoSize = true,
                Location = new Point(16, y),
            });
            y += 28;

            int x = 16;
            foreach (var key in group.Keys)
            {
                AddTraitBox(PlayerEditCatalog.ByKey(key), x, y);
                x += 310;
                if (x + 300 > Math.Max(760, _fieldHost.ClientSize.Width - 30))
                {
                    x = 16;
                    y += 34;
                }
            }
            y += 50;
        }
    }

    private void AddTitle(string text)
    {
        _fieldHost.Controls.Add(new Label
        {
            Text = text,
            Font = new Font("Segoe UI", 13f, FontStyle.Bold),
            AutoSize = true,
            Location = new Point(16, 14),
        });
    }

    private void AddPositionBox(Control parent, string key, int x, int y)
    {
        AddFieldRow(parent, PlayerEditCatalog.ByKey(key), x, y, 205, compact: true);
    }

    private void AddTraitBox(EditFieldDef field, int x, int y)
    {
        EnsureAutoRead(field);

        var box = new Panel
        {
            Width = 300,
            Height = 30,
            Location = new Point(x, y),
            BackColor = Color.FromArgb(250, 250, 250),
            BorderStyle = BorderStyle.FixedSingle,
        };
        _fieldHost.Controls.Add(box);

        if (!_states.TryGetValue(field.Key, out var state) || !state.Loaded)
        {
            box.Controls.Add(new Label { Text = field.Label, Width = 210, Location = new Point(8, 6), AutoEllipsis = true });
            var read = new Button { Text = "보기", Width = 62, Height = 22, Location = new Point(230, 3) };
            read.Click += (_, _) => LoadField(field);
            box.Controls.Add(read);
            return;
        }

        var check = new CheckBox
        {
            Text = field.Label,
            Width = 214,
            Location = new Point(8, 4),
            Checked = Convert.ToBoolean(state.EditedValue),
        };
        check.CheckedChanged += (_, _) =>
        {
            state.EditedValue = check.Checked;
            state.Dirty = !Equals(state.OriginalValue, state.EditedValue);
        };
        box.Controls.Add(check);

        var apply = new Button { Text = "적용", Width = 58, Height = 22, Location = new Point(234, 3) };
        apply.Click += (_, _) => ApplyField(field);
        box.Controls.Add(apply);
    }

    private void AddFieldRow(Control parent, EditFieldDef field, int x, int y, int width, bool compact = false)
    {
        EnsureAutoRead(field);

        var row = new Panel
        {
            Width = width,
            Height = compact ? 32 : 36,
            Location = new Point(x, y),
            BorderStyle = BorderStyle.FixedSingle,
            BackColor = Color.FromArgb(250, 250, 250),
        };
        parent.Controls.Add(row);

        row.Controls.Add(new Label
        {
            Text = field.Label,
            Width = compact ? Math.Max(40, width - 104) : 260,
            Location = new Point(8, compact ? 7 : 8),
            AutoEllipsis = true,
        });

        if (!compact)
        {
            row.Controls.Add(new Label
            {
                Text = FieldMetaText(field),
                Width = 130,
                Location = new Point(270, 8),
                ForeColor = Color.Gray,
            });
        }

        if (!_states.TryGetValue(field.Key, out var state) || !state.Loaded)
        {
            var read = new Button
            {
                Text = compact ? "보기" : "값 보기",
                Width = compact ? 58 : 80,
                Height = 23,
                Location = compact ? new Point(width - 64, 4) : new Point(420, 5),
            };
            read.Click += (_, _) => LoadField(field);
            row.Controls.Add(read);
            return;
        }

        if (!compact)
        {
            row.Controls.Add(new Label
            {
                Text = $"현재값: {FormatValue(state.OriginalValue)}",
                Width = 130,
                Location = new Point(410, 8),
                ForeColor = Color.FromArgb(80, 80, 80),
            });
        }

        var editor = CreateEditor(field, state);
        if (compact && editor is NumericUpDown number)
            number.Width = 52;
        editor.Location = compact ? new Point(width - 104, 3) : new Point(550, 5);
        row.Controls.Add(editor);

        if (compact)
        {
            var save = new Button { Text = "적용", Width = 42, Height = 23, Location = new Point(width - 48, 4) };
            save.Click += (_, _) => ApplyField(field);
            row.Controls.Add(save);
            return;
        }

        var apply = new Button { Text = "적용", Width = 70, Height = 25, Location = new Point(660, 5) };
        apply.Click += (_, _) => ApplyField(field);
        row.Controls.Add(apply);

        var revert = new Button { Text = "되돌리기", Width = 78, Height = 25, Location = new Point(738, 5) };
        revert.Click += (_, _) => RevertField(field);
        row.Controls.Add(revert);
    }

    private Control CreateEditor(EditFieldDef field, EditFieldState state)
    {
        if (field.Kind == EditValueKind.Bit)
        {
            var check = new CheckBox { Width = 90, Checked = Convert.ToBoolean(state.EditedValue), Text = "활성" };
            check.CheckedChanged += (_, _) =>
            {
                state.EditedValue = check.Checked;
                state.Dirty = !Equals(state.OriginalValue, state.EditedValue);
            };
            return check;
        }

        var numeric = new NumericUpDown
        {
            Width = 78,
            Minimum = field.Min,
            Maximum = field.Max,
            Value = Convert.ToDecimal(state.EditedValue, CultureInfo.InvariantCulture),
        };
        numeric.ValueChanged += (_, _) =>
        {
            state.EditedValue = Decimal.ToInt32(numeric.Value);
            state.Dirty = !Equals(Convert.ToInt32(state.OriginalValue), Convert.ToInt32(state.EditedValue));
        };
        return numeric;
    }

    private void EnsureAutoRead(EditFieldDef field)
    {
        if (!ShouldAutoRead(field)) return;
        if (_states.TryGetValue(field.Key, out var state) && state.Loaded) return;

        if (EditFieldCodec.TryRead(_target, _pointers, field, out var value))
        {
            _states[field.Key] = new EditFieldState
            {
                Loaded = true,
                OriginalValue = value,
                EditedValue = value,
                Dirty = false,
            };
        }
    }

    private void LoadField(EditFieldDef field)
    {
        if (!EditFieldCodec.TryRead(_target, _pointers, field, out var value))
        {
            MessageBox.Show(this, $"값을 읽지 못했습니다: {field.Label}", "읽기 실패", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            return;
        }

        _states[field.Key] = new EditFieldState { Loaded = true, OriginalValue = value, EditedValue = value, Dirty = false };
        if (_selectedPage.HasValue) RenderPage(_selectedPage.Value);
    }

    private void ApplyField(EditFieldDef field)
    {
        if (!_states.TryGetValue(field.Key, out var state) || !state.Loaded) return;

        if (!EditFieldCodec.TryWrite(_target, _pointers, field, state.EditedValue))
        {
            MessageBox.Show(this, $"값을 쓰지 못했습니다: {field.Label}", "쓰기 실패", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            return;
        }

        state.OriginalValue = state.EditedValue;
        state.Dirty = false;
        if (_selectedPage.HasValue) RenderPage(_selectedPage.Value);
    }

    private void RevertField(EditFieldDef field)
    {
        if (!_states.TryGetValue(field.Key, out var state) || !state.Loaded) return;

        state.EditedValue = state.OriginalValue;
        state.Dirty = false;
        if (_selectedPage.HasValue) RenderPage(_selectedPage.Value);
    }

    private static bool ShouldAutoRead(EditFieldDef field)
    {
        if (field.Category == EditCategory.Hidden) return false;
        return field.Key is not ("ca" or "pa" or "current_rep" or "home_rep" or "world_rep");
    }

    private static string FieldMetaText(EditFieldDef field)
    {
        return field.Kind == EditValueKind.Bit ? "켜짐/꺼짐" : $"{field.Min}-{field.Max}";
    }

    private static string FormatValue(object value)
    {
        return value is bool b ? (b ? "켜짐" : "꺼짐") : Convert.ToString(value, CultureInfo.InvariantCulture);
    }

    private static IEnumerable<PageKind> OrderedPages()
    {
        yield return PageKind.Basic;
        yield return PageKind.Attributes;
        yield return PageKind.Goalkeeping;
        yield return PageKind.Positions;
        yield return PageKind.Traits;
        yield return PageKind.Hidden;
    }

    private static string PageLabel(PageKind page)
    {
        return page switch
        {
            PageKind.Basic => "기본 정보",
            PageKind.Attributes => "능력치",
            PageKind.Goalkeeping => "골키퍼",
            PageKind.Hidden => "숨김 / 비공개",
            PageKind.Positions => "포지션 적합도",
            PageKind.Traits => "선호 플레이",
            _ => page.ToString(),
        };
    }

    private static IEnumerable<(string Title, string[] Keys)> TraitGroups()
    {
        yield return ("움직임", new[]
        {
            "trait_moves_channels", "trait_no_moves_channels", "trait_gets_forward", "trait_gets_into_area",
            "trait_comes_deep", "trait_arrives_late", "trait_stays_back", "trait_back_to_goal",
        });
        yield return ("드리블 / 측면 플레이", new[]
        {
            "trait_run_left", "trait_run_right", "trait_run_center", "trait_runs_often", "trait_runs_rarely",
            "trait_hugs_line", "trait_cuts_inside_left", "trait_cuts_inside_right", "trait_cuts_inside_both",
            "trait_knocks_past", "trait_tries_tricks", "trait_beat_man_repeatedly",
        });
        yield return ("패스 / 빌드업", new[]
        {
            "trait_short_simple_passes", "trait_killer_balls", "trait_no_through_balls", "trait_one_twos",
            "trait_dictates_tempo", "trait_long_passes", "trait_switch_flank", "trait_play_out_trouble",
            "trait_dwells_ball",
        });
        yield return ("슈팅", new[]
        {
            "trait_shoots_distance", "trait_no_long_shots", "trait_shoots_power", "trait_places_shots",
            "trait_curls_ball", "trait_round_keeper", "trait_break_offside_trap", "trait_lob_keeper",
            "trait_overhead_kicks", "trait_first_time_shots", "trait_pass_not_score", "trait_long_free_kicks",
            "trait_fk_power",
        });
        yield return ("수비 / 성향", new[]
        {
            "trait_marks_tightly", "trait_dives_tackles", "trait_no_dives_tackles", "trait_winds_up",
            "trait_argues_officials", "trait_stops_play", "trait_brings_ball_out",
        });
        yield return ("발 사용 / 크로스 / 스로인 / 골키퍼", new[]
        {
            "trait_outside_foot", "trait_avoids_weaker_foot", "trait_right_foot_dribble", "trait_left_foot_dribble",
            "trait_crosses_early", "trait_ball_into_feet", "trait_long_flat_throw", "trait_long_throw_counters",
            "trait_plays_ball_feet", "trait_gets_crowd_going",
        });
    }

    private static bool TryParseUid(string text, out uint uid)
    {
        text = (text ?? "").Trim();
        if (text.StartsWith("0x", StringComparison.OrdinalIgnoreCase))
            return uint.TryParse(text.AsSpan(2), NumberStyles.HexNumber, null, out uid);
        return uint.TryParse(text, out uid);
    }
}
