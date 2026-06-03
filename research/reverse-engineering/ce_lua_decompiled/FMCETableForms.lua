local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1
L0_1 = "Football Manager Cheat Engine Table Forms"
L1_1 = "FMCETableForms"
L2_1 = "26.1.1.0"
L3_1 = "tdg6661"
L4_1 = ""
L5_1 = string
L5_1 = L5_1.format
L6_1 = string
L6_1 = L6_1.empty
if not L6_1 then
  L6_1 = STRING_EMPTY
  if not L6_1 then
    L6_1 = ""
  end
end
L7_1 = translate
L8_1 = {}
L8_1.Name = L0_1
L8_1.ClassName = L1_1
L8_1.Version = L2_1
L8_1.Author = L3_1
L8_1.License = L4_1
FMCETableForms = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2
  L1_2 = createForm
  L2_2 = false
  L1_2 = L1_2(L2_2)
  L2_2 = "Role Analyzer - "
  L3_2 = A0_2[11]
  L2_2 = L2_2 .. L3_2
  L1_2.Caption = L2_2
  L1_2.BorderStyle = "bsSingle"
  L1_2.Color = 2631720
  L1_2.Height = 647
  L1_2.Width = 730
  L2_2 = createFont
  L2_2 = L2_2()
  L2_2.CharSet = "ANSI_CHARSET"
  L2_2.Color = 14474460
  L2_2.Size = 10
  L2_2.Name = "Segoe UI Black"
  L2_2.Pitch = "fpVariable"
  L2_2.Quality = "fqDraft"
  L3_2 = createFont
  L3_2 = L3_2()
  L3_2.CharSet = "ANSI_CHARSET"
  L3_2.Color = 14474460
  L3_2.Size = 10
  L3_2.Name = "Bahnschrift"
  L3_2.Pitch = "fpVariable"
  L3_2.Quality = "fqDraft"
  L4_2 = createLabel
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.AnchorSideLeft
  L5_2.Control = L1_2
  L5_2 = L4_2.AnchorSideTop
  L5_2.Control = L1_2
  L5_2 = L4_2.AnchorSideRight
  L5_2.Control = L1_2
  L5_2 = L4_2.AnchorSideRight
  L6_2 = asrBottom
  L5_2.Side = L6_2
  L4_2.Alignment = "taCenter"
  L4_2.Anchors = "[akTop, akLeft, akRight]"
  L5_2 = L4_2.BorderSpacing
  L5_2.Top = 3
  L5_2 = L4_2.BorderSpacing
  L5_2.Bottom = 3
  L5_2 = L4_2.BorderSpacing
  L5_2.Around = 10
  L5_2 = A0_2[11]
  L4_2.Caption = L5_2
  L4_2.Font = L3_2
  L5_2 = L4_2.Font
  L5_2.Size = 13
  L5_2 = createPanel
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  L6_2 = L5_2.AnchorSideLeft
  L6_2.Control = L1_2
  L6_2 = L5_2.AnchorSideTop
  L6_2.Control = L4_2
  L6_2 = L5_2.AnchorSideTop
  L7_2 = asrBottom
  L6_2.Side = L7_2
  L5_2.Height = 290
  L5_2.Width = 230
  L6_2 = L5_2.BorderSpacing
  L6_2.Around = 10
  L5_2.Color = 2631720
  L6_2 = createLabel
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = L6_2.AnchorSideLeft
  L7_2.Control = L5_2
  L7_2 = L6_2.AnchorSideTop
  L7_2.Control = L5_2
  L7_2 = L6_2.AnchorSideRight
  L7_2.Control = L5_2
  L7_2 = L6_2.AnchorSideRight
  L8_2 = asrBottom
  L7_2.Side = L8_2
  L6_2.Alignment = "taCenter"
  L6_2.Anchors = "[akTop, akLeft, akRight]"
  L7_2 = L6_2.BorderSpacing
  L7_2.Around = 10
  L6_2.Caption = "GENERAL"
  L7_2 = clTeal
  L6_2.Color = L7_2
  L6_2.Font = L2_2
  L7_2 = createLabel
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2.AnchorSideLeft
  L8_2.Control = L5_2
  L8_2 = L7_2.AnchorSideTop
  L8_2.Control = L6_2
  L8_2 = L7_2.AnchorSideTop
  L9_2 = asrBottom
  L8_2.Side = L9_2
  L8_2 = L7_2.AnchorSideRight
  L8_2.Control = L5_2
  L8_2 = L7_2.AnchorSideRight
  L9_2 = asrBottom
  L8_2.Side = L9_2
  L7_2.Alignment = "taCenter"
  L7_2.Anchors = "[akTop, akLeft, akRight]"
  L8_2 = L7_2.BorderSpacing
  L8_2.Top = 10
  L8_2 = A0_2[6]
  L7_2.Caption = L8_2
  L7_2.Font = L3_2
  L8_2 = L7_2.Font
  L8_2.Size = 13
  L8_2 = createLabel
  L9_2 = L5_2
  L8_2 = L8_2(L9_2)
  L9_2 = L8_2.AnchorSideLeft
  L9_2.Control = L5_2
  L9_2 = L8_2.AnchorSideTop
  L9_2.Control = L7_2
  L9_2 = L8_2.AnchorSideTop
  L10_2 = asrBottom
  L9_2.Side = L10_2
  L9_2 = L8_2.AnchorSideRight
  L9_2.Control = L5_2
  L9_2 = L8_2.AnchorSideRight
  L10_2 = asrBottom
  L9_2.Side = L10_2
  L8_2.Alignment = "taCenter"
  L8_2.Anchors = "[akTop, akLeft, akRight]"
  L9_2 = L8_2.BorderSpacing
  L9_2.Top = 5
  L8_2.Caption = "Preferred Foot"
  L8_2.Font = L3_2
  L9_2 = L8_2.Font
  L9_2.Size = 8
  L9_2 = L8_2.Font
  L9_2.Style = "[fsItalic]"
  L9_2 = createLabel
  L10_2 = L5_2
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2.AnchorSideLeft
  L10_2.Control = L5_2
  L10_2 = L9_2.AnchorSideTop
  L10_2.Control = L8_2
  L10_2 = L9_2.AnchorSideTop
  L11_2 = asrBottom
  L10_2.Side = L11_2
  L10_2 = L9_2.AnchorSideRight
  L10_2.Control = L5_2
  L10_2 = L9_2.AnchorSideRight
  L11_2 = asrBottom
  L10_2.Side = L11_2
  L9_2.Alignment = "taCenter"
  L9_2.Anchors = "[akTop, akLeft, akRight]"
  L10_2 = L9_2.BorderSpacing
  L10_2.Top = 10
  L10_2 = A0_2[7]
  L9_2.Caption = L10_2
  L9_2.Font = L3_2
  L10_2 = L9_2.Font
  L10_2.Size = 13
  L10_2 = createLabel
  L11_2 = L5_2
  L10_2 = L10_2(L11_2)
  L11_2 = L10_2.AnchorSideLeft
  L11_2.Control = L5_2
  L11_2 = L10_2.AnchorSideTop
  L11_2.Control = L9_2
  L11_2 = L10_2.AnchorSideTop
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L11_2 = L10_2.AnchorSideRight
  L11_2.Control = L5_2
  L11_2 = L10_2.AnchorSideRight
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L10_2.Alignment = "taCenter"
  L10_2.Anchors = "[akTop, akLeft, akRight]"
  L11_2 = L10_2.BorderSpacing
  L11_2.Top = 5
  L10_2.Caption = "Height"
  L10_2.Font = L3_2
  L11_2 = L10_2.Font
  L11_2.Size = 8
  L11_2 = L10_2.Font
  L11_2.Style = "[fsItalic]"
  L11_2 = createLabel
  L12_2 = L5_2
  L11_2 = L11_2(L12_2)
  L12_2 = L11_2.AnchorSideLeft
  L12_2.Control = L5_2
  L12_2 = L11_2.AnchorSideTop
  L12_2.Control = L10_2
  L12_2 = L11_2.AnchorSideTop
  L13_2 = asrBottom
  L12_2.Side = L13_2
  L12_2 = L11_2.AnchorSideRight
  L12_2.Control = L5_2
  L12_2 = L11_2.AnchorSideRight
  L13_2 = asrBottom
  L12_2.Side = L13_2
  L11_2.Alignment = "taCenter"
  L11_2.Anchors = "[akTop, akLeft, akRight]"
  L12_2 = L11_2.BorderSpacing
  L12_2.Top = 10
  L12_2 = A0_2[8]
  L11_2.Caption = L12_2
  L11_2.Font = L3_2
  L12_2 = L11_2.Font
  L12_2.Size = 13
  L12_2 = createLabel
  L13_2 = L5_2
  L12_2 = L12_2(L13_2)
  L13_2 = L12_2.AnchorSideLeft
  L13_2.Control = L5_2
  L13_2 = L12_2.AnchorSideTop
  L13_2.Control = L11_2
  L13_2 = L12_2.AnchorSideTop
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L13_2 = L12_2.AnchorSideRight
  L13_2.Control = L5_2
  L13_2 = L12_2.AnchorSideRight
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L12_2.Alignment = "taCenter"
  L12_2.Anchors = "[akTop, akLeft, akRight]"
  L13_2 = L12_2.BorderSpacing
  L13_2.Top = 5
  L12_2.Caption = "Weight"
  L12_2.Font = L3_2
  L13_2 = L12_2.Font
  L13_2.Size = 8
  L13_2 = L12_2.Font
  L13_2.Style = "[fsItalic]"
  L13_2 = createLabel
  L14_2 = L5_2
  L13_2 = L13_2(L14_2)
  L14_2 = L13_2.AnchorSideLeft
  L14_2.Control = L5_2
  L14_2 = L13_2.AnchorSideTop
  L14_2.Control = L12_2
  L14_2 = L13_2.AnchorSideTop
  L15_2 = asrBottom
  L14_2.Side = L15_2
  L14_2 = L13_2.AnchorSideRight
  L14_2.Control = L5_2
  L14_2 = L13_2.AnchorSideRight
  L15_2 = asrBottom
  L14_2.Side = L15_2
  L13_2.Alignment = "taCenter"
  L13_2.Anchors = "[akTop, akLeft, akRight]"
  L14_2 = L13_2.BorderSpacing
  L14_2.Top = 10
  L14_2 = A0_2[9]
  L13_2.Caption = L14_2
  L13_2.Font = L3_2
  L14_2 = L13_2.Font
  L14_2.Size = 13
  L14_2 = createLabel
  L15_2 = L5_2
  L14_2 = L14_2(L15_2)
  L15_2 = L14_2.AnchorSideLeft
  L15_2.Control = L5_2
  L15_2 = L14_2.AnchorSideTop
  L15_2.Control = L13_2
  L15_2 = L14_2.AnchorSideTop
  L16_2 = asrBottom
  L15_2.Side = L16_2
  L15_2 = L14_2.AnchorSideRight
  L15_2.Control = L5_2
  L15_2 = L14_2.AnchorSideRight
  L16_2 = asrBottom
  L15_2.Side = L16_2
  L14_2.Alignment = "taCenter"
  L14_2.Anchors = "[akTop, akLeft, akRight]"
  L15_2 = L14_2.BorderSpacing
  L15_2.Top = 5
  L14_2.Caption = "Progress Rate"
  L14_2.Font = L3_2
  L15_2 = L14_2.Font
  L15_2.Size = 8
  L15_2 = L14_2.Font
  L15_2.Style = "[fsItalic]"
  L15_2 = createLabel
  L16_2 = L5_2
  L15_2 = L15_2(L16_2)
  L16_2 = L15_2.AnchorSideLeft
  L16_2.Control = L5_2
  L16_2 = L15_2.AnchorSideTop
  L16_2.Control = L14_2
  L16_2 = L15_2.AnchorSideTop
  L17_2 = asrBottom
  L16_2.Side = L17_2
  L16_2 = L15_2.AnchorSideRight
  L16_2.Control = L5_2
  L16_2 = L15_2.AnchorSideRight
  L17_2 = asrBottom
  L16_2.Side = L17_2
  L15_2.Alignment = "taCenter"
  L15_2.Anchors = "[akTop, akLeft, akRight]"
  L16_2 = L15_2.BorderSpacing
  L16_2.Top = 10
  L16_2 = A0_2[10]
  L15_2.Caption = L16_2
  L15_2.Font = L3_2
  L16_2 = L15_2.Font
  L16_2.Size = 13
  L16_2 = createLabel
  L17_2 = L5_2
  L16_2 = L16_2(L17_2)
  L17_2 = L16_2.AnchorSideLeft
  L17_2.Control = L5_2
  L17_2 = L16_2.AnchorSideTop
  L17_2.Control = L15_2
  L17_2 = L16_2.AnchorSideTop
  L18_2 = asrBottom
  L17_2.Side = L18_2
  L17_2 = L16_2.AnchorSideRight
  L17_2.Control = L5_2
  L17_2 = L16_2.AnchorSideRight
  L18_2 = asrBottom
  L17_2.Side = L18_2
  L16_2.Alignment = "taCenter"
  L16_2.Anchors = "[akTop, akLeft, akRight]"
  L17_2 = L16_2.BorderSpacing
  L17_2.Top = 5
  L16_2.Caption = "DNA"
  L16_2.Font = L3_2
  L17_2 = L16_2.Font
  L17_2.Size = 8
  L17_2 = L16_2.Font
  L17_2.Style = "[fsItalic]"
  L16_2.ShowHint = true
  L16_2.Hint = "DNA Score is a mean of Bravery, Composure, Concentration, Determination & Teamwork. These are attributes that don\226\128\153t increase much through training. They mostly increase for a player in the age 16-24 through playing time, player personality and mentoring. A player with a low DNA score might not react well to interactions, lack consistency, struggle in big games, not react well while chasing a game, struggle to turnaround poor form etc. You could say this is the mentality or attitude of a player. Be wary of a DNA score of <40% for youngsters and <60% for peak players."
  
  function L17_2(A0_3)
    local L1_3, L2_3
    L1_3 = A0_3.Font
    L2_3 = clLime
    L1_3.Color = L2_3
  end
  
  L16_2.OnMouseEnter = L17_2
  
  function L17_2(A0_3)
    local L1_3
    L1_3 = A0_3.Font
    L1_3.Color = 14474460
  end
  
  L16_2.OnMouseLeave = L17_2
  L17_2 = createPanel
  L18_2 = L1_2
  L17_2 = L17_2(L18_2)
  L18_2 = L17_2.AnchorSideLeft
  L18_2.Control = L5_2
  L18_2 = L17_2.AnchorSideLeft
  L19_2 = asrBottom
  L18_2.Side = L19_2
  L18_2 = L17_2.AnchorSideTop
  L18_2.Control = L4_2
  L18_2 = L17_2.AnchorSideTop
  L19_2 = asrBottom
  L18_2.Side = L19_2
  L17_2.Height = 290
  L17_2.Width = 230
  L18_2 = L17_2.BorderSpacing
  L18_2.Around = 10
  L17_2.Color = 2631720
  L18_2 = createLabel
  L19_2 = L17_2
  L18_2 = L18_2(L19_2)
  L19_2 = L18_2.AnchorSideLeft
  L19_2.Control = L17_2
  L19_2 = L18_2.AnchorSideTop
  L19_2.Control = L17_2
  L19_2 = L18_2.AnchorSideRight
  L19_2.Control = L17_2
  L19_2 = L18_2.AnchorSideRight
  L20_2 = asrBottom
  L19_2.Side = L20_2
  L18_2.Alignment = "taCenter"
  L18_2.Anchors = "[akTop, akLeft, akRight]"
  L19_2 = L18_2.BorderSpacing
  L19_2.Around = 10
  L18_2.Caption = "GK"
  L19_2 = clNavy
  L18_2.Color = L19_2
  L18_2.Font = L2_2
  L19_2 = createLabel
  L20_2 = L17_2
  L19_2 = L19_2(L20_2)
  L20_2 = L19_2.AnchorSideLeft
  L20_2.Control = L17_2
  L20_2 = L19_2.AnchorSideTop
  L20_2.Control = L18_2
  L20_2 = L19_2.AnchorSideTop
  L21_2 = asrBottom
  L20_2.Side = L21_2
  L20_2 = L19_2.AnchorSideRight
  L20_2.Control = L17_2
  L20_2 = L19_2.AnchorSideRight
  L21_2 = asrBottom
  L20_2.Side = L21_2
  L19_2.Anchors = "[akTop, akLeft, akRight]"
  L20_2 = L19_2.BorderSpacing
  L20_2.Around = 11
  L20_2 = A0_2[1]
  L19_2.Caption = L20_2
  L19_2.Font = L3_2
  L20_2 = createPanel
  L21_2 = L1_2
  L20_2 = L20_2(L21_2)
  L21_2 = L20_2.AnchorSideLeft
  L21_2.Control = L17_2
  L21_2 = L20_2.AnchorSideLeft
  L22_2 = asrBottom
  L21_2.Side = L22_2
  L21_2 = L20_2.AnchorSideTop
  L21_2.Control = L4_2
  L21_2 = L20_2.AnchorSideTop
  L22_2 = asrBottom
  L21_2.Side = L22_2
  L20_2.Height = 290
  L20_2.Width = 230
  L21_2 = L20_2.BorderSpacing
  L21_2.Around = 10
  L20_2.Color = 2631720
  L21_2 = createLabel
  L22_2 = L20_2
  L21_2 = L21_2(L22_2)
  L22_2 = L21_2.AnchorSideLeft
  L22_2.Control = L20_2
  L22_2 = L21_2.AnchorSideTop
  L22_2.Control = L20_2
  L22_2 = L21_2.AnchorSideRight
  L22_2.Control = L20_2
  L22_2 = L21_2.AnchorSideRight
  L23_2 = asrBottom
  L22_2.Side = L23_2
  L21_2.Alignment = "taCenter"
  L21_2.Anchors = "[akTop, akLeft, akRight]"
  L22_2 = L21_2.BorderSpacing
  L22_2.Around = 10
  L21_2.Caption = "DC/DRL/WBRL"
  L21_2.Color = 16744448
  L21_2.Font = L2_2
  L22_2 = createLabel
  L23_2 = L20_2
  L22_2 = L22_2(L23_2)
  L23_2 = L22_2.AnchorSideLeft
  L23_2.Control = L20_2
  L23_2 = L22_2.AnchorSideTop
  L23_2.Control = L21_2
  L23_2 = L22_2.AnchorSideTop
  L24_2 = asrBottom
  L23_2.Side = L24_2
  L23_2 = L22_2.AnchorSideRight
  L23_2.Control = L20_2
  L23_2 = L22_2.AnchorSideRight
  L24_2 = asrBottom
  L23_2.Side = L24_2
  L22_2.Anchors = "[akTop, akLeft, akRight]"
  L23_2 = L22_2.BorderSpacing
  L23_2.Around = 11
  L23_2 = A0_2[2]
  L22_2.Caption = L23_2
  L22_2.Font = L3_2
  L23_2 = createPanel
  L24_2 = L1_2
  L23_2 = L23_2(L24_2)
  L24_2 = L23_2.AnchorSideLeft
  L24_2.Control = L1_2
  L24_2 = L23_2.AnchorSideTop
  L24_2.Control = L5_2
  L24_2 = L23_2.AnchorSideTop
  L25_2 = asrBottom
  L24_2.Side = L25_2
  L24_2 = L23_2.AnchorSideBottom
  L24_2.Control = L1_2
  L24_2 = L23_2.AnchorSideBottom
  L25_2 = asrBottom
  L24_2.Side = L25_2
  L23_2.Height = 290
  L23_2.Width = 230
  L23_2.Anchors = "[akTop, akLeft, akBottom]"
  L24_2 = L23_2.BorderSpacing
  L24_2.Around = 10
  L23_2.Color = 2631720
  L24_2 = createLabel
  L25_2 = L23_2
  L24_2 = L24_2(L25_2)
  L25_2 = L24_2.AnchorSideLeft
  L25_2.Control = L23_2
  L25_2 = L24_2.AnchorSideTop
  L25_2.Control = L23_2
  L25_2 = L24_2.AnchorSideRight
  L25_2.Control = L23_2
  L25_2 = L24_2.AnchorSideRight
  L26_2 = asrBottom
  L25_2.Side = L26_2
  L24_2.Alignment = "taCenter"
  L24_2.Anchors = "[akTop, akLeft, akRight]"
  L25_2 = L24_2.BorderSpacing
  L25_2.Around = 10
  L24_2.Caption = "DM/CM"
  L24_2.Color = 4259584
  L24_2.Font = L2_2
  L25_2 = createLabel
  L26_2 = L23_2
  L25_2 = L25_2(L26_2)
  L26_2 = L25_2.AnchorSideLeft
  L26_2.Control = L23_2
  L26_2 = L25_2.AnchorSideTop
  L26_2.Control = L24_2
  L26_2 = L25_2.AnchorSideTop
  L27_2 = asrBottom
  L26_2.Side = L27_2
  L26_2 = L25_2.AnchorSideRight
  L26_2.Control = L23_2
  L26_2 = L25_2.AnchorSideRight
  L27_2 = asrBottom
  L26_2.Side = L27_2
  L25_2.Anchors = "[akTop, akLeft, akRight]"
  L26_2 = L25_2.BorderSpacing
  L26_2.Around = 11
  L26_2 = A0_2[3]
  L25_2.Caption = L26_2
  L25_2.Font = L3_2
  L26_2 = createPanel
  L27_2 = L1_2
  L26_2 = L26_2(L27_2)
  L27_2 = L26_2.AnchorSideLeft
  L27_2.Control = L23_2
  L27_2 = L26_2.AnchorSideLeft
  L28_2 = asrBottom
  L27_2.Side = L28_2
  L27_2 = L26_2.AnchorSideTop
  L27_2.Control = L5_2
  L27_2 = L26_2.AnchorSideTop
  L28_2 = asrBottom
  L27_2.Side = L28_2
  L27_2 = L26_2.AnchorSideBottom
  L27_2.Control = L1_2
  L27_2 = L26_2.AnchorSideBottom
  L28_2 = asrBottom
  L27_2.Side = L28_2
  L26_2.Height = 290
  L26_2.Width = 230
  L26_2.Anchors = "[akTop, akLeft, akBottom]"
  L27_2 = L26_2.BorderSpacing
  L27_2.Around = 10
  L26_2.Color = 2631720
  L27_2 = createLabel
  L28_2 = L26_2
  L27_2 = L27_2(L28_2)
  L28_2 = L27_2.AnchorSideLeft
  L28_2.Control = L26_2
  L28_2 = L27_2.AnchorSideTop
  L28_2.Control = L26_2
  L28_2 = L27_2.AnchorSideRight
  L28_2.Control = L26_2
  L28_2 = L27_2.AnchorSideRight
  L29_2 = asrBottom
  L28_2.Side = L29_2
  L27_2.Alignment = "taCenter"
  L27_2.Anchors = "[akTop, akLeft, akRight]"
  L28_2 = L27_2.BorderSpacing
  L28_2.Around = 10
  L27_2.Caption = "MRL/AMRL"
  L27_2.Color = 33023
  L27_2.Font = L2_2
  L28_2 = createLabel
  L29_2 = L26_2
  L28_2 = L28_2(L29_2)
  L29_2 = L28_2.AnchorSideLeft
  L29_2.Control = L26_2
  L29_2 = L28_2.AnchorSideTop
  L29_2.Control = L27_2
  L29_2 = L28_2.AnchorSideTop
  L30_2 = asrBottom
  L29_2.Side = L30_2
  L29_2 = L28_2.AnchorSideRight
  L29_2.Control = L26_2
  L29_2 = L28_2.AnchorSideRight
  L30_2 = asrBottom
  L29_2.Side = L30_2
  L28_2.Anchors = "[akTop, akLeft, akRight]"
  L29_2 = L28_2.BorderSpacing
  L29_2.Around = 11
  L29_2 = A0_2[4]
  L28_2.Caption = L29_2
  L28_2.Font = L3_2
  L29_2 = createPanel
  L30_2 = L1_2
  L29_2 = L29_2(L30_2)
  L30_2 = L29_2.AnchorSideLeft
  L30_2.Control = L26_2
  L30_2 = L29_2.AnchorSideLeft
  L31_2 = asrBottom
  L30_2.Side = L31_2
  L30_2 = L29_2.AnchorSideTop
  L30_2.Control = L5_2
  L30_2 = L29_2.AnchorSideTop
  L31_2 = asrBottom
  L30_2.Side = L31_2
  L30_2 = L29_2.AnchorSideBottom
  L30_2.Control = L1_2
  L30_2 = L29_2.AnchorSideBottom
  L31_2 = asrBottom
  L30_2.Side = L31_2
  L29_2.Height = 290
  L29_2.Width = 230
  L29_2.Anchors = "[akTop, akLeft, akBottom]"
  L30_2 = L29_2.BorderSpacing
  L30_2.Around = 10
  L29_2.Color = 2631720
  L30_2 = createLabel
  L31_2 = L29_2
  L30_2 = L30_2(L31_2)
  L31_2 = L30_2.AnchorSideLeft
  L31_2.Control = L29_2
  L31_2 = L30_2.AnchorSideTop
  L31_2.Control = L29_2
  L31_2 = L30_2.AnchorSideRight
  L31_2.Control = L29_2
  L31_2 = L30_2.AnchorSideRight
  L32_2 = asrBottom
  L31_2.Side = L32_2
  L30_2.Alignment = "taCenter"
  L30_2.Anchors = "[akTop, akLeft, akRight]"
  L31_2 = L30_2.BorderSpacing
  L31_2.Around = 10
  L30_2.Caption = "AM/ST"
  L31_2 = clPurple
  L30_2.Color = L31_2
  L30_2.Font = L2_2
  L31_2 = createLabel
  L32_2 = L29_2
  L31_2 = L31_2(L32_2)
  L32_2 = L31_2.AnchorSideLeft
  L32_2.Control = L29_2
  L32_2 = L31_2.AnchorSideTop
  L32_2.Control = L30_2
  L32_2 = L31_2.AnchorSideTop
  L33_2 = asrBottom
  L32_2.Side = L33_2
  L32_2 = L31_2.AnchorSideRight
  L32_2.Control = L29_2
  L32_2 = L31_2.AnchorSideRight
  L33_2 = asrBottom
  L32_2.Side = L33_2
  L31_2.Anchors = "[akTop, akLeft, akRight]"
  L32_2 = L31_2.BorderSpacing
  L32_2.Around = 11
  L32_2 = A0_2[5]
  L31_2.Caption = L32_2
  L31_2.Font = L3_2
  L32_2 = L1_2.Show
  L32_2()
end

roleAnalyzer = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2, L60_2, L61_2, L62_2, L63_2, L64_2, L65_2, L66_2, L67_2, L68_2, L69_2, L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2
  L1_2 = nil
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_15
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_15::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_25
    end
  end
  do return end
  ::lbl_25::
  L2_2 = getPlayerData
  L2_2 = L2_2()
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = tonumber
  L4_2 = L2_2.Adaptability
  L4_2 = L4_2.value
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = L2_2.Ambition
  L5_2 = L5_2.value
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = L2_2.Loyalty
  L6_2 = L6_2.value
  L5_2 = L5_2(L6_2)
  L6_2 = tonumber
  L7_2 = L2_2.Pressure
  L7_2 = L7_2.value
  L6_2 = L6_2(L7_2)
  L7_2 = tonumber
  L8_2 = L2_2.Professionalism
  L8_2 = L8_2.value
  L7_2 = L7_2(L8_2)
  L8_2 = tonumber
  L9_2 = L2_2.Sportmanship
  L9_2 = L9_2.value
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = L2_2.Temperament
  L10_2 = L10_2.value
  L9_2 = L9_2(L10_2)
  L10_2 = tonumber
  L11_2 = L2_2.Controversy
  L11_2 = L11_2.value
  L10_2 = L10_2(L11_2)
  L11_2 = tonumber
  L12_2 = L2_2.Consistency
  L12_2 = L12_2.value
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = L2_2.Dirtiness
  L13_2 = L13_2.value
  L12_2 = L12_2(L13_2)
  L13_2 = tonumber
  L14_2 = L2_2.ImportantMatches
  L14_2 = L14_2.value
  L13_2 = L13_2(L14_2)
  L14_2 = tonumber
  L15_2 = L2_2.InjuryProness
  L15_2 = L15_2.value
  L14_2 = L14_2(L15_2)
  L15_2 = tonumber
  L16_2 = L2_2.Versatility
  L16_2 = L16_2.value
  L15_2 = L15_2(L16_2)
  L16_2 = tonumber
  L17_2 = L2_2.AerialAbility
  L17_2 = L17_2.value
  L16_2 = L16_2(L17_2)
  L17_2 = tonumber
  L18_2 = L2_2.CommandOfArea
  L18_2 = L18_2.value
  L17_2 = L17_2(L18_2)
  L18_2 = tonumber
  L19_2 = L2_2.Communication
  L19_2 = L19_2.value
  L18_2 = L18_2(L19_2)
  L19_2 = tonumber
  L20_2 = L2_2.Eccentricity
  L20_2 = L20_2.value
  L19_2 = L19_2(L20_2)
  L20_2 = tonumber
  L21_2 = L2_2.Handling
  L21_2 = L21_2.value
  L20_2 = L20_2(L21_2)
  L21_2 = tonumber
  L22_2 = L2_2.Kicking
  L22_2 = L22_2.value
  L21_2 = L21_2(L22_2)
  L22_2 = tonumber
  L23_2 = L2_2.OneOnOnes
  L23_2 = L23_2.value
  L22_2 = L22_2(L23_2)
  L23_2 = tonumber
  L24_2 = L2_2.TendencyToPunch
  L24_2 = L24_2.value
  L23_2 = L23_2(L24_2)
  L24_2 = tonumber
  L25_2 = L2_2.Reflexes
  L25_2 = L25_2.value
  L24_2 = L24_2(L25_2)
  L25_2 = tonumber
  L26_2 = L2_2.RushingOut
  L26_2 = L26_2.value
  L25_2 = L25_2(L26_2)
  L26_2 = tonumber
  L27_2 = L2_2.Throwing
  L27_2 = L27_2.value
  L26_2 = L26_2(L27_2)
  L27_2 = tonumber
  L28_2 = L2_2.Aggression
  L28_2 = L28_2.value
  L27_2 = L27_2(L28_2)
  L28_2 = tonumber
  L29_2 = L2_2.Anticipation
  L29_2 = L29_2.value
  L28_2 = L28_2(L29_2)
  L29_2 = tonumber
  L30_2 = L2_2.Bravery
  L30_2 = L30_2.value
  L29_2 = L29_2(L30_2)
  L30_2 = tonumber
  L31_2 = L2_2.Composure
  L31_2 = L31_2.value
  L30_2 = L30_2(L31_2)
  L31_2 = tonumber
  L32_2 = L2_2.Concentration
  L32_2 = L32_2.value
  L31_2 = L31_2(L32_2)
  L32_2 = tonumber
  L33_2 = L2_2.Decisions
  L33_2 = L33_2.value
  L32_2 = L32_2(L33_2)
  L33_2 = tonumber
  L34_2 = L2_2.Determination
  L34_2 = L34_2.value
  L33_2 = L33_2(L34_2)
  L34_2 = tonumber
  L35_2 = L2_2.Flair
  L35_2 = L35_2.value
  L34_2 = L34_2(L35_2)
  L35_2 = tonumber
  L36_2 = L2_2.Leadership
  L36_2 = L36_2.value
  L35_2 = L35_2(L36_2)
  L36_2 = tonumber
  L37_2 = L2_2.OffTheBall
  L37_2 = L37_2.value
  L36_2 = L36_2(L37_2)
  L37_2 = tonumber
  L38_2 = L2_2.Positioning
  L38_2 = L38_2.value
  L37_2 = L37_2(L38_2)
  L38_2 = tonumber
  L39_2 = L2_2.Teamwork
  L39_2 = L39_2.value
  L38_2 = L38_2(L39_2)
  L39_2 = tonumber
  L40_2 = L2_2.Vision
  L40_2 = L40_2.value
  L39_2 = L39_2(L40_2)
  L40_2 = tonumber
  L41_2 = L2_2.Workrate
  L41_2 = L41_2.value
  L40_2 = L40_2(L41_2)
  L41_2 = tonumber
  L42_2 = L2_2.Acceleration
  L42_2 = L42_2.value
  L41_2 = L41_2(L42_2)
  L42_2 = tonumber
  L43_2 = L2_2.Agility
  L43_2 = L43_2.value
  L42_2 = L42_2(L43_2)
  L43_2 = tonumber
  L44_2 = L2_2.Balance
  L44_2 = L44_2.value
  L43_2 = L43_2(L44_2)
  L44_2 = tonumber
  L45_2 = L2_2.Jumping
  L45_2 = L45_2.value
  L44_2 = L44_2(L45_2)
  L45_2 = tonumber
  L46_2 = L2_2.NaturalFitness
  L46_2 = L46_2.value
  L45_2 = L45_2(L46_2)
  L46_2 = tonumber
  L47_2 = L2_2.Pace
  L47_2 = L47_2.value
  L46_2 = L46_2(L47_2)
  L47_2 = tonumber
  L48_2 = L2_2.Stamina
  L48_2 = L48_2.value
  L47_2 = L47_2(L48_2)
  L48_2 = tonumber
  L49_2 = L2_2.Strength
  L49_2 = L49_2.value
  L48_2 = L48_2(L49_2)
  L49_2 = tonumber
  L50_2 = L2_2.Corners
  L50_2 = L50_2.value
  L49_2 = L49_2(L50_2)
  L50_2 = tonumber
  L51_2 = L2_2.Crossing
  L51_2 = L51_2.value
  L50_2 = L50_2(L51_2)
  L51_2 = tonumber
  L52_2 = L2_2.Dribbling
  L52_2 = L52_2.value
  L51_2 = L51_2(L52_2)
  L52_2 = tonumber
  L53_2 = L2_2.Finishing
  L53_2 = L53_2.value
  L52_2 = L52_2(L53_2)
  L53_2 = tonumber
  L54_2 = L2_2.FirstTouch
  L54_2 = L54_2.value
  L53_2 = L53_2(L54_2)
  L54_2 = tonumber
  L55_2 = L2_2.Freekicks
  L55_2 = L55_2.value
  L54_2 = L54_2(L55_2)
  L55_2 = tonumber
  L56_2 = L2_2.Heading
  L56_2 = L56_2.value
  L55_2 = L55_2(L56_2)
  L56_2 = tonumber
  L57_2 = L2_2.LongShots
  L57_2 = L57_2.value
  L56_2 = L56_2(L57_2)
  L57_2 = tonumber
  L58_2 = L2_2.Longthrows
  L58_2 = L58_2.value
  L57_2 = L57_2(L58_2)
  L58_2 = tonumber
  L59_2 = L2_2.Marking
  L59_2 = L59_2.value
  L58_2 = L58_2(L59_2)
  L59_2 = tonumber
  L60_2 = L2_2.Passing
  L60_2 = L60_2.value
  L59_2 = L59_2(L60_2)
  L60_2 = tonumber
  L61_2 = L2_2.PenaltyTaking
  L61_2 = L61_2.value
  L60_2 = L60_2(L61_2)
  L61_2 = tonumber
  L62_2 = L2_2.Tackling
  L62_2 = L62_2.value
  L61_2 = L61_2(L62_2)
  L62_2 = tonumber
  L63_2 = L2_2.Technique
  L63_2 = L63_2.value
  L62_2 = L62_2(L63_2)
  L63_2 = getObjectName
  L64_2 = L1_2
  L63_2 = L63_2(L64_2)
  L64_2 = getPersonPersonality
  L64_2, L65_2 = L64_2()
  L66_2 = personalityDescTypes
  L66_2 = L66_2[L64_2]
  L67_2 = " ("
  L68_2 = getAge
  L69_2 = bAnd
  L70_2 = readSmallInteger
  L71_2 = pero
  L71_2 = L71_2.Pdob
  L71_2 = L1_2 + L71_2
  L70_2 = L70_2(L71_2)
  L71_2 = 511
  L69_2 = L69_2(L70_2, L71_2)
  L70_2 = readSmallInteger
  L71_2 = pero
  L71_2 = L71_2.Pdob
  L71_2 = L1_2 + L71_2
  L71_2 = L71_2 + 2
  L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L70_2(L71_2)
  L68_2 = L68_2(L69_2, L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L69_2 = " years old)"
  L67_2 = L67_2 .. L68_2 .. L69_2
  L68_2 = formatFMDate
  L69_2 = L1_2 + 68
  L68_2 = L68_2(L69_2)
  L69_2 = getObjectName
  L70_2 = readQword
  L71_2 = L1_2 + 112
  L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L70_2(L71_2)
  L69_2 = L69_2(L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L70_2 = "Free Transfer"
  L71_2 = "N/A"
  L72_2 = "N/A"
  L73_2 = "N/A"
  L74_2 = tonumber
  L75_2 = L2_2.LeftFoot
  L75_2 = L75_2.value
  L74_2 = L74_2(L75_2)
  if L74_2 == 20 then
    L73_2 = "Left"
  end
  L74_2 = tonumber
  L75_2 = L2_2.RightFoot
  L75_2 = L75_2.value
  L74_2 = L74_2(L75_2)
  if L74_2 == 20 then
    L73_2 = "Right"
  end
  L74_2 = L2_2.WeakerFoot
  if L74_2 < 5 then
    L74_2 = L73_2
    L75_2 = " Only"
    L73_2 = L74_2 .. L75_2
  end
  L74_2 = L2_2.WeakerFoot
  if 14 < L74_2 then
    L73_2 = "Either"
  end
  L74_2 = tonumber
  L75_2 = L2_2.RightFoot
  L75_2 = L75_2.value
  L74_2 = L74_2(L75_2)
  if L74_2 == 20 then
    L74_2 = tonumber
    L75_2 = L2_2.LeftFoot
    L75_2 = L75_2.value
    L74_2 = L74_2(L75_2)
    if L74_2 == 20 then
      L73_2 = "Either"
    end
  end
  L74_2 = isFreeTransfer
  L75_2 = L1_2
  L74_2 = L74_2(L75_2)
  if not L74_2 then
    L74_2 = getPersonData
    L75_2 = L1_2
    L74_2, L75_2 = L74_2(L75_2)
    L76_2 = formatFMDate
    L77_2 = L74_2.FullContractEndDay
    L76_2 = L76_2(L77_2)
    L77_2 = L75_2.FullContractWeeklyWage
    L70_2 = L75_2.FullContractTeam
    L78_2 = string
    L78_2 = L78_2.format
    L79_2 = "\194\163%s p/w until %s"
    L80_2 = commaValue
    L81_2 = L77_2
    L80_2 = L80_2(L81_2)
    L81_2 = L76_2
    L78_2 = L78_2(L79_2, L80_2, L81_2)
    L71_2 = L78_2
    L78_2 = typeOptionMaps
    L78_2 = L78_2.playingTimeType
    L79_2 = L75_2.FullContractAgreedPlayingTime
    L72_2 = L78_2[L79_2]
  end
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Name
  L75_2 = L63_2
  L76_2 = L67_2
  L75_2 = L75_2 .. L76_2
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Personality
  L74_2.Caption = L66_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Personality
  L74_2 = L74_2.Font
  L74_2.Color = L65_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Club
  L74_2.Caption = L70_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_DOB
  L74_2.Caption = L68_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Nationality
  L74_2.Caption = L69_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Value
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "\194\163%s"
  L77_2 = commaValue
  L78_2 = tonumber
  L79_2 = L2_2.GuideValue
  L79_2 = L79_2.value
  L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L78_2(L79_2)
  L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L77_2(L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L75_2 = L75_2(L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Contract
  L74_2.Caption = L71_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Playing_Time
  L74_2.Caption = L72_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_PreferredFoot
  L74_2.Caption = L73_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Height
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%d cm"
  L77_2 = tonumber
  L78_2 = L2_2.Height
  L78_2 = L78_2.value
  L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L77_2(L78_2)
  L75_2 = L75_2(L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Weight
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%d kg"
  L77_2 = tonumber
  L78_2 = L2_2.Weight
  L78_2 = L78_2.value
  L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L77_2(L78_2)
  L75_2 = L75_2(L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_CA
  L75_2 = tonumber
  L76_2 = L2_2.CA
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_PA
  L75_2 = tonumber
  L76_2 = L2_2.PA
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_ProgressRate
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.1f / 10.0"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L33_2
  L80_2 = L4_2
  L81_2 = L7_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 / 2
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_CurrentRep
  L75_2 = tonumber
  L76_2 = L2_2.CurrentRep
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_HomeRep
  L75_2 = tonumber
  L76_2 = L2_2.HomeRep
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_WorldRep
  L75_2 = tonumber
  L76_2 = L2_2.WorldRep
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_DNA
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.0f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L29_2
  L80_2 = L30_2
  L81_2 = L31_2
  L82_2 = L33_2
  L83_2 = L38_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * 5
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_CounterAttack
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.0f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L41_2
  L80_2 = L47_2
  L81_2 = L46_2
  L82_2 = L33_2
  L83_2 = L36_2
  L84_2 = L40_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * 5
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Gegenpress
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.0f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L41_2
  L80_2 = L47_2
  L81_2 = L43_2
  L82_2 = L33_2
  L83_2 = L36_2
  L84_2 = L40_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * 5
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_TikiTaka
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.0f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L42_2
  L80_2 = L47_2
  L81_2 = L43_2
  L82_2 = L32_2
  L83_2 = L37_2
  L84_2 = L38_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * 5
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Adaptability
  L74_2.Caption = L3_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Ambition
  L74_2.Caption = L4_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Loyalty
  L74_2.Caption = L5_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Pressure
  L74_2.Caption = L6_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Professionalism
  L74_2.Caption = L7_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Sportmanship
  L74_2.Caption = L8_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Temperament
  L74_2.Caption = L9_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Controversy
  L74_2.Caption = L10_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Consistency
  L74_2.Caption = L11_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Dirtiness
  L74_2.Caption = L12_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_ImportantMatches
  L74_2.Caption = L13_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_InjuryProness
  L74_2.Caption = L14_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Versatility
  L74_2.Caption = L15_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Adaptability
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L3_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Ambition
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L4_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Loyalty
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L5_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Pressure
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L6_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Professionalism
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L7_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Sportmanship
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L8_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Temperament
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L9_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Controversy
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L10_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Consistency
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L11_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Dirtiness
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L12_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_ImportantMatches
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L13_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_InjuryProness
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L14_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Versatility
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L15_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_AerialAbility
  L74_2.Caption = L16_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_CommandOfArea
  L74_2.Caption = L17_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Communication
  L74_2.Caption = L18_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Eccentricity
  L74_2.Caption = L19_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_FirstTouch2
  L74_2.Caption = L53_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Handling
  L74_2.Caption = L20_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Kicking
  L74_2.Caption = L21_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_OneOnOnes
  L74_2.Caption = L22_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Passing2
  L74_2.Caption = L59_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_TendencyToPunch
  L74_2.Caption = L23_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Reflexes
  L74_2.Caption = L24_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_RushingOut
  L74_2.Caption = L25_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Throwing
  L74_2.Caption = L26_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Technique2
  L74_2.Caption = L62_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_AerialAbility
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L16_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_CommandOfArea
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L17_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Communication
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L18_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Eccentricity
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L19_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_FirstTouch2
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L53_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Handling
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L20_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Kicking
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L21_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_OneOnOnes
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L22_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Passing2
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L59_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_TendencyToPunch
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L23_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Reflexes
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L24_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_RushingOut
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L25_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Throwing
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L26_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Technique2
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L62_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Corners
  L74_2.Caption = L49_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Crossing
  L74_2.Caption = L50_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Dribbling
  L74_2.Caption = L51_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Finishing
  L74_2.Caption = L52_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_FirstTouch
  L74_2.Caption = L53_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Freekicks
  L74_2.Caption = L54_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Heading
  L74_2.Caption = L55_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_LongShots
  L74_2.Caption = L56_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Longthrows
  L74_2.Caption = L57_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Marking
  L74_2.Caption = L58_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Passing
  L74_2.Caption = L59_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_PenaltyTaking
  L74_2.Caption = L60_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Tackling
  L74_2.Caption = L61_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Technique
  L74_2.Caption = L62_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Corners
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L49_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Crossing
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L50_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Dribbling
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L51_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Finishing
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L52_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_FirstTouch
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L53_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Freekicks
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L54_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Heading
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L55_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_LongShots
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L56_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Longthrows
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L57_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Marking
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L58_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Passing
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L59_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_PenaltyTaking
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L60_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Tackling
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L61_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Technique
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L62_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Aggression
  L74_2.Caption = L27_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Anticipation
  L74_2.Caption = L28_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Bravery
  L74_2.Caption = L29_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Composure
  L74_2.Caption = L30_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Concentration
  L74_2.Caption = L31_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Decisions
  L74_2.Caption = L32_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Determination
  L74_2.Caption = L33_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Flair
  L74_2.Caption = L34_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Leadership
  L74_2.Caption = L35_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_OffTheBall
  L74_2.Caption = L36_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Positioning
  L74_2.Caption = L37_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Teamwork
  L74_2.Caption = L38_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Vision
  L74_2.Caption = L39_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Workrate
  L74_2.Caption = L40_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Aggression
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L27_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Anticipation
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L28_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Bravery
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L29_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Composure
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L30_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Concentration
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L31_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Decisions
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L32_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Determination
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L33_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Flair
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L34_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Leadership
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L35_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_OffTheBall
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L36_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Positioning
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L37_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Teamwork
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L38_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Vision
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L39_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Workrate
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L40_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Acceleration
  L74_2.Caption = L41_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Agility
  L74_2.Caption = L42_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Balance
  L74_2.Caption = L43_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Jumping
  L74_2.Caption = L44_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_NaturalFitness
  L74_2.Caption = L45_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Pace
  L74_2.Caption = L46_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Stamina
  L74_2.Caption = L47_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Strength
  L74_2.Caption = L48_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Acceleration
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L41_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Agility
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L42_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Balance
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L43_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Jumping
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L44_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_NaturalFitness
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L45_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Pace
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L46_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Stamina
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L47_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player1_Strength
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L48_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
end

loadPlayer1Data = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2, L60_2, L61_2, L62_2, L63_2, L64_2, L65_2, L66_2, L67_2, L68_2, L69_2, L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2
  L1_2 = nil
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_15
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_15::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_25
    end
  end
  do return end
  ::lbl_25::
  L2_2 = getPlayerData
  L2_2 = L2_2()
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = tonumber
  L4_2 = L2_2.Adaptability
  L4_2 = L4_2.value
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = L2_2.Ambition
  L5_2 = L5_2.value
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = L2_2.Loyalty
  L6_2 = L6_2.value
  L5_2 = L5_2(L6_2)
  L6_2 = tonumber
  L7_2 = L2_2.Pressure
  L7_2 = L7_2.value
  L6_2 = L6_2(L7_2)
  L7_2 = tonumber
  L8_2 = L2_2.Professionalism
  L8_2 = L8_2.value
  L7_2 = L7_2(L8_2)
  L8_2 = tonumber
  L9_2 = L2_2.Sportmanship
  L9_2 = L9_2.value
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = L2_2.Temperament
  L10_2 = L10_2.value
  L9_2 = L9_2(L10_2)
  L10_2 = tonumber
  L11_2 = L2_2.Controversy
  L11_2 = L11_2.value
  L10_2 = L10_2(L11_2)
  L11_2 = tonumber
  L12_2 = L2_2.Consistency
  L12_2 = L12_2.value
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = L2_2.Dirtiness
  L13_2 = L13_2.value
  L12_2 = L12_2(L13_2)
  L13_2 = tonumber
  L14_2 = L2_2.ImportantMatches
  L14_2 = L14_2.value
  L13_2 = L13_2(L14_2)
  L14_2 = tonumber
  L15_2 = L2_2.InjuryProness
  L15_2 = L15_2.value
  L14_2 = L14_2(L15_2)
  L15_2 = tonumber
  L16_2 = L2_2.Versatility
  L16_2 = L16_2.value
  L15_2 = L15_2(L16_2)
  L16_2 = tonumber
  L17_2 = L2_2.AerialAbility
  L17_2 = L17_2.value
  L16_2 = L16_2(L17_2)
  L17_2 = tonumber
  L18_2 = L2_2.CommandOfArea
  L18_2 = L18_2.value
  L17_2 = L17_2(L18_2)
  L18_2 = tonumber
  L19_2 = L2_2.Communication
  L19_2 = L19_2.value
  L18_2 = L18_2(L19_2)
  L19_2 = tonumber
  L20_2 = L2_2.Eccentricity
  L20_2 = L20_2.value
  L19_2 = L19_2(L20_2)
  L20_2 = tonumber
  L21_2 = L2_2.Handling
  L21_2 = L21_2.value
  L20_2 = L20_2(L21_2)
  L21_2 = tonumber
  L22_2 = L2_2.Kicking
  L22_2 = L22_2.value
  L21_2 = L21_2(L22_2)
  L22_2 = tonumber
  L23_2 = L2_2.OneOnOnes
  L23_2 = L23_2.value
  L22_2 = L22_2(L23_2)
  L23_2 = tonumber
  L24_2 = L2_2.TendencyToPunch
  L24_2 = L24_2.value
  L23_2 = L23_2(L24_2)
  L24_2 = tonumber
  L25_2 = L2_2.Reflexes
  L25_2 = L25_2.value
  L24_2 = L24_2(L25_2)
  L25_2 = tonumber
  L26_2 = L2_2.RushingOut
  L26_2 = L26_2.value
  L25_2 = L25_2(L26_2)
  L26_2 = tonumber
  L27_2 = L2_2.Throwing
  L27_2 = L27_2.value
  L26_2 = L26_2(L27_2)
  L27_2 = tonumber
  L28_2 = L2_2.Aggression
  L28_2 = L28_2.value
  L27_2 = L27_2(L28_2)
  L28_2 = tonumber
  L29_2 = L2_2.Anticipation
  L29_2 = L29_2.value
  L28_2 = L28_2(L29_2)
  L29_2 = tonumber
  L30_2 = L2_2.Bravery
  L30_2 = L30_2.value
  L29_2 = L29_2(L30_2)
  L30_2 = tonumber
  L31_2 = L2_2.Composure
  L31_2 = L31_2.value
  L30_2 = L30_2(L31_2)
  L31_2 = tonumber
  L32_2 = L2_2.Concentration
  L32_2 = L32_2.value
  L31_2 = L31_2(L32_2)
  L32_2 = tonumber
  L33_2 = L2_2.Decisions
  L33_2 = L33_2.value
  L32_2 = L32_2(L33_2)
  L33_2 = tonumber
  L34_2 = L2_2.Determination
  L34_2 = L34_2.value
  L33_2 = L33_2(L34_2)
  L34_2 = tonumber
  L35_2 = L2_2.Flair
  L35_2 = L35_2.value
  L34_2 = L34_2(L35_2)
  L35_2 = tonumber
  L36_2 = L2_2.Leadership
  L36_2 = L36_2.value
  L35_2 = L35_2(L36_2)
  L36_2 = tonumber
  L37_2 = L2_2.OffTheBall
  L37_2 = L37_2.value
  L36_2 = L36_2(L37_2)
  L37_2 = tonumber
  L38_2 = L2_2.Positioning
  L38_2 = L38_2.value
  L37_2 = L37_2(L38_2)
  L38_2 = tonumber
  L39_2 = L2_2.Teamwork
  L39_2 = L39_2.value
  L38_2 = L38_2(L39_2)
  L39_2 = tonumber
  L40_2 = L2_2.Vision
  L40_2 = L40_2.value
  L39_2 = L39_2(L40_2)
  L40_2 = tonumber
  L41_2 = L2_2.Workrate
  L41_2 = L41_2.value
  L40_2 = L40_2(L41_2)
  L41_2 = tonumber
  L42_2 = L2_2.Acceleration
  L42_2 = L42_2.value
  L41_2 = L41_2(L42_2)
  L42_2 = tonumber
  L43_2 = L2_2.Agility
  L43_2 = L43_2.value
  L42_2 = L42_2(L43_2)
  L43_2 = tonumber
  L44_2 = L2_2.Balance
  L44_2 = L44_2.value
  L43_2 = L43_2(L44_2)
  L44_2 = tonumber
  L45_2 = L2_2.Jumping
  L45_2 = L45_2.value
  L44_2 = L44_2(L45_2)
  L45_2 = tonumber
  L46_2 = L2_2.NaturalFitness
  L46_2 = L46_2.value
  L45_2 = L45_2(L46_2)
  L46_2 = tonumber
  L47_2 = L2_2.Pace
  L47_2 = L47_2.value
  L46_2 = L46_2(L47_2)
  L47_2 = tonumber
  L48_2 = L2_2.Stamina
  L48_2 = L48_2.value
  L47_2 = L47_2(L48_2)
  L48_2 = tonumber
  L49_2 = L2_2.Strength
  L49_2 = L49_2.value
  L48_2 = L48_2(L49_2)
  L49_2 = tonumber
  L50_2 = L2_2.Corners
  L50_2 = L50_2.value
  L49_2 = L49_2(L50_2)
  L50_2 = tonumber
  L51_2 = L2_2.Crossing
  L51_2 = L51_2.value
  L50_2 = L50_2(L51_2)
  L51_2 = tonumber
  L52_2 = L2_2.Dribbling
  L52_2 = L52_2.value
  L51_2 = L51_2(L52_2)
  L52_2 = tonumber
  L53_2 = L2_2.Finishing
  L53_2 = L53_2.value
  L52_2 = L52_2(L53_2)
  L53_2 = tonumber
  L54_2 = L2_2.FirstTouch
  L54_2 = L54_2.value
  L53_2 = L53_2(L54_2)
  L54_2 = tonumber
  L55_2 = L2_2.Freekicks
  L55_2 = L55_2.value
  L54_2 = L54_2(L55_2)
  L55_2 = tonumber
  L56_2 = L2_2.Heading
  L56_2 = L56_2.value
  L55_2 = L55_2(L56_2)
  L56_2 = tonumber
  L57_2 = L2_2.LongShots
  L57_2 = L57_2.value
  L56_2 = L56_2(L57_2)
  L57_2 = tonumber
  L58_2 = L2_2.Longthrows
  L58_2 = L58_2.value
  L57_2 = L57_2(L58_2)
  L58_2 = tonumber
  L59_2 = L2_2.Marking
  L59_2 = L59_2.value
  L58_2 = L58_2(L59_2)
  L59_2 = tonumber
  L60_2 = L2_2.Passing
  L60_2 = L60_2.value
  L59_2 = L59_2(L60_2)
  L60_2 = tonumber
  L61_2 = L2_2.PenaltyTaking
  L61_2 = L61_2.value
  L60_2 = L60_2(L61_2)
  L61_2 = tonumber
  L62_2 = L2_2.Tackling
  L62_2 = L62_2.value
  L61_2 = L61_2(L62_2)
  L62_2 = tonumber
  L63_2 = L2_2.Technique
  L63_2 = L63_2.value
  L62_2 = L62_2(L63_2)
  L63_2 = getObjectName
  L64_2 = L1_2
  L63_2 = L63_2(L64_2)
  L64_2 = getPersonPersonality
  L64_2, L65_2 = L64_2()
  L66_2 = personalityDescTypes
  L66_2 = L66_2[L64_2]
  L67_2 = " ("
  L68_2 = getAge
  L69_2 = bAnd
  L70_2 = readSmallInteger
  L71_2 = pero
  L71_2 = L71_2.Pdob
  L71_2 = L1_2 + L71_2
  L70_2 = L70_2(L71_2)
  L71_2 = 511
  L69_2 = L69_2(L70_2, L71_2)
  L70_2 = readSmallInteger
  L71_2 = pero
  L71_2 = L71_2.Pdob
  L71_2 = L1_2 + L71_2
  L71_2 = L71_2 + 2
  L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L70_2(L71_2)
  L68_2 = L68_2(L69_2, L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L69_2 = " years old)"
  L67_2 = L67_2 .. L68_2 .. L69_2
  L68_2 = formatFMDate
  L69_2 = L1_2 + 68
  L68_2 = L68_2(L69_2)
  L69_2 = getObjectName
  L70_2 = readQword
  L71_2 = L1_2 + 112
  L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L70_2(L71_2)
  L69_2 = L69_2(L70_2, L71_2, L72_2, L73_2, L74_2, L75_2, L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L70_2 = "Free Transfer"
  L71_2 = "N/A"
  L72_2 = "N/A"
  L73_2 = "N/A"
  L74_2 = tonumber
  L75_2 = L2_2.LeftFoot
  L75_2 = L75_2.value
  L74_2 = L74_2(L75_2)
  if L74_2 == 20 then
    L73_2 = "Left"
  end
  L74_2 = tonumber
  L75_2 = L2_2.RightFoot
  L75_2 = L75_2.value
  L74_2 = L74_2(L75_2)
  if L74_2 == 20 then
    L73_2 = "Right"
  end
  L74_2 = L2_2.WeakerFoot
  if L74_2 < 5 then
    L74_2 = L73_2
    L75_2 = " Only"
    L73_2 = L74_2 .. L75_2
  end
  L74_2 = L2_2.WeakerFoot
  if 14 < L74_2 then
    L73_2 = "Either"
  end
  L74_2 = tonumber
  L75_2 = L2_2.RightFoot
  L75_2 = L75_2.value
  L74_2 = L74_2(L75_2)
  if L74_2 == 20 then
    L74_2 = tonumber
    L75_2 = L2_2.LeftFoot
    L75_2 = L75_2.value
    L74_2 = L74_2(L75_2)
    if L74_2 == 20 then
      L73_2 = "Either"
    end
  end
  L74_2 = isFreeTransfer
  L75_2 = L1_2
  L74_2 = L74_2(L75_2)
  if not L74_2 then
    L74_2 = getPersonData
    L75_2 = L1_2
    L74_2, L75_2 = L74_2(L75_2)
    L76_2 = formatFMDate
    L77_2 = L74_2.FullContractEndDay
    L76_2 = L76_2(L77_2)
    L77_2 = L75_2.FullContractWeeklyWage
    L70_2 = L75_2.FullContractTeam
    L78_2 = string
    L78_2 = L78_2.format
    L79_2 = "\194\163%s p/w until %s"
    L80_2 = commaValue
    L81_2 = L77_2
    L80_2 = L80_2(L81_2)
    L81_2 = L76_2
    L78_2 = L78_2(L79_2, L80_2, L81_2)
    L71_2 = L78_2
    L78_2 = typeOptionMaps
    L78_2 = L78_2.playingTimeType
    L79_2 = L75_2.FullContractAgreedPlayingTime
    L72_2 = L78_2[L79_2]
  end
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Name
  L75_2 = L63_2
  L76_2 = L67_2
  L75_2 = L75_2 .. L76_2
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Personality
  L74_2.Caption = L66_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Personality
  L74_2 = L74_2.Font
  L74_2.Color = L65_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Club
  L74_2.Caption = L70_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_DOB
  L74_2.Caption = L68_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Nationality
  L74_2.Caption = L69_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Value
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "\194\163%s"
  L77_2 = commaValue
  L78_2 = tonumber
  L79_2 = L2_2.GuideValue
  L79_2 = L79_2.value
  L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L78_2(L79_2)
  L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L77_2(L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L75_2 = L75_2(L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Contract
  L74_2.Caption = L71_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Playing_Time
  L74_2.Caption = L72_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_PreferredFoot
  L74_2.Caption = L73_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Height
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%d cm"
  L77_2 = tonumber
  L78_2 = L2_2.Height
  L78_2 = L78_2.value
  L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L77_2(L78_2)
  L75_2 = L75_2(L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Weight
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%d kg"
  L77_2 = tonumber
  L78_2 = L2_2.Weight
  L78_2 = L78_2.value
  L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2 = L77_2(L78_2)
  L75_2 = L75_2(L76_2, L77_2, L78_2, L79_2, L80_2, L81_2, L82_2, L83_2, L84_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_CA
  L75_2 = tonumber
  L76_2 = L2_2.CA
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_PA
  L75_2 = tonumber
  L76_2 = L2_2.PA
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_ProgressRate
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.1f / 10.0"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L33_2
  L80_2 = L4_2
  L81_2 = L7_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 / 2
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_CurrentRep
  L75_2 = tonumber
  L76_2 = L2_2.CurrentRep
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_HomeRep
  L75_2 = tonumber
  L76_2 = L2_2.HomeRep
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_WorldRep
  L75_2 = tonumber
  L76_2 = L2_2.WorldRep
  L76_2 = L76_2.value
  L75_2 = L75_2(L76_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_DNA
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.0f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L29_2
  L80_2 = L30_2
  L81_2 = L31_2
  L82_2 = L33_2
  L83_2 = L38_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * 5
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_CounterAttack
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.0f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L41_2
  L80_2 = L47_2
  L81_2 = L46_2
  L82_2 = L33_2
  L83_2 = L36_2
  L84_2 = L40_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * 5
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Gegenpress
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.0f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L41_2
  L80_2 = L47_2
  L81_2 = L43_2
  L82_2 = L33_2
  L83_2 = L36_2
  L84_2 = L40_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * 5
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_TikiTaka
  L75_2 = string
  L75_2 = L75_2.format
  L76_2 = "%.0f%%"
  L77_2 = math
  L77_2 = L77_2.average
  L78_2 = {}
  L79_2 = L42_2
  L80_2 = L47_2
  L81_2 = L43_2
  L82_2 = L32_2
  L83_2 = L37_2
  L84_2 = L38_2
  L78_2[1] = L79_2
  L78_2[2] = L80_2
  L78_2[3] = L81_2
  L78_2[4] = L82_2
  L78_2[5] = L83_2
  L78_2[6] = L84_2
  L77_2 = L77_2(L78_2)
  L77_2 = L77_2 * 5
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Caption = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Adaptability
  L74_2.Caption = L3_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Ambition
  L74_2.Caption = L4_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Loyalty
  L74_2.Caption = L5_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Pressure
  L74_2.Caption = L6_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Professionalism
  L74_2.Caption = L7_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Sportmanship
  L74_2.Caption = L8_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Temperament
  L74_2.Caption = L9_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Controversy
  L74_2.Caption = L10_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Consistency
  L74_2.Caption = L11_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Dirtiness
  L74_2.Caption = L12_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_ImportantMatches
  L74_2.Caption = L13_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_InjuryProness
  L74_2.Caption = L14_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Versatility
  L74_2.Caption = L15_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Adaptability
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L3_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Ambition
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L4_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Loyalty
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L5_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Pressure
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L6_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Professionalism
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L7_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Sportmanship
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L8_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Temperament
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L9_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Controversy
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L10_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Consistency
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L11_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Dirtiness
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L12_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_ImportantMatches
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L13_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_InjuryProness
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L14_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Versatility
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L15_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_AerialAbility
  L74_2.Caption = L16_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_CommandOfArea
  L74_2.Caption = L17_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Communication
  L74_2.Caption = L18_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Eccentricity
  L74_2.Caption = L19_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_FirstTouch2
  L74_2.Caption = L53_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Handling
  L74_2.Caption = L20_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Kicking
  L74_2.Caption = L21_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_OneOnOnes
  L74_2.Caption = L22_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Passing2
  L74_2.Caption = L59_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_TendencyToPunch
  L74_2.Caption = L23_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Reflexes
  L74_2.Caption = L24_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_RushingOut
  L74_2.Caption = L25_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Throwing
  L74_2.Caption = L26_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Technique2
  L74_2.Caption = L62_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_AerialAbility
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L16_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_CommandOfArea
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L17_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Communication
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L18_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Eccentricity
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L19_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_FirstTouch2
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L53_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Handling
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L20_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Kicking
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L21_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_OneOnOnes
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L22_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Passing2
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L59_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_TendencyToPunch
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L23_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Reflexes
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L24_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_RushingOut
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L25_2
  L77_2 = true
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Throwing
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L26_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Technique2
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L62_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Corners
  L74_2.Caption = L49_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Crossing
  L74_2.Caption = L50_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Dribbling
  L74_2.Caption = L51_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Finishing
  L74_2.Caption = L52_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_FirstTouch
  L74_2.Caption = L53_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Freekicks
  L74_2.Caption = L54_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Heading
  L74_2.Caption = L55_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_LongShots
  L74_2.Caption = L56_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Longthrows
  L74_2.Caption = L57_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Marking
  L74_2.Caption = L58_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Passing
  L74_2.Caption = L59_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_PenaltyTaking
  L74_2.Caption = L60_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Tackling
  L74_2.Caption = L61_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Technique
  L74_2.Caption = L62_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Corners
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L49_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Crossing
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L50_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Dribbling
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L51_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Finishing
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L52_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_FirstTouch
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L53_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Freekicks
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L54_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Heading
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L55_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_LongShots
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L56_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Longthrows
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L57_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Marking
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L58_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Passing
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L59_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_PenaltyTaking
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L60_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Tackling
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L61_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Technique
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L62_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Aggression
  L74_2.Caption = L27_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Anticipation
  L74_2.Caption = L28_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Bravery
  L74_2.Caption = L29_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Composure
  L74_2.Caption = L30_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Concentration
  L74_2.Caption = L31_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Decisions
  L74_2.Caption = L32_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Determination
  L74_2.Caption = L33_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Flair
  L74_2.Caption = L34_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Leadership
  L74_2.Caption = L35_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_OffTheBall
  L74_2.Caption = L36_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Positioning
  L74_2.Caption = L37_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Teamwork
  L74_2.Caption = L38_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Vision
  L74_2.Caption = L39_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Workrate
  L74_2.Caption = L40_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Aggression
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L27_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Anticipation
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L28_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Bravery
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L29_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Composure
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L30_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Concentration
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L31_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Decisions
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L32_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Determination
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L33_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Flair
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L34_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Leadership
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L35_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_OffTheBall
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L36_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Positioning
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L37_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Teamwork
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L38_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Vision
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L39_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Workrate
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L40_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Acceleration
  L74_2.Caption = L41_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Agility
  L74_2.Caption = L42_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Balance
  L74_2.Caption = L43_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Jumping
  L74_2.Caption = L44_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_NaturalFitness
  L74_2.Caption = L45_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Pace
  L74_2.Caption = L46_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Stamina
  L74_2.Caption = L47_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Strength
  L74_2.Caption = L48_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Acceleration
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L41_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Agility
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L42_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Balance
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L43_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Jumping
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L44_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_NaturalFitness
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L45_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Pace
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L46_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Stamina
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L47_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
  L74_2 = Comparison
  L74_2 = L74_2.Player2_Strength
  L74_2 = L74_2.Font
  L75_2 = attributesColor
  L76_2 = L48_2
  L77_2 = false
  L75_2 = L75_2(L76_2, L77_2)
  L74_2.Color = L75_2
end

loadPlayer2Data = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2
  L1_2 = getAddressSafe
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_17
    end
  end
  L2_2 = readQword
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_17::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_30
    end
  end
  L2_2 = readQword
  L3_2 = "ptrPerson"
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  ::lbl_30::
  if L1_2 ~= nil and L1_2 ~= 0 then
    L2_2 = isPlayer
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = getPlayerFromPerson
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = getPlayerData
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  if L2_2 == nil or L2_2 == 0 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = tonumber
  L4_2 = L2_2.Adaptability
  L4_2 = L4_2.value
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = L2_2.Ambition
  L5_2 = L5_2.value
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = L2_2.Loyalty
  L6_2 = L6_2.value
  L5_2 = L5_2(L6_2)
  L6_2 = tonumber
  L7_2 = L2_2.Pressure
  L7_2 = L7_2.value
  L6_2 = L6_2(L7_2)
  L7_2 = tonumber
  L8_2 = L2_2.Professionalism
  L8_2 = L8_2.value
  L7_2 = L7_2(L8_2)
  L8_2 = tonumber
  L9_2 = L2_2.Sportmanship
  L9_2 = L9_2.value
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = L2_2.Temperament
  L10_2 = L10_2.value
  L9_2 = L9_2(L10_2)
  L10_2 = tonumber
  L11_2 = L2_2.Controversy
  L11_2 = L11_2.value
  L10_2 = L10_2(L11_2)
  L11_2 = tonumber
  L12_2 = L2_2.Consistency
  L12_2 = L12_2.value
  L11_2 = L11_2(L12_2)
  L12_2 = tonumber
  L13_2 = L2_2.Dirtiness
  L13_2 = L13_2.value
  L12_2 = L12_2(L13_2)
  L13_2 = tonumber
  L14_2 = L2_2.ImportantMatches
  L14_2 = L14_2.value
  L13_2 = L13_2(L14_2)
  L14_2 = tonumber
  L15_2 = L2_2.InjuryProness
  L15_2 = L15_2.value
  L14_2 = L14_2(L15_2)
  L15_2 = tonumber
  L16_2 = L2_2.Versatility
  L16_2 = L16_2.value
  L15_2 = L15_2(L16_2)
  L16_2 = tonumber
  L17_2 = L2_2.Aggression
  L17_2 = L17_2.value
  L16_2 = L16_2(L17_2)
  L17_2 = tonumber
  L18_2 = L2_2.Anticipation
  L18_2 = L18_2.value
  L17_2 = L17_2(L18_2)
  L18_2 = tonumber
  L19_2 = L2_2.Bravery
  L19_2 = L19_2.value
  L18_2 = L18_2(L19_2)
  L19_2 = tonumber
  L20_2 = L2_2.Composure
  L20_2 = L20_2.value
  L19_2 = L19_2(L20_2)
  L20_2 = tonumber
  L21_2 = L2_2.Concentration
  L21_2 = L21_2.value
  L20_2 = L20_2(L21_2)
  L21_2 = tonumber
  L22_2 = L2_2.Decisions
  L22_2 = L22_2.value
  L21_2 = L21_2(L22_2)
  L22_2 = tonumber
  L23_2 = L2_2.Determination
  L23_2 = L23_2.value
  L22_2 = L22_2(L23_2)
  L23_2 = tonumber
  L24_2 = L2_2.Flair
  L24_2 = L24_2.value
  L23_2 = L23_2(L24_2)
  L24_2 = tonumber
  L25_2 = L2_2.Leadership
  L25_2 = L25_2.value
  L24_2 = L24_2(L25_2)
  L25_2 = tonumber
  L26_2 = L2_2.OffTheBall
  L26_2 = L26_2.value
  L25_2 = L25_2(L26_2)
  L26_2 = tonumber
  L27_2 = L2_2.Positioning
  L27_2 = L27_2.value
  L26_2 = L26_2(L27_2)
  L27_2 = tonumber
  L28_2 = L2_2.Teamwork
  L28_2 = L28_2.value
  L27_2 = L27_2(L28_2)
  L28_2 = tonumber
  L29_2 = L2_2.Vision
  L29_2 = L29_2.value
  L28_2 = L28_2(L29_2)
  L29_2 = tonumber
  L30_2 = L2_2.Workrate
  L30_2 = L30_2.value
  L29_2 = L29_2(L30_2)
  L30_2 = tonumber
  L31_2 = L2_2.Acceleration
  L31_2 = L31_2.value
  L30_2 = L30_2(L31_2)
  L31_2 = tonumber
  L32_2 = L2_2.Agility
  L32_2 = L32_2.value
  L31_2 = L31_2(L32_2)
  L32_2 = tonumber
  L33_2 = L2_2.Balance
  L33_2 = L33_2.value
  L32_2 = L32_2(L33_2)
  L33_2 = tonumber
  L34_2 = L2_2.Jumping
  L34_2 = L34_2.value
  L33_2 = L33_2(L34_2)
  L34_2 = tonumber
  L35_2 = L2_2.NaturalFitness
  L35_2 = L35_2.value
  L34_2 = L34_2(L35_2)
  L35_2 = tonumber
  L36_2 = L2_2.Pace
  L36_2 = L36_2.value
  L35_2 = L35_2(L36_2)
  L36_2 = tonumber
  L37_2 = L2_2.Stamina
  L37_2 = L37_2.value
  L36_2 = L36_2(L37_2)
  L37_2 = tonumber
  L38_2 = L2_2.Strength
  L38_2 = L38_2.value
  L37_2 = L37_2(L38_2)
  L38_2 = getObjectName
  L39_2 = L1_2
  L38_2 = L38_2(L39_2)
  L39_2 = getPersonPersonality
  L39_2, L40_2 = L39_2()
  L41_2 = personalityDescTypes
  L41_2 = L41_2[L39_2]
  L42_2 = " ("
  L43_2 = getAge
  L44_2 = bAnd
  L45_2 = readSmallInteger
  L46_2 = pero
  L46_2 = L46_2.Pdob
  L46_2 = L1_2 + L46_2
  L45_2 = L45_2(L46_2)
  L46_2 = 511
  L44_2 = L44_2(L45_2, L46_2)
  L45_2 = readSmallInteger
  L46_2 = pero
  L46_2 = L46_2.Pdob
  L46_2 = L1_2 + L46_2
  L46_2 = L46_2 + 2
  L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2 = L45_2(L46_2)
  L43_2 = L43_2(L44_2, L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2)
  L44_2 = " years old)"
  L42_2 = L42_2 .. L43_2 .. L44_2
  L43_2 = formatFMDate
  L44_2 = L1_2 + 68
  L43_2 = L43_2(L44_2)
  L44_2 = getObjectName
  L45_2 = readQword
  L46_2 = L1_2 + 112
  L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2 = L45_2(L46_2)
  L44_2 = L44_2(L45_2, L46_2, L47_2, L48_2, L49_2, L50_2, L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2)
  L45_2 = "Free Transfer"
  L46_2 = "N/A"
  L47_2 = "N/A"
  L48_2 = "N/A"
  L49_2 = tonumber
  L50_2 = L2_2.LeftFoot
  L50_2 = L50_2.value
  L49_2 = L49_2(L50_2)
  if L49_2 == 20 then
    L48_2 = "Left"
  end
  L49_2 = tonumber
  L50_2 = L2_2.RightFoot
  L50_2 = L50_2.value
  L49_2 = L49_2(L50_2)
  if L49_2 == 20 then
    L48_2 = "Right"
  end
  L49_2 = L2_2.WeakerFoot
  if L49_2 < 5 then
    L49_2 = L48_2
    L50_2 = " Only"
    L48_2 = L49_2 .. L50_2
  end
  L49_2 = L2_2.WeakerFoot
  if 14 < L49_2 then
    L48_2 = "Either"
  end
  L49_2 = tonumber
  L50_2 = L2_2.RightFoot
  L50_2 = L50_2.value
  L49_2 = L49_2(L50_2)
  if L49_2 == 20 then
    L49_2 = tonumber
    L50_2 = L2_2.LeftFoot
    L50_2 = L50_2.value
    L49_2 = L49_2(L50_2)
    if L49_2 == 20 then
      L48_2 = "Either"
    end
  end
  L49_2 = isFreeTransfer
  L50_2 = L1_2
  L49_2 = L49_2(L50_2)
  if not L49_2 then
    L49_2 = getPersonData
    L50_2 = L1_2
    L49_2, L50_2 = L49_2(L50_2)
    L51_2 = formatFMDate
    L52_2 = L49_2.FullContractEndDay
    L51_2 = L51_2(L52_2)
    L52_2 = L50_2.FullContractWeeklyWage
    L45_2 = L50_2.FullContractTeam
    L53_2 = string
    L53_2 = L53_2.format
    L54_2 = "\194\163%s p/w until %s"
    L55_2 = commaValue
    L56_2 = L52_2
    L55_2 = L55_2(L56_2)
    L56_2 = L51_2
    L53_2 = L53_2(L54_2, L55_2, L56_2)
    L46_2 = L53_2
    L53_2 = typeOptionMaps
    L53_2 = L53_2.playingTimeType
    L54_2 = L50_2.FullContractAgreedPlayingTime
    L47_2 = L53_2[L54_2]
  end
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Name
  L50_2 = L38_2
  L51_2 = L42_2
  L50_2 = L50_2 .. L51_2
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Personality
  L49_2.Caption = L41_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Personality
  L49_2 = L49_2.Font
  L49_2.Color = L40_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Club
  L49_2.Caption = L45_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_DOB
  L49_2.Caption = L43_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Nationality
  L49_2.Caption = L44_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Value
  L50_2 = string
  L50_2 = L50_2.format
  L51_2 = "\194\163%s"
  L52_2 = commaValue
  L53_2 = tonumber
  L54_2 = L2_2.GuideValue
  L54_2 = L54_2.value
  L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2 = L53_2(L54_2)
  L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2 = L52_2(L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2)
  L50_2 = L50_2(L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Contract
  L49_2.Caption = L46_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Playing_Time
  L49_2.Caption = L47_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_PreferredFoot
  L49_2.Caption = L48_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Height
  L50_2 = string
  L50_2 = L50_2.format
  L51_2 = "%d cm"
  L52_2 = tonumber
  L53_2 = L2_2.Height
  L53_2 = L53_2.value
  L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2 = L52_2(L53_2)
  L50_2 = L50_2(L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Weight
  L50_2 = string
  L50_2 = L50_2.format
  L51_2 = "%d kg"
  L52_2 = tonumber
  L53_2 = L2_2.Weight
  L53_2 = L53_2.value
  L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2 = L52_2(L53_2)
  L50_2 = L50_2(L51_2, L52_2, L53_2, L54_2, L55_2, L56_2, L57_2, L58_2, L59_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_CA
  L50_2 = tonumber
  L51_2 = L2_2.CA
  L51_2 = L51_2.value
  L50_2 = L50_2(L51_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_PA
  L50_2 = tonumber
  L51_2 = L2_2.PA
  L51_2 = L51_2.value
  L50_2 = L50_2(L51_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_ProgressRate
  L50_2 = string
  L50_2 = L50_2.format
  L51_2 = "%.1f / 10.0"
  L52_2 = math
  L52_2 = L52_2.average
  L53_2 = {}
  L54_2 = L22_2
  L55_2 = L4_2
  L56_2 = L7_2
  L53_2[1] = L54_2
  L53_2[2] = L55_2
  L53_2[3] = L56_2
  L52_2 = L52_2(L53_2)
  L52_2 = L52_2 / 2
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_CurrentRep
  L50_2 = tonumber
  L51_2 = L2_2.CurrentRep
  L51_2 = L51_2.value
  L50_2 = L50_2(L51_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_HomeRep
  L50_2 = tonumber
  L51_2 = L2_2.HomeRep
  L51_2 = L51_2.value
  L50_2 = L50_2(L51_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_WorldRep
  L50_2 = tonumber
  L51_2 = L2_2.WorldRep
  L51_2 = L51_2.value
  L50_2 = L50_2(L51_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_DNA
  L50_2 = string
  L50_2 = L50_2.format
  L51_2 = "%.0f%%"
  L52_2 = math
  L52_2 = L52_2.average
  L53_2 = {}
  L54_2 = L18_2
  L55_2 = L19_2
  L56_2 = L20_2
  L57_2 = L22_2
  L58_2 = L27_2
  L53_2[1] = L54_2
  L53_2[2] = L55_2
  L53_2[3] = L56_2
  L53_2[4] = L57_2
  L53_2[5] = L58_2
  L52_2 = L52_2(L53_2)
  L52_2 = L52_2 * 5
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_CounterAttack
  L50_2 = string
  L50_2 = L50_2.format
  L51_2 = "%.0f%%"
  L52_2 = math
  L52_2 = L52_2.average
  L53_2 = {}
  L54_2 = L30_2
  L55_2 = L36_2
  L56_2 = L35_2
  L57_2 = L22_2
  L58_2 = L25_2
  L59_2 = L29_2
  L53_2[1] = L54_2
  L53_2[2] = L55_2
  L53_2[3] = L56_2
  L53_2[4] = L57_2
  L53_2[5] = L58_2
  L53_2[6] = L59_2
  L52_2 = L52_2(L53_2)
  L52_2 = L52_2 * 5
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Gegenpress
  L50_2 = string
  L50_2 = L50_2.format
  L51_2 = "%.0f%%"
  L52_2 = math
  L52_2 = L52_2.average
  L53_2 = {}
  L54_2 = L30_2
  L55_2 = L36_2
  L56_2 = L32_2
  L57_2 = L22_2
  L58_2 = L25_2
  L59_2 = L29_2
  L53_2[1] = L54_2
  L53_2[2] = L55_2
  L53_2[3] = L56_2
  L53_2[4] = L57_2
  L53_2[5] = L58_2
  L53_2[6] = L59_2
  L52_2 = L52_2(L53_2)
  L52_2 = L52_2 * 5
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_TikiTaka
  L50_2 = string
  L50_2 = L50_2.format
  L51_2 = "%.0f%%"
  L52_2 = math
  L52_2 = L52_2.average
  L53_2 = {}
  L54_2 = L31_2
  L55_2 = L36_2
  L56_2 = L32_2
  L57_2 = L21_2
  L58_2 = L26_2
  L59_2 = L27_2
  L53_2[1] = L54_2
  L53_2[2] = L55_2
  L53_2[3] = L56_2
  L53_2[4] = L57_2
  L53_2[5] = L58_2
  L53_2[6] = L59_2
  L52_2 = L52_2(L53_2)
  L52_2 = L52_2 * 5
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Caption = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Adaptability
  L49_2.Caption = L3_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Ambition
  L49_2.Caption = L4_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Loyalty
  L49_2.Caption = L5_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Pressure
  L49_2.Caption = L6_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Professionalism
  L49_2.Caption = L7_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Sportmanship
  L49_2.Caption = L8_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Temperament
  L49_2.Caption = L9_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Controversy
  L49_2.Caption = L10_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Consistency
  L49_2.Caption = L11_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Dirtiness
  L49_2.Caption = L12_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_ImportantMatches
  L49_2.Caption = L13_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_InjuryProness
  L49_2.Caption = L14_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Versatility
  L49_2.Caption = L15_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Adaptability
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L3_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Ambition
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L4_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Loyalty
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L5_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Pressure
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L6_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Professionalism
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L7_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Sportmanship
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L8_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Temperament
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L9_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Controversy
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L10_2
  L52_2 = true
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Consistency
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L11_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Dirtiness
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L12_2
  L52_2 = true
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_ImportantMatches
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L13_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_InjuryProness
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L14_2
  L52_2 = true
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
  L49_2 = ScoutingTool
  L49_2 = L49_2.Player_Versatility
  L49_2 = L49_2.Font
  L50_2 = attributesColor
  L51_2 = L15_2
  L52_2 = false
  L50_2 = L50_2(L51_2, L52_2)
  L49_2.Color = L50_2
end

loadPlayerData = L8_1

function L8_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.state
  L2_2 = cbChecked
  if L1_2 == L2_2 then
    L1_2 = Comparison
    L1_2 = L1_2.General
    L1_2.visible = false
    L1_2 = Comparison
    L1_2 = L1_2.Personalities
    L1_2.visible = true
  end
  L1_2 = A0_2.state
  L2_2 = cbUnchecked
  if L1_2 == L2_2 then
    L1_2 = Comparison
    L1_2 = L1_2.General
    L1_2.visible = true
    L1_2 = Comparison
    L1_2 = L1_2.Personalities
    L1_2.visible = false
  end
end

showPersonalities = L8_1

function L8_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.state
  L2_2 = cbChecked
  if L1_2 == L2_2 then
    L1_2 = Comparison
    L1_2 = L1_2.Technical
    L1_2.visible = false
    L1_2 = Comparison
    L1_2 = L1_2.Goalkeeping
    L1_2.visible = true
  end
  L1_2 = A0_2.state
  L2_2 = cbUnchecked
  if L1_2 == L2_2 then
    L1_2 = Comparison
    L1_2 = L1_2.Technical
    L1_2.visible = true
    L1_2 = Comparison
    L1_2 = L1_2.Goalkeeping
    L1_2.visible = false
  end
end

showGK = L8_1

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = getAddressList
  L0_2 = L0_2()
  L1_2 = getMainForm
  L1_2 = L1_2()
  L2_2 = createFont
  L2_2 = L2_2()
  L2_2.Name = "Consolas"
  L2_2.Quality = "fqDraft"
  L2_2.CharSet = "ANSI_CHARSET"
  L2_2.Pitch = "fpFixed"
  L2_2.Size = 8
  L3_2 = createPanel
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  StatusPanel = L3_2
  L3_2 = StatusPanel
  L4_2 = alBottom
  L3_2.Align = L4_2
  L3_2 = StatusPanel
  L3_2.Height = 35
  L3_2 = StatusPanel
  L4_2 = clNone
  L3_2.Color = L4_2
  L3_2 = StatusPanel
  L3_2.Font = L2_2
  L3_2 = StatusPanel
  L3_2 = L3_2.Font
  L3_2.Size = 10
  L3_2 = StatusPanel
  L3_2 = L3_2.Font
  L3_2.Style = "[fsBold]"
  L3_2 = StatusPanel
  L3_2 = L3_2.Font
  L4_2 = clRed
  L3_2.Color = L4_2
  L3_2 = createLabel
  L4_2 = StatusPanel
  L3_2 = L3_2(L4_2)
  DateLabel = L3_2
  L3_2 = DateLabel
  L3_2.Font = L2_2
  L3_2 = DateLabel
  L3_2 = L3_2.AnchorSideLeft
  L4_2 = StatusPanel
  L3_2.Control = L4_2
  L3_2 = DateLabel
  L3_2 = L3_2.AnchorSideTop
  L4_2 = StatusPanel
  L3_2.Control = L4_2
  L3_2 = DateLabel
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 3
  L3_2 = createLabel
  L4_2 = StatusPanel
  L3_2 = L3_2(L4_2)
  ManagerLabel = L3_2
  L3_2 = ManagerLabel
  L3_2.Font = L2_2
  L3_2 = ManagerLabel
  L3_2 = L3_2.AnchorSideLeft
  L4_2 = StatusPanel
  L3_2.Control = L4_2
  L3_2 = ManagerLabel
  L3_2 = L3_2.AnchorSideTop
  L4_2 = DateLabel
  L3_2.Control = L4_2
  L3_2 = ManagerLabel
  L3_2 = L3_2.AnchorSideTop
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = ManagerLabel
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 3
  L3_2 = createLabel
  L4_2 = StatusPanel
  L3_2 = L3_2(L4_2)
  SelectedLabel = L3_2
  L3_2 = SelectedLabel
  L3_2.Alignment = "taRightJustify"
  L3_2 = SelectedLabel
  L3_2.Font = L2_2
  L3_2 = SelectedLabel
  L3_2 = L3_2.AnchorSideTop
  L4_2 = StatusPanel
  L3_2.Control = L4_2
  L3_2 = SelectedLabel
  L3_2 = L3_2.AnchorSideRight
  L4_2 = StatusPanel
  L3_2.Control = L4_2
  L3_2 = SelectedLabel
  L3_2 = L3_2.AnchorSideRight
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = SelectedLabel
  L3_2.Anchors = "[akTop, akRight]"
  L3_2 = SelectedLabel
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 3
  L3_2 = createLabel
  L4_2 = StatusPanel
  L3_2 = L3_2(L4_2)
  ClubLabel = L3_2
  L3_2 = ClubLabel
  L3_2.Alignment = "taRightJustify"
  L3_2 = ClubLabel
  L3_2.Font = L2_2
  L3_2 = ClubLabel
  L3_2 = L3_2.AnchorSideTop
  L4_2 = SelectedLabel
  L3_2.Control = L4_2
  L3_2 = ClubLabel
  L3_2 = L3_2.AnchorSideTop
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = ClubLabel
  L3_2 = L3_2.AnchorSideRight
  L4_2 = StatusPanel
  L3_2.Control = L4_2
  L3_2 = ClubLabel
  L3_2 = L3_2.AnchorSideRight
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = ClubLabel
  L3_2.Anchors = "[akTop, akRight]"
  L3_2 = ClubLabel
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 3
end

loadStatusPanel = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadStatusPanel"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = getAddressList
  L0_2 = L0_2()
  L1_2 = getMainForm
  L1_2 = L1_2()
  L2_2 = createFont
  L2_2 = L2_2()
  L2_2.Name = "Consolas"
  L2_2.Quality = "fqDraft"
  L2_2.CharSet = "ANSI_CHARSET"
  L2_2.Pitch = "fpFixed"
  L2_2.Size = 8
  L3_2 = Table
  L3_2.MaxShowSearch = 100
  L3_2 = createPanel
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  SearchPanel = L3_2
  L3_2 = SearchPanel
  L4_2 = alBottom
  L3_2.Align = L4_2
  L3_2 = SearchPanel
  L3_2.Height = 33
  L3_2 = SearchPanel
  L3_2.ClientHeight = 33
  L3_2 = SearchPanel
  L4_2 = clNone
  L3_2.Color = L4_2
  L3_2 = createButton
  L4_2 = SearchPanel
  L3_2 = L3_2(L4_2)
  SearchButton = L3_2
  L3_2 = SearchButton
  L3_2.Width = 100
  L3_2 = SearchButton
  L3_2.Caption = "Search"
  L3_2 = SearchButton
  L3_2.Font = L2_2
  L3_2 = SearchButton
  L3_2.TabOrder = 3
  L3_2 = SearchButton
  L3_2 = L3_2.AnchorSideTop
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchButton
  L3_2 = L3_2.AnchorSideRight
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchButton
  L3_2 = L3_2.AnchorSideRight
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = SearchButton
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchButton
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = SearchButton
  L3_2.Anchors = "[akTop, akRight, akBottom]"
  L3_2 = SearchButton
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 4
  L3_2 = SearchButton
  
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = SearchButton
    L2_3 = crHourGlass
    L1_3.Cursor = L2_3
    L1_3 = tostring
    L2_3 = SearchBox
    L2_3 = L2_3.Text
    L1_3 = L1_3(L2_3)
    if L1_3 == nil then
      return
    end
    L2_3 = tonumber
    L3_3 = SearchType
    L3_3 = L3_3.ItemIndex
    L2_3 = L2_3(L3_3)
    L3_3 = tonumber
    L4_3 = SearchBox
    L4_3 = L4_3.Text
    L3_3 = L3_3(L4_3)
    if L3_3 then
      L4_3 = fmSearch
      L5_3 = L3_3
      L6_3 = L2_3
      L7_3 = true
      L4_3(L5_3, L6_3, L7_3)
    else
      L4_3 = fmSearch
      L5_3 = L1_3
      L6_3 = L2_3
      L4_3(L5_3, L6_3)
    end
    L4_3 = SearchButton
    L5_3 = crDefault
    L4_3.Cursor = L5_3
  end
  
  L3_2.OnClick = L4_2
  L3_2 = createButton
  L4_2 = SearchPanel
  L3_2 = L3_2(L4_2)
  ClearButton = L3_2
  L3_2 = ClearButton
  L3_2.Width = 100
  L3_2 = ClearButton
  L3_2.Caption = "Clear Result"
  L3_2 = ClearButton
  L3_2.Font = L2_2
  L3_2 = ClearButton
  L3_2.TabOrder = 2
  L3_2 = ClearButton
  L3_2 = L3_2.AnchorSideTop
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = ClearButton
  L3_2 = L3_2.AnchorSideRight
  L4_2 = SearchButton
  L3_2.Control = L4_2
  L3_2 = ClearButton
  L3_2 = L3_2.AnchorSideLeft
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = ClearButton
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = ClearButton
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = ClearButton
  L3_2.Anchors = "[akTop, akRight, akBottom]"
  L3_2 = ClearButton
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 4
  L3_2 = ClearButton
  
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = getAddressList
    L1_3 = L1_3()
    L1_3 = L1_3.getMemoryRecordByID
    L2_3 = 16899
    L1_3 = L1_3(L2_3)
    while true do
      L2_3 = L1_3.Count
      if L2_3 == 0 then
        break
      end
      L2_3 = L1_3.Child
      L2_3 = L2_3[0]
      L2_3 = L2_3.Destroy
      L2_3()
    end
    L1_3.Description = "Search >"
    L1_3.Active = false
  end
  
  L3_2.OnClick = L4_2
  L3_2 = createComboBox
  L4_2 = SearchPanel
  L3_2 = L3_2(L4_2)
  SearchType = L3_2
  L3_2 = SearchType
  L3_2.Width = 100
  L3_2 = SearchType
  L3_2.Font = L2_2
  L3_2 = SearchType
  L3_2.TabOrder = 1
  L3_2 = SearchType
  L3_2 = L3_2.AnchorSideLeft
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = SearchType
  L3_2 = L3_2.AnchorSideTop
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchType
  L3_2 = L3_2.AnchorSideRight
  L4_2 = ClearButton
  L3_2.Control = L4_2
  L3_2 = SearchType
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchType
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = SearchType
  L3_2.Anchors = "[akTop, akRight, akBottom]"
  L3_2 = SearchType
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 5
  L3_2 = createEdit
  L4_2 = SearchPanel
  L3_2 = L3_2(L4_2)
  SearchBox = L3_2
  L3_2 = SearchBox
  L3_2.Width = 100
  L3_2 = SearchBox
  L4_2 = string
  L4_2 = L4_2.format
  L5_2 = "Enter keyword or UID to search (Show: %d)"
  L6_2 = Table
  L6_2 = L6_2.MaxShowSearch
  L4_2 = L4_2(L5_2, L6_2)
  L3_2.TextHint = L4_2
  L3_2 = SearchBox
  L4_2 = clBlack
  L3_2.TextHintFontColor = L4_2
  L3_2 = SearchBox
  L4_2 = fsBold
  L3_2.TextHintFontStyle = L4_2
  L3_2 = SearchBox
  L3_2.Font = L2_2
  L3_2 = SearchBox
  L3_2.TabOrder = 0
  L3_2 = SearchBox
  L3_2 = L3_2.AnchorSideLeft
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchBox
  L3_2 = L3_2.AnchorSideTop
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchBox
  L3_2 = L3_2.AnchorSideRight
  L4_2 = SearchType
  L3_2.Control = L4_2
  L3_2 = SearchBox
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchBox
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = SearchBox
  L3_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L3_2 = SearchBox
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 5
  L3_2 = SearchBox
  
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = isKeyPressed
    L2_3 = VK_RETURN
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L1_3 = SearchBox
      L2_3 = crHourGlass
      L1_3.Cursor = L2_3
      L1_3 = tostring
      L2_3 = SearchBox
      L2_3 = L2_3.Text
      L1_3 = L1_3(L2_3)
      if L1_3 == nil then
        return
      end
      L2_3 = tonumber
      L3_3 = SearchType
      L3_3 = L3_3.ItemIndex
      L2_3 = L2_3(L3_3)
      L3_3 = tonumber
      L4_3 = SearchBox
      L4_3 = L4_3.Text
      L3_3 = L3_3(L4_3)
      if L3_3 then
        L4_3 = fmSearch
        L5_3 = L3_3
        L6_3 = L2_3
        L7_3 = true
        L4_3(L5_3, L6_3, L7_3)
      else
        L4_3 = fmSearch
        L5_3 = L1_3
        L6_3 = L2_3
        L4_3(L5_3, L6_3)
      end
      L4_3 = SearchBox
      L5_3 = crDefault
      L4_3.Cursor = L5_3
    end
  end
  
  L3_2.OnKeyDown = L4_2
  L3_2 = createProgressBar
  L4_2 = SearchPanel
  L3_2 = L3_2(L4_2)
  SearchProgress = L3_2
  L3_2 = SearchProgress
  L3_2.Width = 100
  L3_2 = SearchProgress
  L3_2.Height = 20
  L3_2 = SearchProgress
  L3_2.TabOrder = 1
  L3_2 = SearchProgress
  L3_2 = L3_2.AnchorSideLeft
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchProgress
  L3_2 = L3_2.AnchorSideTop
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchProgress
  L3_2 = L3_2.AnchorSideRight
  L4_2 = SearchType
  L3_2.Control = L4_2
  L3_2 = SearchProgress
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = SearchPanel
  L3_2.Control = L4_2
  L3_2 = SearchProgress
  L3_2 = L3_2.AnchorSideBottom
  L4_2 = asrBottom
  L3_2.Side = L4_2
  L3_2 = SearchProgress
  L3_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L3_2 = SearchProgress
  L3_2 = L3_2.BorderSpacing
  L3_2.Around = 4
  L3_2 = {}
  L3_2[0] = "Award"
  L3_2[1] = "City"
  L3_2[2] = "Club"
  L3_2[3] = "Competition"
  L3_2[4] = "Derby"
  L3_2[5] = "Nation"
  L3_2[6] = "Person"
  L3_2[7] = "Stadium"
  L3_2[8] = "Team"
  L4_2 = 0
  L5_2 = #L3_2
  L6_2 = 1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = SearchType
    L8_2 = L8_2.Items
    L8_2 = L8_2.add
    L9_2 = L3_2[L7_2]
    L8_2(L9_2)
  end
  L4_2 = SearchProgress
  L4_2.Visible = false
  L4_2 = SearchType
  L4_2.ItemIndex = 6
  L4_2 = SearchType
  L4_2.Style = "csDropDownList"
  L4_2 = SearchPanel
  L5_2 = alTop
  L4_2.Align = L5_2
end

loadSearchPanel = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "loadSearchPanel"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2
  L0_2 = MassEditManager
  L0_2 = L0_2.ApplyButton
  
  function L1_2(A0_3)
    local L1_3
    L1_3 = MassEditManager
    L1_3 = L1_3.CEPageControl1
    L1_3 = L1_3.ActivePage
    L1_3 = L1_3.Name
    if L1_3 == "TabSheet1" then
      L1_3 = massEditClubs
      L1_3()
    else
      L1_3 = MassEditManager
      L1_3 = L1_3.CEPageControl1
      L1_3 = L1_3.ActivePage
      L1_3 = L1_3.Name
      if L1_3 == "TabSheet2" then
      else
        return
      end
    end
  end
  
  L0_2.OnClick = L1_2
  L0_2 = MassEditManager
  L0_2 = L0_2.CancelButton
  
  function L1_2(A0_3)
    local L1_3
    L1_3 = MassEditManager
    L1_3 = L1_3.Close
    L1_3()
  end
  
  L0_2.OnClick = L1_2
  L0_2 = MassEditManager
  L0_2 = L0_2.ftbtCnti
  
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = createCustomSelectionList
    L2_3 = "Nation List"
    L3_3 = NationTableStart
    L4_3 = NationTableEnd
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    if L1_3 == nil then
      return
    end
    L2_3 = getObjectName
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L3_3 = MassEditManager
    L3_3 = L3_3.ftebCnti
    L3_3.Text = L2_3
  end
  
  L0_2.OnClick = L1_2
  L0_2 = MassEditManager
  L0_2 = L0_2.ftbtCdiv
  
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = createCustomSelectionList
    L2_3 = "Competition List"
    L3_3 = CompTableStart
    L4_3 = CompTableEnd
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    if L1_3 == nil then
      return
    end
    L2_3 = getObjectName
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L3_3 = MassEditManager
    L3_3 = L3_3.ftebCdiv
    L3_3.Text = L2_3
  end
  
  L0_2.OnClick = L1_2
end

massEditManagerInit = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "massEditManagerInit"
L8_1(L9_1)

function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = {}
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = readQword
    L1_3 = "ptrClub"
    L0_3 = L0_3(L1_3)
    if L0_3 == nil or L0_3 == 0 then
      return
    end
    L1_3 = getObjectName
    L2_3 = L0_3
    L1_3 = L1_3(L2_3)
    L2_3 = L1_3
    L3_3 = L0_3
    return L2_3, L3_3
  end
  
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = getAddressSafe
    L3_3 = A0_3[A1_3]
    L2_3 = L2_3(L3_3)
    L3_3 = typeOptionMaps
    L3_3 = L3_3.teamType
    L4_3 = readByte
    L5_3 = teao
    L5_3 = L5_3.Ttyp
    L5_3 = L2_3 + L5_3
    L4_3 = L4_3(L5_3)
    L3_3 = L3_3[L4_3]
    L4_3 = getObjectName
    L5_3 = getCompetitionFromTeam
    L6_3 = L2_3
    L5_3, L6_3 = L5_3(L6_3)
    L4_3 = L4_3(L5_3, L6_3)
    L5_3 = L3_3
    L6_3 = L4_3
    return L5_3, L6_3
  end
  
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3
    L2_3 = getAddressSafe
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    if L2_3 == nil or L2_3 == 0 then
      L3_3 = true
      return L3_3
    end
    L3_3 = isInactiveLeague
    L4_3 = L2_3
    L3_3 = L3_3(L4_3)
    if L3_3 then
      L3_3 = true
      return L3_3
    end
    L3_3 = readQword
    L4_3 = cmpo
    L4_3 = L4_3.Cacm
    L4_3 = L2_3 + L4_3
    L3_3 = L3_3(L4_3)
    if L3_3 == nil or L3_3 == 0 then
      return
    end
    L4_3 = readQword
    L5_3 = readQword
    L6_3 = cmpo
    L6_3 = L6_3.Clge
    L6_3 = L3_3 + L6_3
    L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3 = L5_3(L6_3)
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
    if L4_3 ~= nil and L4_3 ~= 0 then
      L5_3 = isLeague
      L6_3 = L4_3
      L5_3 = L5_3(L6_3)
      if L5_3 then
        goto lbl_44
      end
    end
    do return end
    ::lbl_44::
    L5_3 = readQword
    L6_3 = cmpo
    L6_3 = L6_3.Clst
    L6_3 = L4_3 + L6_3
    L5_3 = L5_3(L6_3)
    if L5_3 == nil or L5_3 == 0 then
      return
    end
    L6_3 = readQword
    L7_3 = cmpo
    L7_3 = L7_3.Cltb
    L7_3 = L4_3 + L7_3
    L6_3 = L6_3(L7_3)
    L7_3 = readQword
    L8_3 = cmpo
    L8_3 = L8_3.Cltb
    L8_3 = L4_3 + L8_3
    L8_3 = L8_3 + 8
    L7_3 = L7_3(L8_3)
    L8_3 = readByte
    L9_3 = L5_3 + 123
    L8_3 = L8_3(L9_3)
    L8_3 = L8_3 - 1
    L9_3 = readByte
    L10_3 = L5_3 + 122
    L9_3 = L9_3(L10_3)
    L8_3 = L8_3 * L9_3
    L9_3 = false
    L10_3 = forEach
    L11_3 = L6_3
    L12_3 = L7_3
    L13_3 = 8
    
    function L14_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4
      L2_4 = Table
      L2_4 = L2_4.MaxShowItem
      if A0_4 > L2_4 then
        L2_4 = false
        return L2_4
      end
      L2_4 = readQword
      L3_4 = A1_4
      L2_4 = L2_4(L3_4)
      L3_4 = getObjectName
      L4_4 = readQword
      L5_4 = L2_4 + 120
      L4_4, L5_4 = L4_4(L5_4)
      L3_4 = L3_4(L4_4, L5_4)
      L4_4 = A1_3
      if L3_4 == L4_4 then
        L4_4 = readByte
        L5_4 = L2_4 + 14
        L4_4 = L4_4(L5_4)
        L5_4 = L8_3
        if L4_4 == L5_4 then
          L5_4 = true
          L9_3 = L5_4
        end
        L5_4 = false
        return L5_4
      end
    end
    
    L10_3(L11_3, L12_3, L13_3, L14_3)
    return L9_3
  end
  
  L7_2 = SwapManager
  L7_2 = L7_2.SelClu1
  
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = L4_2
    L1_3, L2_3 = L1_3()
    L3_3 = ""
    L4_3 = ""
    L5_3 = table
    L5_3 = L5_3.remove
    L6_3 = L0_2
    L5_3(L6_3)
    L5_3 = forEachTeamInClub
    L6_3 = L2_3
    
    function L7_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4
      L2_4 = readQword
      L3_4 = A1_4
      L2_4 = L2_4(L3_4)
      L3_4 = readByte
      L4_4 = teao
      L4_4 = L4_4.Ttyp
      L4_4 = L2_4 + L4_4
      L3_4 = L3_4(L4_4)
      L4_4 = typeOptionMaps
      L4_4 = L4_4.teamType
      L4_4 = L4_4[L3_4]
      if L3_4 == 0 then
        L5_4 = L3_3
        L6_4 = L1_3
        L7_4 = "\r\n"
        L5_4 = L5_4 .. L6_4 .. L7_4
        L3_3 = L5_4
      else
        L5_4 = L3_3
        L6_4 = L1_3
        L7_4 = " "
        L8_4 = L4_4
        L9_4 = "\r\n"
        L5_4 = L5_4 .. L6_4 .. L7_4 .. L8_4 .. L9_4
        L3_3 = L5_4
      end
      L5_4 = L4_3
      L6_4 = L4_4
      L7_4 = "\r\n"
      L5_4 = L5_4 .. L6_4 .. L7_4
      L4_3 = L5_4
      L5_4 = A0_4 - 1
      L6_4 = hex
      L7_4 = L2_4
      L6_4 = L6_4(L7_4)
      L0_2[L5_4] = L6_4
    end
    
    L5_3(L6_3, L7_3)
    L5_3 = SwapManager
    L5_3 = L5_3.Cnam1
    L5_3.Text = L1_3
    L5_3 = SwapManager
    L5_3 = L5_3.Ctea1
    L5_3 = L5_3.Items
    L5_3.Text = L3_3
    L5_3 = SwapManager
    L5_3 = L5_3.Ctea1
    L5_3.ItemIndex = 0
    L5_3 = L5_2
    L6_3 = L0_2
    L7_3 = SwapManager
    L7_3 = L7_3.Ctea1
    L7_3 = L7_3.ItemIndex
    L5_3, L6_3 = L5_3(L6_3, L7_3)
    L7_3 = SwapManager
    L7_3 = L7_3.Ttyp1
    L7_3.Text = L5_3
    L7_3 = SwapManager
    L7_3 = L7_3.Tdvi1
    L7_3.Text = L6_3
  end
  
  L7_2.OnClick = L8_2
  L7_2 = SwapManager
  L7_2 = L7_2.SelClu2
  
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = L4_2
    L1_3, L2_3 = L1_3()
    L3_3 = ""
    L4_3 = ""
    L5_3 = table
    L5_3 = L5_3.remove
    L6_3 = L1_2
    L5_3(L6_3)
    L5_3 = forEachTeamInClub
    L6_3 = L2_3
    
    function L7_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4
      L2_4 = readQword
      L3_4 = A1_4
      L2_4 = L2_4(L3_4)
      L3_4 = readByte
      L4_4 = teao
      L4_4 = L4_4.Ttyp
      L4_4 = L2_4 + L4_4
      L3_4 = L3_4(L4_4)
      L4_4 = typeOptionMaps
      L4_4 = L4_4.teamType
      L4_4 = L4_4[L3_4]
      if L3_4 == 0 then
        L5_4 = L3_3
        L6_4 = L1_3
        L7_4 = "\r\n"
        L5_4 = L5_4 .. L6_4 .. L7_4
        L3_3 = L5_4
      else
        L5_4 = L3_3
        L6_4 = L1_3
        L7_4 = " "
        L8_4 = L4_4
        L9_4 = "\r\n"
        L5_4 = L5_4 .. L6_4 .. L7_4 .. L8_4 .. L9_4
        L3_3 = L5_4
      end
      L5_4 = L4_3
      L6_4 = L4_4
      L7_4 = "\r\n"
      L5_4 = L5_4 .. L6_4 .. L7_4
      L4_3 = L5_4
      L5_4 = A0_4 - 1
      L6_4 = hex
      L7_4 = L2_4
      L6_4 = L6_4(L7_4)
      L1_2[L5_4] = L6_4
    end
    
    L5_3(L6_3, L7_3)
    L5_3 = SwapManager
    L5_3 = L5_3.Cnam2
    L5_3.Text = L1_3
    L5_3 = SwapManager
    L5_3 = L5_3.Ctea2
    L5_3 = L5_3.Items
    L5_3.Text = L3_3
    L5_3 = SwapManager
    L5_3 = L5_3.Ctea2
    L5_3.ItemIndex = 0
    L5_3 = L5_2
    L6_3 = L1_2
    L7_3 = SwapManager
    L7_3 = L7_3.Ctea2
    L7_3 = L7_3.ItemIndex
    L5_3, L6_3 = L5_3(L6_3, L7_3)
    L7_3 = SwapManager
    L7_3 = L7_3.Ttyp2
    L7_3.Text = L5_3
    L7_3 = SwapManager
    L7_3 = L7_3.Tdvi2
    L7_3.Text = L6_3
  end
  
  L7_2.OnClick = L8_2
  L7_2 = SwapManager
  L7_2 = L7_2.Ctea1
  
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L5_2
    L2_3 = L0_2
    L3_3 = SwapManager
    L3_3 = L3_3.Ctea1
    L3_3 = L3_3.ItemIndex
    L1_3, L2_3 = L1_3(L2_3, L3_3)
    L3_3 = SwapManager
    L3_3 = L3_3.Ttyp1
    L3_3.Text = L1_3
    L3_3 = SwapManager
    L3_3 = L3_3.Tdvi1
    L3_3.Text = L2_3
  end
  
  L7_2.OnChange = L8_2
  L7_2 = SwapManager
  L7_2 = L7_2.Ctea2
  
  function L8_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L5_2
    L2_3 = L1_2
    L3_3 = SwapManager
    L3_3 = L3_3.Ctea2
    L3_3 = L3_3.ItemIndex
    L1_3, L2_3 = L1_3(L2_3, L3_3)
    L3_3 = SwapManager
    L3_3 = L3_3.Ttyp2
    L3_3.Text = L1_3
    L3_3 = SwapManager
    L3_3 = L3_3.Tdvi2
    L3_3.Text = L2_3
  end
  
  L7_2.OnChange = L8_2
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = nil
  L13_2 = SwapManager
  L13_2 = L13_2.Timer
  L13_2.Interval = 1000
  L13_2 = SwapManager
  L13_2 = L13_2.Timer
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = SwapManager
    L1_3 = L1_3.Visible
    if not L1_3 then
      L1_3 = SwapManager
      L1_3 = L1_3.Timer
      L1_3.Enabled = false
    end
    L1_3 = getAddressSafe
    L2_3 = SwapManager
    L2_3 = L2_3.Ctea1
    L2_3 = L2_3.ItemIndex
    L2_3 = L0_2[L2_3]
    L1_3 = L1_3(L2_3)
    L2_2.Ctea = L1_3
    L1_3 = getObjectName
    L2_3 = L2_2.Ctea
    L1_3 = L1_3(L2_3)
    L2_2.Cnam = L1_3
    L1_3 = getCompetitionFromTeam
    L2_3 = L2_2.Ctea
    L1_3 = L1_3(L2_3)
    L2_2.Tdvi = L1_3
    L1_3 = getNextCompetitionFromTeam
    L2_3 = L2_2.Ctea
    L1_3 = L1_3(L2_3)
    L2_2.Tndi = L1_3
    L1_3 = getAddressSafe
    L2_3 = SwapManager
    L2_3 = L2_3.Ctea2
    L2_3 = L2_3.ItemIndex
    L2_3 = L1_2[L2_3]
    L1_3 = L1_3(L2_3)
    L3_2.Ctea = L1_3
    L1_3 = getObjectName
    L2_3 = L3_2.Ctea
    L1_3 = L1_3(L2_3)
    L3_2.Cnam = L1_3
    L1_3 = getCompetitionFromTeam
    L2_3 = L3_2.Ctea
    L1_3 = L1_3(L2_3)
    L3_2.Tdvi = L1_3
    L1_3 = getNextCompetitionFromTeam
    L2_3 = L3_2.Ctea
    L1_3 = L1_3(L2_3)
    L3_2.Tndi = L1_3
    L1_3 = SwapManager
    L1_3 = L1_3.Cnam1
    L1_3 = L1_3.Text
    L2_3 = SwapManager
    L2_3 = L2_3.Cnam2
    L2_3 = L2_3.Text
    if L1_3 == L2_3 then
      L1_3 = SwapManager
      L1_3 = L1_3.ClubReq1
      L1_3.Caption = "[false]"
      L1_3 = SwapManager
      L1_3 = L1_3.ClubReq1
      L1_3 = L1_3.Font
      L2_3 = clRed
      L1_3.Color = L2_3
      L1_3 = false
      L7_2 = L1_3
    else
      L1_3 = SwapManager
      L1_3 = L1_3.ClubReq1
      L1_3.Caption = "[true]"
      L1_3 = SwapManager
      L1_3 = L1_3.ClubReq1
      L1_3 = L1_3.Font
      L2_3 = clGreen
      L1_3.Color = L2_3
      L1_3 = true
      L7_2 = L1_3
    end
    L1_3 = L6_2
    L2_3 = L2_2.Tdvi
    L3_3 = L2_2.Cnam
    L1_3 = L1_3(L2_3, L3_3)
    L2_3 = L6_2
    L3_3 = L3_2.Tdvi
    L4_3 = L3_2.Cnam
    L2_3 = L2_3(L3_3, L4_3)
    L3_3 = L2_2.Tdvi
    if L3_3 ~= nil then
      L3_3 = L2_2.Tdvi
      if L3_3 ~= 0 then
        L3_3 = L3_2.Tdvi
        if L3_3 ~= nil then
          L3_3 = L3_2.Tdvi
          if L3_3 ~= 0 then
            goto lbl_106
          end
        end
      end
    end
    L3_3 = SwapManager
    L3_3 = L3_3.ClubReq2
    L3_3.Caption = "[true]"
    L3_3 = SwapManager
    L3_3 = L3_3.ClubReq2
    L3_3 = L3_3.Font
    L4_3 = clGreen
    L3_3.Color = L4_3
    L3_3 = true
    L8_2 = L3_3
    goto lbl_131
    ::lbl_106::
    if not L1_3 or not L2_3 then
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq2
      L3_3.Caption = "[false]"
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq2
      L3_3 = L3_3.Font
      L4_3 = clRed
      L3_3.Color = L4_3
      L3_3 = false
      L8_2 = L3_3
    else
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq2
      L3_3.Caption = "[true]"
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq2
      L3_3 = L3_3.Font
      L4_3 = clGreen
      L3_3.Color = L4_3
      L3_3 = true
      L8_2 = L3_3
    end
    ::lbl_131::
    L3_3 = L2_2.Tdvi
    if L3_3 ~= nil then
      L3_3 = L2_2.Tdvi
      if L3_3 ~= 0 then
        L3_3 = L3_2.Tdvi
        if L3_3 ~= nil then
          L3_3 = L3_2.Tdvi
          if L3_3 ~= 0 then
            goto lbl_154
          end
        end
      end
    end
    L3_3 = SwapManager
    L3_3 = L3_3.ClubReq3
    L3_3.Caption = "[true]"
    L3_3 = SwapManager
    L3_3 = L3_3.ClubReq3
    L3_3 = L3_3.Font
    L4_3 = clGreen
    L3_3.Color = L4_3
    L3_3 = true
    L9_2 = L3_3
    goto lbl_179
    ::lbl_154::
    L3_3 = L2_2.Tdvi
    L4_3 = L3_2.Tdvi
    if L3_3 == L4_3 then
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq3
      L3_3.Caption = "[false]"
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq3
      L3_3 = L3_3.Font
      L4_3 = clRed
      L3_3.Color = L4_3
      L3_3 = false
      L9_2 = L3_3
    else
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq3
      L3_3.Caption = "[true]"
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq3
      L3_3 = L3_3.Font
      L4_3 = clGreen
      L3_3.Color = L4_3
      L3_3 = true
      L9_2 = L3_3
    end
    ::lbl_179::
    L3_3 = L2_2.Tdvi
    if L3_3 ~= nil then
      L3_3 = L2_2.Tdvi
      if L3_3 ~= 0 then
        L3_3 = L3_2.Tdvi
        if L3_3 ~= nil then
          L3_3 = L3_2.Tdvi
          if L3_3 ~= 0 then
            goto lbl_202
          end
        end
      end
    end
    L3_3 = SwapManager
    L3_3 = L3_3.ClubReq4
    L3_3.Caption = "[true]"
    L3_3 = SwapManager
    L3_3 = L3_3.ClubReq4
    L3_3 = L3_3.Font
    L4_3 = clGreen
    L3_3.Color = L4_3
    L3_3 = true
    L10_2 = L3_3
    goto lbl_229
    ::lbl_202::
    L3_3 = L2_2.Tndi
    if L3_3 == 0 then
      L3_3 = L3_2.Tndi
      if L3_3 == 0 then
        L3_3 = SwapManager
        L3_3 = L3_3.ClubReq4
        L3_3.Caption = "[true]"
        L3_3 = SwapManager
        L3_3 = L3_3.ClubReq4
        L3_3 = L3_3.Font
        L4_3 = clGreen
        L3_3.Color = L4_3
        L3_3 = true
        L10_2 = L3_3
    end
    else
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq4
      L3_3.Caption = "[false]"
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq4
      L3_3 = L3_3.Font
      L4_3 = clRed
      L3_3.Color = L4_3
      L3_3 = false
      L10_2 = L3_3
    end
    ::lbl_229::
    L3_3 = SwapManager
    L3_3 = L3_3.Ttyp1
    L3_3 = L3_3.Text
    L4_3 = SwapManager
    L4_3 = L4_3.Ttyp2
    L4_3 = L4_3.Text
    if L3_3 == L4_3 then
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq5
      L3_3.Caption = "[true]"
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq5
      L3_3 = L3_3.Font
      L4_3 = clGreen
      L3_3.Color = L4_3
      L3_3 = true
      L11_2 = L3_3
    else
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq5
      L3_3.Caption = "[false]"
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq5
      L3_3 = L3_3.Font
      L4_3 = clRed
      L3_3.Color = L4_3
      L3_3 = false
      L11_2 = L3_3
    end
    L3_3 = L7_2
    if L3_3 then
      L3_3 = L8_2
      if L3_3 then
        L3_3 = L9_2
        if L3_3 then
          L3_3 = L10_2
          if L3_3 then
            L3_3 = L11_2
            if L3_3 then
              L3_3 = SwapManager
              L3_3 = L3_3.ClubReq6
              L3_3.Caption = "[true]"
              L3_3 = SwapManager
              L3_3 = L3_3.ClubReq6
              L3_3 = L3_3.Font
              L4_3 = clGreen
              L3_3.Color = L4_3
              L3_3 = true
              L12_2 = L3_3
          end
        end
      end
    end
    else
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq6
      L3_3.Caption = "[false]"
      L3_3 = SwapManager
      L3_3 = L3_3.ClubReq6
      L3_3 = L3_3.Font
      L4_3 = clRed
      L3_3.Color = L4_3
      L3_3 = false
      L12_2 = L3_3
    end
  end
  
  L13_2.OnTimer = L14_2
  L13_2 = SwapManager
  L13_2 = L13_2.Timer
  L13_2.Enabled = true
  L13_2 = SwapManager
  L13_2 = L13_2.ApplyButton
  
  function L14_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = SwapManager
    L1_3 = L1_3.CEPageControl1
    L1_3 = L1_3.ActivePage
    L1_3 = L1_3.Name
    if L1_3 == "TabSheet1" then
      L1_3 = L12_2
      if L1_3 then
        L1_3 = SwapClub
        L2_3 = L2_2.Ctea
        L3_3 = L3_2.Ctea
        L1_3(L2_3, L3_3)
      else
        L1_3 = MessageDialog
        L2_3 = string
        L2_3 = L2_3.format
        L3_3 = "All requirements must be meet!"
        L4_3 = 2
        L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
        L1_3(L2_3, L3_3, L4_3)
      end
    else
      L1_3 = SwapManager
      L1_3 = L1_3.CEPageControl1
      L1_3 = L1_3.ActivePage
      L1_3 = L1_3.Name
      if L1_3 == "TabSheet2" then
      else
        return
      end
    end
  end
  
  L13_2.OnClick = L14_2
  L13_2 = SwapManager
  L13_2 = L13_2.CancelButton
  
  function L14_2(A0_3)
    local L1_3
    L1_3 = SwapManager
    L1_3 = L1_3.Close
    L1_3()
  end
  
  L13_2.OnClick = L14_2
end

swapManagerInit = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "swapManagerInit"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L3_2 = readQword
  L4_2 = "ptrPerson"
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPerson
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L4_2 = getAddressSafe
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = createFont
  L5_2 = L5_2()
  L5_2.CharSet = "ANSI_CHARSET"
  L5_2.Size = 8
  L5_2.Name = "Segoe UI Semibold"
  L5_2.Pitch = "fpVariable"
  L5_2.Quality = "fqDraft"
  L5_2.Style = "[fsBold]"
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "Club\r\n"
  L8_2 = "Person"
  L7_2 = L7_2 .. L8_2
  L6_2 = L6_2(L7_2)
  L7_2 = string
  L7_2 = L7_2.format
  L8_2 = "Favourite Person\r\n"
  L9_2 = "Disliked Person"
  L8_2 = L8_2 .. L9_2
  L7_2 = L7_2(L8_2)
  L8_2 = string
  L8_2 = L8_2.format
  L9_2 = "Favourite Club\r\n"
  L10_2 = "Disliked Club"
  L9_2 = L9_2 .. L10_2
  L8_2 = L8_2(L9_2)
  L9_2 = string
  L9_2 = L9_2.format
  L10_2 = "Supporter\r\n"
  L11_2 = "Player\r\n"
  L12_2 = "Manager\r\n"
  L13_2 = "Backroom Staff"
  L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
  L9_2 = L9_2(L10_2)
  L10_2 = string
  L10_2 = L10_2.format
  L11_2 = "No Info\r\n"
  L12_2 = "Father\r\n"
  L13_2 = "Brother\r\n"
  L14_2 = "Son\r\n"
  L15_2 = "Relation\r\n"
  L16_2 = "Teammate\r\n"
  L17_2 = "Manager\r\n"
  L18_2 = "Player\r\n"
  L19_2 = "Backroom Staff\r\n"
  L20_2 = "Idol\r\n"
  L21_2 = "Friend"
  L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2
  L10_2 = L10_2(L11_2)
  L11_2 = createForm
  L12_2 = false
  L11_2 = L11_2(L12_2)
  L11_2.BorderIcons = "[biSystemMenu]"
  L11_2.BorderStyle = "bsDialog"
  L11_2.Caption = "Add Person Relation"
  L12_2 = TreeView
  L12_2 = L12_2.Color
  L11_2.Color = L12_2
  L11_2.Height = 163
  L11_2.Position = "poMainFormCenter"
  L11_2.Width = 400
  L11_2.Font = L5_2
  L12_2 = createPanel
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  L13_2 = L12_2.AnchorSideLeft
  L13_2.Control = L11_2
  L13_2 = L12_2.AnchorSideTop
  L13_2.Control = L11_2
  L13_2 = L12_2.AnchorSideRight
  L13_2.Control = L11_2
  L13_2 = L12_2.AnchorSideRight
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L12_2.Left = 0
  L12_2.Height = 128
  L12_2.Top = 0
  L12_2.Width = 382
  L12_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L12_2.ClientHeight = 128
  L12_2.ClientWidth = 382
  L12_2.TabOrder = 0
  L12_2.ParentColor = false
  L13_2 = clWhite
  L12_2.Color = L13_2
  L13_2 = createLabel
  L14_2 = L12_2
  L13_2 = L13_2(L14_2)
  L14_2 = L13_2.AnchorSideLeft
  L14_2.Control = L12_2
  L14_2 = L13_2.AnchorSideTop
  L14_2.Control = L12_2
  L13_2.Left = 11
  L13_2.Height = 13
  L13_2.Top = 11
  L13_2.Width = 60
  L14_2 = L13_2.BorderSpacing
  L14_2.Around = 10
  L13_2.ParentFont = true
  L13_2.Caption = "Object Type"
  L13_2.ParentColor = false
  L14_2 = createLabel
  L15_2 = L12_2
  L14_2 = L14_2(L15_2)
  L15_2 = L14_2.AnchorSideLeft
  L15_2.Control = L12_2
  L15_2 = L14_2.AnchorSideTop
  L15_2.Control = L13_2
  L15_2 = L14_2.AnchorSideTop
  L16_2 = asrBottom
  L15_2.Side = L16_2
  L14_2.Left = 11
  L14_2.Height = 13
  L14_2.Top = 34
  L14_2.Width = 66
  L15_2 = L14_2.BorderSpacing
  L15_2.Around = 10
  L14_2.ParentFont = true
  L14_2.Caption = "Object Name"
  L14_2.ParentColor = false
  L15_2 = createLabel
  L16_2 = L12_2
  L15_2 = L15_2(L16_2)
  L16_2 = L15_2.AnchorSideLeft
  L16_2.Control = L12_2
  L16_2 = L15_2.AnchorSideTop
  L16_2.Control = L14_2
  L16_2 = L15_2.AnchorSideTop
  L17_2 = asrBottom
  L16_2.Side = L17_2
  L15_2.Left = 11
  L15_2.Height = 13
  L15_2.Top = 57
  L15_2.Width = 90
  L16_2 = L15_2.BorderSpacing
  L16_2.Around = 10
  L15_2.ParentFont = true
  L15_2.Caption = "Relationship Type"
  L15_2.ParentColor = false
  L16_2 = createLabel
  L17_2 = L12_2
  L16_2 = L16_2(L17_2)
  L17_2 = L16_2.AnchorSideLeft
  L17_2.Control = L12_2
  L17_2 = L16_2.AnchorSideTop
  L17_2.Control = L15_2
  L17_2 = L16_2.AnchorSideTop
  L18_2 = asrBottom
  L17_2.Side = L18_2
  L16_2.Left = 11
  L16_2.Height = 13
  L16_2.Top = 80
  L16_2.Width = 37
  L17_2 = L16_2.BorderSpacing
  L17_2.Around = 10
  L16_2.ParentFont = true
  L16_2.Caption = "Reason"
  L16_2.ParentColor = false
  L17_2 = createLabel
  L18_2 = L12_2
  L17_2 = L17_2(L18_2)
  L18_2 = L17_2.AnchorSideLeft
  L18_2.Control = L12_2
  L18_2 = L17_2.AnchorSideTop
  L18_2.Control = L16_2
  L18_2 = L17_2.AnchorSideTop
  L19_2 = asrBottom
  L18_2.Side = L19_2
  L17_2.Left = 11
  L17_2.Height = 13
  L17_2.Top = 103
  L17_2.Width = 26
  L18_2 = L17_2.BorderSpacing
  L18_2.Around = 10
  L17_2.ParentFont = true
  L17_2.Caption = "Level"
  L17_2.ParentColor = false
  L18_2 = createComboBox
  L19_2 = L12_2
  L18_2 = L18_2(L19_2)
  L19_2 = L18_2.AnchorSideTop
  L19_2.Control = L13_2
  L19_2 = L18_2.AnchorSideTop
  L20_2 = asrCenter
  L19_2.Side = L20_2
  L19_2 = L18_2.AnchorSideRight
  L19_2.Control = L12_2
  L19_2 = L18_2.AnchorSideRight
  L20_2 = asrBottom
  L19_2.Side = L20_2
  L18_2.Left = 221
  L18_2.Height = 21
  L18_2.Top = 7
  L18_2.Width = 150
  L18_2.Anchors = "[akTop, akRight]"
  L19_2 = L18_2.BorderSpacing
  L19_2.Right = 10
  L18_2.ParentFont = true
  L18_2.ItemHeight = 13
  L19_2 = L18_2.Items
  L19_2.Text = L6_2
  L18_2.Style = "csDropDownList"
  L18_2.TabOrder = 0
  L19_2 = createEdit
  L20_2 = L12_2
  L19_2 = L19_2(L20_2)
  L20_2 = L19_2.AnchorSideTop
  L20_2.Control = L14_2
  L20_2 = L19_2.AnchorSideTop
  L21_2 = asrCenter
  L20_2.Side = L21_2
  L20_2 = L19_2.AnchorSideRight
  L20_2.Control = L12_2
  L20_2 = L19_2.AnchorSideRight
  L21_2 = asrBottom
  L20_2.Side = L21_2
  L19_2.Left = 221
  L19_2.Height = 21
  L19_2.Top = 30
  L19_2.Width = 150
  L19_2.Anchors = "[akTop, akRight]"
  L20_2 = L19_2.BorderSpacing
  L20_2.Right = 10
  L19_2.Enabled = false
  L19_2.ParentFont = true
  L19_2.TabOrder = 1
  L19_2.SelStart = 0
  L19_2.SelLength = 0
  L20_2 = clBlack
  L19_2.TextHintFontColor = L20_2
  L20_2 = fsBold
  L19_2.TextHintFontStyle = L20_2
  L20_2 = createButton
  L21_2 = L12_2
  L20_2 = L20_2(L21_2)
  L21_2 = L20_2.AnchorSideTop
  L21_2.Control = L14_2
  L21_2 = L20_2.AnchorSideTop
  L22_2 = asrCenter
  L21_2.Side = L22_2
  L21_2 = L20_2.AnchorSideRight
  L21_2.Control = L19_2
  L20_2.Left = 141
  L20_2.Height = 21
  L20_2.Top = 28
  L20_2.Width = 65
  L20_2.Anchors = "[akTop, akRight]"
  L21_2 = L20_2.BorderSpacing
  L21_2.Around = 5
  L20_2.ParentFont = true
  L20_2.Caption = "Search"
  L20_2.TabOrder = 2
  L21_2 = createComboBox
  L22_2 = L12_2
  L21_2 = L21_2(L22_2)
  L22_2 = L21_2.AnchorSideTop
  L22_2.Control = L15_2
  L22_2 = L21_2.AnchorSideTop
  L23_2 = asrCenter
  L22_2.Side = L23_2
  L22_2 = L21_2.AnchorSideRight
  L22_2.Control = L12_2
  L22_2 = L21_2.AnchorSideRight
  L23_2 = asrBottom
  L22_2.Side = L23_2
  L21_2.Left = 221
  L21_2.Height = 21
  L21_2.Top = 53
  L21_2.Width = 150
  L21_2.Anchors = "[akTop, akRight]"
  L22_2 = L21_2.BorderSpacing
  L22_2.Right = 10
  L21_2.ParentFont = true
  L21_2.ItemHeight = 13
  L21_2.Style = "csDropDownList"
  L21_2.TabOrder = 3
  L22_2 = createComboBox
  L23_2 = L12_2
  L22_2 = L22_2(L23_2)
  L23_2 = L22_2.AnchorSideTop
  L23_2.Control = L16_2
  L23_2 = L22_2.AnchorSideTop
  L24_2 = asrCenter
  L23_2.Side = L24_2
  L23_2 = L22_2.AnchorSideRight
  L23_2.Control = L12_2
  L23_2 = L22_2.AnchorSideRight
  L24_2 = asrBottom
  L23_2.Side = L24_2
  L22_2.Left = 221
  L22_2.Height = 21
  L22_2.Top = 76
  L22_2.Width = 150
  L22_2.Anchors = "[akTop, akRight]"
  L23_2 = L22_2.BorderSpacing
  L23_2.Right = 10
  L22_2.ParentFont = true
  L22_2.ItemHeight = 13
  L22_2.Style = "csDropDownList"
  L22_2.TabOrder = 4
  L23_2 = createEdit
  L24_2 = L12_2
  L23_2 = L23_2(L24_2)
  L24_2 = L23_2.AnchorSideTop
  L24_2.Control = L17_2
  L24_2 = L23_2.AnchorSideTop
  L25_2 = asrCenter
  L24_2.Side = L25_2
  L24_2 = L23_2.AnchorSideRight
  L24_2.Control = L12_2
  L24_2 = L23_2.AnchorSideRight
  L25_2 = asrBottom
  L24_2.Side = L25_2
  L23_2.Left = 221
  L23_2.Height = 21
  L23_2.Top = 99
  L23_2.Width = 150
  L23_2.Anchors = "[akTop, akRight]"
  L24_2 = L23_2.BorderSpacing
  L24_2.Right = 10
  L23_2.ParentFont = true
  L23_2.MaxLength = 3
  L23_2.NumbersOnly = true
  L23_2.TabOrder = 5
  L23_2.TextHint = "0 - 100"
  L23_2.SelStart = 0
  L23_2.SelLength = 0
  L24_2 = clBlack
  L23_2.TextHintFontColor = L24_2
  L24_2 = fsBold
  L23_2.TextHintFontStyle = L24_2
  L24_2 = createButton
  L25_2 = L11_2
  L24_2 = L24_2(L25_2)
  L25_2 = L24_2.AnchorSideRight
  L25_2.Control = L11_2
  L25_2 = L24_2.AnchorSideRight
  L26_2 = asrBottom
  L25_2.Side = L26_2
  L25_2 = L24_2.AnchorSideBottom
  L25_2.Control = L11_2
  L25_2 = L24_2.AnchorSideBottom
  L26_2 = asrBottom
  L25_2.Side = L26_2
  L24_2.Left = 297
  L24_2.Height = 25
  L24_2.Top = 133
  L24_2.Width = 75
  L24_2.Anchors = "[akRight, akBottom]"
  L25_2 = L24_2.BorderSpacing
  L25_2.Around = 5
  L24_2.ParentFont = true
  L24_2.Caption = "Cancel"
  L24_2.TabOrder = 1
  L25_2 = createButton
  L26_2 = L11_2
  L25_2 = L25_2(L26_2)
  L26_2 = L25_2.AnchorSideRight
  L26_2.Control = L24_2
  L26_2 = L25_2.AnchorSideBottom
  L26_2.Control = L11_2
  L26_2 = L25_2.AnchorSideBottom
  L27_2 = asrBottom
  L26_2.Side = L27_2
  L25_2.Left = 217
  L25_2.Height = 25
  L25_2.Top = 133
  L25_2.Width = 75
  L25_2.Anchors = "[akRight, akBottom]"
  L26_2 = L25_2.BorderSpacing
  L26_2.Around = 5
  L25_2.ParentFont = true
  L25_2.Caption = "Apply"
  L25_2.TabOrder = 2
  L26_2 = L12_2.AnchorSideBottom
  L26_2.Control = L24_2
  L26_2 = 0
  L27_2 = 0
  L28_2 = 0
  L29_2 = 0
  L30_2 = 0
  
  function L31_2(A0_3)
    local L1_3
    L1_3 = L21_2.ItemIndex
    if L1_3 == 1 then
      L22_2.Enabled = false
    else
      L22_2.Enabled = true
    end
  end
  
  L21_2.OnChange = L31_2
  
  function L31_2(A0_3)
    local L1_3, L2_3
    L1_3 = L18_2.ItemIndex
    if L1_3 == 0 then
      L1_3 = L21_2.Items
      L2_3 = L8_2
      L1_3.Text = L2_3
      L1_3 = L22_2.Items
      L2_3 = L9_2
      L1_3.Text = L2_3
    else
      L1_3 = L21_2.Items
      L2_3 = L7_2
      L1_3.Text = L2_3
      L1_3 = L22_2.Items
      L2_3 = L10_2
      L1_3.Text = L2_3
    end
    L21_2.ItemIndex = 0
    L22_2.ItemIndex = 0
    L22_2.Enabled = true
  end
  
  L18_2.OnChange = L31_2
  
  function L31_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = 0
    L2_3 = L18_2.ItemIndex
    if L2_3 == 0 then
      L2_3 = createCustomSelectionList
      L3_3 = "Club List"
      L4_3 = ClubTableStart
      L5_3 = ClubTableEnd
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L1_3 = L2_3
    else
      L2_3 = createCustomSelectionList
      L3_3 = "Person List"
      L4_3 = PersonTableStart
      L5_3 = PersonTableEnd
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L1_3 = L2_3
    end
    if L1_3 == nil then
      return
    end
    L2_3 = getObjectName
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L19_2.Text = L2_3
    L27_2 = L1_3
  end
  
  L20_2.OnClick = L31_2
  
  function L31_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = table
    L1_3 = L1_3.contains
    L2_3 = relationRecordTypes
    L3_3 = L18_2.Text
    L1_3 = L1_3(L2_3, L3_3)
    L26_2 = L1_3
    L1_3 = table
    L1_3 = L1_3.contains
    L2_3 = relationshipTypes
    L3_3 = L21_2.Text
    L1_3 = L1_3(L2_3, L3_3)
    L28_2 = L1_3
    L1_3 = L21_2.ItemIndex
    if L1_3 == 0 then
      L1_3 = L18_2.ItemIndex
      if L1_3 == 0 then
        L1_3 = table
        L1_3 = L1_3.contains
        L2_3 = relationInfoClubTypes
        L3_3 = L22_2.Text
        L1_3 = L1_3(L2_3, L3_3)
        L29_2 = L1_3
      else
        L1_3 = table
        L1_3 = L1_3.contains
        L2_3 = relationInfoPeopleTypes
        L3_3 = L22_2.Text
        L1_3 = L1_3(L2_3, L3_3)
        L29_2 = L1_3
      end
    else
      L1_3 = 0
      L29_2 = L1_3
    end
    L1_3 = L23_2.Text
    if L1_3 ~= "" then
      L1_3 = validateValue
      L2_3 = tonumber
      L3_3 = L23_2.Text
      L2_3 = L2_3(L3_3)
      L3_3 = 0
      L4_3 = 100
      L5_3 = 100
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
      L30_2 = L1_3
    end
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 10
    L3_3 = L26_2
    L1_3(L2_3, L3_3)
    L1_3 = writeQword
    L2_3 = L4_2
    L3_3 = L27_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 11
    L3_3 = L28_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 8
    L3_3 = L29_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 12
    L3_3 = L30_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 15
    L3_3 = 255
    L1_3(L2_3, L3_3)
    L1_3 = addPersonRelation
    L2_3 = A1_2
    L3_3 = A2_2
    L1_3(L2_3, L3_3)
    L1_3 = L11_2.Close
    L1_3()
    L1_3 = getAddressList
    L1_3 = L1_3()
    L1_3 = L1_3.getMemoryRecordByID
    L2_3 = 11071
    L1_3 = L1_3(L2_3)
    L2_3 = L1_3.Active
    if L2_3 then
      L2_3 = enablePersonRelationships
      L3_3 = 2
      L2_3(L3_3)
    end
    L2_3 = enableAutoDisable
    L3_3 = A0_2
    L4_3 = nil
    L2_3(L3_3, L4_3)
  end
  
  L25_2.OnClick = L31_2
  
  function L31_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L11_2.Close
    L1_3()
    L1_3 = enableAutoDisable
    L2_3 = A0_2
    L3_3 = nil
    L1_3(L2_3, L3_3)
  end
  
  L24_2.OnClick = L31_2
  L31_2 = L11_2.Show
  L31_2()
end

addPersonRelationDialog = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addPersonRelationDialog"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L3_2 = readQword
  L4_2 = "ptrPerson"
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPerson
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L4_2 = getAddressSafe
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = createFont
  L5_2 = L5_2()
  L5_2.CharSet = "ANSI_CHARSET"
  L5_2.Size = 8
  L5_2.Name = "Segoe UI Semibold"
  L5_2.Pitch = "fpVariable"
  L5_2.Quality = "fqDraft"
  L5_2.Style = "[fsBold]"
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "Trained in Nation\r\n"
  L8_2 = "Trained at Club"
  L7_2 = L7_2 .. L8_2
  L6_2 = L6_2(L7_2)
  L7_2 = string
  L7_2 = L7_2.format
  L8_2 = "3 Years Between 15 and 21\r\n"
  L9_2 = "3 Years Before 21\r\n"
  L10_2 = "3 Years Between 0 and 23\r\n"
  L11_2 = "3 Years Before 17\r\n"
  L12_2 = "3 Years Between 15 and 21 (No Loans)\r\n"
  L13_2 = "4 Years Between 0 and 19"
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L7_2 = L7_2(L8_2)
  L8_2 = createForm
  L9_2 = false
  L8_2 = L8_2(L9_2)
  L8_2.BorderIcons = "[biSystemMenu]"
  L8_2.BorderStyle = "bsDialog"
  L8_2.Caption = "Add Person Eligibility"
  L9_2 = TreeView
  L9_2 = L9_2.Color
  L8_2.Color = L9_2
  L8_2.Height = 119
  L8_2.Position = "poMainFormCenter"
  L8_2.Width = 391
  L8_2.Font = L5_2
  L9_2 = createPanel
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2.AnchorSideLeft
  L10_2.Control = L8_2
  L10_2 = L9_2.AnchorSideTop
  L10_2.Control = L8_2
  L10_2 = L9_2.AnchorSideRight
  L10_2.Control = L8_2
  L10_2 = L9_2.AnchorSideRight
  L11_2 = asrBottom
  L10_2.Side = L11_2
  L10_2 = L9_2.AnchorSideBottom
  L11_2 = CancelButton
  L10_2.Control = L11_2
  L9_2.Left = 0
  L9_2.Height = 84
  L9_2.Top = 0
  L9_2.Width = 391
  L9_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L9_2.ClientHeight = 84
  L9_2.ClientWidth = 391
  L10_2 = clWhite
  L9_2.Color = L10_2
  L9_2.ParentColor = false
  L9_2.TabOrder = 0
  L10_2 = createLabel
  L11_2 = L9_2
  L10_2 = L10_2(L11_2)
  L11_2 = L10_2.AnchorSideLeft
  L11_2.Control = L9_2
  L11_2 = L10_2.AnchorSideTop
  L11_2.Control = L9_2
  L10_2.Left = 11
  L10_2.Height = 13
  L10_2.Top = 11
  L10_2.Width = 90
  L11_2 = L10_2.BorderSpacing
  L11_2.Around = 10
  L10_2.ParentFont = true
  L10_2.Caption = "Home Grown Type"
  L10_2.ParentColor = false
  L11_2 = createLabel
  L12_2 = L9_2
  L11_2 = L11_2(L12_2)
  L12_2 = L11_2.AnchorSideLeft
  L12_2.Control = L9_2
  L12_2 = L11_2.AnchorSideTop
  L12_2.Control = L10_2
  L12_2 = L11_2.AnchorSideTop
  L13_2 = asrBottom
  L12_2.Side = L13_2
  L11_2.Left = 11
  L11_2.Height = 13
  L11_2.Top = 34
  L11_2.Width = 94
  L12_2 = L11_2.BorderSpacing
  L12_2.Around = 10
  L11_2.ParentFont = true
  L11_2.Caption = "Object Type"
  L11_2.ParentColor = false
  L12_2 = createLabel
  L13_2 = L9_2
  L12_2 = L12_2(L13_2)
  L13_2 = L12_2.AnchorSideLeft
  L13_2.Control = L9_2
  L13_2 = L12_2.AnchorSideTop
  L13_2.Control = L11_2
  L13_2 = L12_2.AnchorSideTop
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L12_2.Left = 11
  L12_2.Height = 13
  L12_2.Top = 57
  L12_2.Width = 33
  L13_2 = L12_2.BorderSpacing
  L13_2.Around = 10
  L12_2.ParentFont = true
  L12_2.Caption = "Object"
  L12_2.ParentColor = false
  L13_2 = createComboBox
  L14_2 = L9_2
  L13_2 = L13_2(L14_2)
  L14_2 = L13_2.AnchorSideTop
  L14_2.Control = L10_2
  L14_2 = L13_2.AnchorSideTop
  L15_2 = asrCenter
  L14_2.Side = L15_2
  L14_2 = L13_2.AnchorSideRight
  L14_2.Control = L9_2
  L14_2 = L13_2.AnchorSideRight
  L15_2 = asrBottom
  L14_2.Side = L15_2
  L13_2.Left = 200
  L13_2.Height = 21
  L13_2.Top = 7
  L13_2.Width = 180
  L13_2.Anchors = "[akTop, akRight]"
  L14_2 = L13_2.BorderSpacing
  L14_2.Around = 10
  L13_2.ParentFont = true
  L13_2.ItemHeight = 13
  L14_2 = L13_2.Items
  L14_2.Text = L7_2
  L13_2.ItemIndex = 0
  L13_2.Style = "csDropDownList"
  L13_2.TabOrder = 0
  L14_2 = createComboBox
  L15_2 = L9_2
  L14_2 = L14_2(L15_2)
  L15_2 = L14_2.AnchorSideTop
  L15_2.Control = L11_2
  L15_2 = L14_2.AnchorSideTop
  L16_2 = asrCenter
  L15_2.Side = L16_2
  L15_2 = L14_2.AnchorSideRight
  L15_2.Control = L9_2
  L15_2 = L14_2.AnchorSideRight
  L16_2 = asrBottom
  L15_2.Side = L16_2
  L14_2.Left = 200
  L14_2.Height = 21
  L14_2.Top = 30
  L14_2.Width = 180
  L14_2.Anchors = "[akTop, akRight]"
  L15_2 = L14_2.BorderSpacing
  L15_2.Around = 10
  L14_2.ParentFont = true
  L14_2.ItemHeight = 13
  L15_2 = L14_2.Items
  L15_2.Text = L6_2
  L14_2.ItemIndex = 1
  L14_2.Style = "csDropDownList"
  L14_2.TabOrder = 1
  L15_2 = createEdit
  L16_2 = L9_2
  L15_2 = L15_2(L16_2)
  L16_2 = L15_2.AnchorSideTop
  L16_2.Control = L12_2
  L16_2 = L15_2.AnchorSideTop
  L17_2 = asrCenter
  L16_2.Side = L17_2
  L16_2 = L15_2.AnchorSideRight
  L16_2.Control = L9_2
  L16_2 = L15_2.AnchorSideRight
  L17_2 = asrBottom
  L16_2.Side = L17_2
  L15_2.Left = 200
  L15_2.Height = 21
  L15_2.Top = 53
  L15_2.Width = 180
  L15_2.Anchors = "[akTop, akRight]"
  L16_2 = L15_2.BorderSpacing
  L16_2.Right = 10
  L15_2.Enabled = false
  L15_2.ParentFont = true
  L15_2.TabOrder = 2
  L15_2.SelStart = 0
  L15_2.SelLength = 0
  L16_2 = clBlack
  L15_2.TextHintFontColor = L16_2
  L16_2 = fsBold
  L15_2.TextHintFontStyle = L16_2
  L16_2 = createButton
  L17_2 = L9_2
  L16_2 = L16_2(L17_2)
  L17_2 = L16_2.AnchorSideTop
  L17_2.Control = L12_2
  L17_2 = L16_2.AnchorSideTop
  L18_2 = asrCenter
  L17_2.Side = L18_2
  L17_2 = L16_2.AnchorSideRight
  L17_2.Control = L15_2
  L16_2.Left = 130
  L16_2.Height = 21
  L16_2.Top = 53
  L16_2.Width = 65
  L16_2.Anchors = "[akTop, akRight]"
  L17_2 = L16_2.BorderSpacing
  L17_2.Around = 5
  L16_2.ParentFont = true
  L16_2.Caption = "Search"
  L16_2.TabOrder = 3
  L17_2 = createButton
  L18_2 = L8_2
  L17_2 = L17_2(L18_2)
  L18_2 = L17_2.AnchorSideRight
  L18_2.Control = L8_2
  L18_2 = L17_2.AnchorSideRight
  L19_2 = asrBottom
  L18_2.Side = L19_2
  L18_2 = L17_2.AnchorSideBottom
  L18_2.Control = L8_2
  L18_2 = L17_2.AnchorSideBottom
  L19_2 = asrBottom
  L18_2.Side = L19_2
  L17_2.Left = 311
  L17_2.Height = 25
  L17_2.Top = 89
  L17_2.Width = 75
  L17_2.Anchors = "[akRight, akBottom]"
  L18_2 = L17_2.BorderSpacing
  L18_2.Around = 5
  L17_2.ParentFont = true
  L17_2.Caption = "Cancel"
  L17_2.TabOrder = 1
  L18_2 = createButton
  L19_2 = L8_2
  L18_2 = L18_2(L19_2)
  L19_2 = L18_2.AnchorSideRight
  L19_2.Control = L17_2
  L19_2 = L18_2.AnchorSideBottom
  L19_2.Control = L8_2
  L19_2 = L18_2.AnchorSideBottom
  L20_2 = asrBottom
  L19_2.Side = L20_2
  L18_2.Left = 231
  L18_2.Height = 25
  L18_2.Top = 89
  L18_2.Width = 75
  L18_2.Anchors = "[akRight, akBottom]"
  L19_2 = L18_2.BorderSpacing
  L19_2.Around = 5
  L18_2.ParentFont = true
  L18_2.Caption = "Apply"
  L18_2.TabOrder = 2
  L19_2 = L9_2.AnchorSideBottom
  L19_2.Control = L17_2
  L19_2 = 0
  L20_2 = 0
  L21_2 = 0
  L22_2 = 0
  L23_2 = 0
  
  function L24_2(A0_3)
    local L1_3
    L15_2.Text = ""
    L1_3 = 0
    L20_2 = L1_3
  end
  
  L14_2.OnChange = L24_2
  
  function L24_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = 0
    L2_3 = L14_2.ItemIndex
    if L2_3 == 0 then
      L2_3 = createCustomSelectionList
      L3_3 = "Nation List"
      L4_3 = NationTableStart
      L5_3 = NationTableEnd
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L1_3 = L2_3
      L2_3 = 2
      L19_2 = L2_3
    else
      L2_3 = createCustomSelectionList
      L3_3 = "Club List"
      L4_3 = ClubTableStart
      L5_3 = ClubTableEnd
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L1_3 = L2_3
      L2_3 = 1
      L19_2 = L2_3
    end
    if L1_3 == nil then
      return
    end
    L2_3 = getObjectName
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L15_2.Text = L2_3
    L20_2 = L1_3
  end
  
  L16_2.OnClick = L24_2
  
  function L24_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = table
    L1_3 = L1_3.contains
    L2_3 = homeGrownTypes
    L3_3 = L13_2.Text
    L1_3 = L1_3(L2_3, L3_3)
    L22_2 = L1_3
    L1_3 = table
    L1_3 = L1_3.contains
    L2_3 = relationshipTypes
    L3_3 = L14_2.Text
    L1_3 = L1_3(L2_3, L3_3)
    L21_2 = L1_3
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 10
    L3_3 = L19_2
    L1_3(L2_3, L3_3)
    L1_3 = writeQword
    L2_3 = L4_2
    L3_3 = L20_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 11
    L3_3 = L21_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 12
    L3_3 = L22_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 13
    L3_3 = 255
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 15
    L3_3 = 255
    L1_3(L2_3, L3_3)
    L1_3 = addPersonRelation
    L2_3 = A1_2
    L3_3 = A2_2
    L1_3(L2_3, L3_3)
    L1_3 = L8_2.Close
    L1_3()
    L1_3 = getAddressList
    L1_3 = L1_3()
    L1_3 = L1_3.getMemoryRecordByID
    L2_3 = 20100
    L1_3 = L1_3(L2_3)
    L2_3 = L1_3.Active
    if L2_3 then
      L2_3 = enablePlayerEligibility
      L3_3 = 2
      L2_3(L3_3)
    end
    L2_3 = enableAutoDisable
    L3_3 = A0_2
    L4_3 = nil
    L2_3(L3_3, L4_3)
  end
  
  L18_2.OnClick = L24_2
  
  function L24_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L8_2.Close
    L1_3()
    L1_3 = enableAutoDisable
    L2_3 = A0_2
    L3_3 = nil
    L1_3(L2_3, L3_3)
  end
  
  L17_2.OnClick = L24_2
  L24_2 = L8_2.Show
  L24_2()
end

addPersonEligibilityDialog = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addPersonEligibilityDialog"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2
  L3_2 = readQword
  L4_2 = "ptrClub"
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isClub
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L4_2 = getAddressSafe
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = createFont
  L5_2 = L5_2()
  L5_2.CharSet = "ANSI_CHARSET"
  L5_2.Size = 8
  L5_2.Name = "Segoe UI Semibold"
  L5_2.Pitch = "fpVariable"
  L5_2.Quality = "fqDraft"
  L5_2.Style = "[fsBold]"
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "Kit Sponsor\r\n"
  L8_2 = "Government/Council Grant\r\n"
  L9_2 = "Stadium Sponsor\r\n"
  L10_2 = "General Sponsor\r\n"
  L11_2 = "Individual TV Deal\r\n"
  L12_2 = "Other Income\r\n"
  L13_2 = "Club Membership\r\n"
  L14_2 = "Kit Sponsor (Secondary)\r\n"
  L15_2 = "Kit Sponsor (Other)\r\n"
  L16_2 = "Parachute Payment\r\n"
  L17_2 = "Back of Shirt\r\n"
  L18_2 = "Shirt Sleeve\r\n"
  L19_2 = "Shorts\r\n"
  L20_2 = "Training Kit\r\n"
  L21_2 = "Youth Team\r\n"
  L22_2 = "Training Ground\r\n"
  L23_2 = "Continental Competition\r\n"
  L24_2 = "Equity Injection\r\n"
  L25_2 = "Total Commercial Income"
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2 .. L23_2 .. L24_2 .. L25_2
  L6_2 = L6_2(L7_2)
  L7_2 = createForm
  L8_2 = false
  L7_2 = L7_2(L8_2)
  L7_2.BorderIcons = "[biSystemMenu]"
  L7_2.BorderStyle = "bsDialog"
  L7_2.Caption = "Add Club Other Income"
  L8_2 = TreeView
  L8_2 = L8_2.Color
  L7_2.Color = L8_2
  L7_2.Height = 165
  L7_2.Position = "poMainFormCenter"
  L7_2.Width = 400
  L7_2.Font = L5_2
  L8_2 = createPanel
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  L9_2 = L8_2.AnchorSideLeft
  L9_2.Control = L7_2
  L9_2 = L8_2.AnchorSideTop
  L9_2.Control = L7_2
  L9_2 = L8_2.AnchorSideRight
  L9_2.Control = L7_2
  L9_2 = L8_2.AnchorSideRight
  L10_2 = asrBottom
  L9_2.Side = L10_2
  L8_2.Left = 0
  L8_2.Height = 160
  L8_2.Top = 0
  L8_2.Width = 400
  L8_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L8_2.ClientHeight = 160
  L8_2.ClientWidth = 400
  L9_2 = clWhite
  L8_2.Color = L9_2
  L8_2.ParentColor = false
  L8_2.TabOrder = 0
  L9_2 = createLabel
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  L10_2 = L9_2.AnchorSideLeft
  L10_2.Control = L8_2
  L10_2 = L9_2.AnchorSideTop
  L10_2.Control = L8_2
  L9_2.Left = 11
  L9_2.Height = 13
  L9_2.Top = 11
  L9_2.Width = 64
  L10_2 = L9_2.BorderSpacing
  L10_2.Around = 10
  L9_2.ParentFont = true
  L9_2.Caption = "Income Type"
  L9_2.ParentColor = false
  L10_2 = createLabel
  L11_2 = L8_2
  L10_2 = L10_2(L11_2)
  L11_2 = L10_2.AnchorSideLeft
  L11_2.Control = L8_2
  L11_2 = L10_2.AnchorSideTop
  L11_2.Control = L9_2
  L11_2 = L10_2.AnchorSideTop
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L10_2.Left = 11
  L10_2.Height = 13
  L10_2.Top = 34
  L10_2.Width = 65
  L11_2 = L10_2.BorderSpacing
  L11_2.Around = 10
  L10_2.ParentFont = true
  L10_2.Caption = "Total Income"
  L10_2.ParentColor = false
  L11_2 = createLabel
  L12_2 = L8_2
  L11_2 = L11_2(L12_2)
  L12_2 = L11_2.AnchorSideLeft
  L12_2.Control = L8_2
  L12_2 = L11_2.AnchorSideTop
  L12_2.Control = L10_2
  L12_2 = L11_2.AnchorSideTop
  L13_2 = asrBottom
  L12_2.Side = L13_2
  L11_2.Left = 11
  L11_2.Height = 13
  L11_2.Top = 80
  L11_2.Width = 51
  L12_2 = L11_2.BorderSpacing
  L12_2.Around = 10
  L11_2.ParentFont = true
  L11_2.Caption = "Start Date"
  L11_2.ParentColor = false
  L12_2 = createLabel
  L13_2 = L8_2
  L12_2 = L12_2(L13_2)
  L13_2 = L12_2.AnchorSideLeft
  L13_2.Control = L8_2
  L13_2 = L12_2.AnchorSideTop
  L13_2.Control = L11_2
  L13_2 = L12_2.AnchorSideTop
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L12_2.Left = 11
  L12_2.Height = 13
  L12_2.Top = 103
  L12_2.Width = 46
  L13_2 = L12_2.BorderSpacing
  L13_2.Around = 10
  L12_2.ParentFont = true
  L12_2.Caption = "End Date"
  L12_2.ParentColor = false
  L13_2 = createComboBox
  L14_2 = L8_2
  L13_2 = L13_2(L14_2)
  L14_2 = L13_2.AnchorSideTop
  L14_2.Control = L9_2
  L14_2 = L13_2.AnchorSideTop
  L15_2 = asrCenter
  L14_2.Side = L15_2
  L14_2 = L13_2.AnchorSideRight
  L14_2.Control = L8_2
  L14_2 = L13_2.AnchorSideRight
  L15_2 = asrBottom
  L14_2.Side = L15_2
  L13_2.Left = 209
  L13_2.Height = 21
  L13_2.Top = 7
  L13_2.Width = 180
  L13_2.Anchors = "[akTop, akRight]"
  L14_2 = L13_2.BorderSpacing
  L14_2.Around = 10
  L13_2.ParentFont = true
  L13_2.ItemHeight = 13
  L13_2.ItemIndex = 3
  L14_2 = L13_2.Items
  L14_2.Text = L6_2
  L13_2.Style = "csDropDownList"
  L13_2.TabOrder = 0
  L13_2.Text = "General Sponsor"
  L14_2 = createEdit
  L15_2 = L8_2
  L14_2 = L14_2(L15_2)
  L15_2 = L14_2.AnchorSideTop
  L15_2.Control = L10_2
  L15_2 = L14_2.AnchorSideTop
  L16_2 = asrCenter
  L15_2.Side = L16_2
  L15_2 = L14_2.AnchorSideRight
  L15_2.Control = L8_2
  L15_2 = L14_2.AnchorSideRight
  L16_2 = asrBottom
  L15_2.Side = L16_2
  L14_2.Left = 209
  L14_2.Height = 21
  L14_2.Top = 30
  L14_2.Width = 180
  L14_2.Anchors = "[akTop, akRight]"
  L15_2 = L14_2.BorderSpacing
  L15_2.Around = 10
  L14_2.ParentFont = true
  L14_2.MaxLength = 10
  L14_2.NumbersOnly = true
  L14_2.TabOrder = 1
  L14_2.TextHint = "\194\1631 - \194\1631B"
  L14_2.SelStart = 0
  L14_2.SelLength = 0
  L15_2 = clBlack
  L14_2.TextHintFontColor = L15_2
  L15_2 = fsBold
  L14_2.TextHintFontStyle = L15_2
  L15_2 = createButton
  L16_2 = L8_2
  L15_2 = L15_2(L16_2)
  L16_2 = L15_2.AnchorSideTop
  L16_2.Control = L11_2
  L16_2 = L15_2.AnchorSideTop
  L17_2 = asrCenter
  L16_2.Side = L17_2
  L16_2 = L15_2.AnchorSideRight
  L16_2.Control = L8_2
  L16_2 = L15_2.AnchorSideRight
  L17_2 = asrBottom
  L16_2.Side = L17_2
  L15_2.Left = 324
  L15_2.Height = 21
  L15_2.Top = 76
  L15_2.Width = 65
  L15_2.Anchors = "[akTop, akRight]"
  L16_2 = L15_2.BorderSpacing
  L16_2.Right = 10
  L15_2.ParentFont = true
  L15_2.Caption = "Change"
  L15_2.TabOrder = 3
  L16_2 = createEdit
  L17_2 = L8_2
  L16_2 = L16_2(L17_2)
  L17_2 = L16_2.AnchorSideTop
  L17_2.Control = L11_2
  L17_2 = L16_2.AnchorSideTop
  L18_2 = asrCenter
  L17_2.Side = L18_2
  L17_2 = L16_2.AnchorSideRight
  L17_2.Control = L15_2
  L16_2.Left = 209
  L16_2.Height = 21
  L16_2.Top = 76
  L16_2.Width = 110
  L16_2.Anchors = "[akTop, akRight]"
  L17_2 = L16_2.BorderSpacing
  L17_2.Around = 5
  L16_2.Enabled = false
  L16_2.ParentFont = true
  L16_2.TabOrder = 4
  L16_2.SelStart = 0
  L16_2.SelLength = 0
  L17_2 = clBlack
  L16_2.TextHintFontColor = L17_2
  L17_2 = fsBold
  L16_2.TextHintFontStyle = L17_2
  L17_2 = createButton
  L18_2 = L8_2
  L17_2 = L17_2(L18_2)
  L18_2 = L17_2.AnchorSideTop
  L18_2.Control = L12_2
  L18_2 = L17_2.AnchorSideTop
  L19_2 = asrCenter
  L18_2.Side = L19_2
  L18_2 = L17_2.AnchorSideRight
  L18_2.Control = L8_2
  L18_2 = L17_2.AnchorSideRight
  L19_2 = asrBottom
  L18_2.Side = L19_2
  L17_2.Left = 324
  L17_2.Height = 21
  L17_2.Top = 99
  L17_2.Width = 65
  L17_2.Anchors = "[akTop, akRight]"
  L18_2 = L17_2.BorderSpacing
  L18_2.Right = 10
  L17_2.ParentFont = true
  L17_2.Caption = "Change"
  L17_2.TabOrder = 5
  L18_2 = createEdit
  L19_2 = L8_2
  L18_2 = L18_2(L19_2)
  L19_2 = L18_2.AnchorSideTop
  L19_2.Control = L12_2
  L19_2 = L18_2.AnchorSideTop
  L20_2 = asrCenter
  L19_2.Side = L20_2
  L19_2 = L18_2.AnchorSideRight
  L19_2.Control = L17_2
  L18_2.Left = 209
  L18_2.Height = 21
  L18_2.Top = 99
  L18_2.Width = 110
  L18_2.Anchors = "[akTop, akRight]"
  L19_2 = L18_2.BorderSpacing
  L19_2.Around = 5
  L18_2.Enabled = false
  L18_2.ParentFont = true
  L18_2.TabOrder = 6
  L18_2.SelStart = 0
  L18_2.SelLength = 0
  L19_2 = clBlack
  L18_2.TextHintFontColor = L19_2
  L19_2 = fsBold
  L18_2.TextHintFontStyle = L19_2
  L19_2 = createCheckBox
  L20_2 = L8_2
  L19_2 = L19_2(L20_2)
  L20_2 = L19_2.AnchorSideTop
  L20_2.Control = L17_2
  L20_2 = L19_2.AnchorSideTop
  L21_2 = asrBottom
  L20_2.Side = L21_2
  L20_2 = L19_2.AnchorSideRight
  L20_2.Control = L8_2
  L20_2 = L19_2.AnchorSideRight
  L21_2 = asrBottom
  L20_2.Side = L21_2
  L19_2.Left = 310
  L19_2.Height = 19
  L19_2.Top = 130
  L19_2.Width = 79
  L19_2.Anchors = "[akTop, akRight]"
  L20_2 = L19_2.BorderSpacing
  L20_2.Around = 10
  L19_2.ParentFont = true
  L19_2.Caption = "Fixed Value"
  L19_2.ParentBidiMode = false
  L19_2.TabOrder = 7
  L20_2 = createCheckBox
  L21_2 = L8_2
  L20_2 = L20_2(L21_2)
  L21_2 = L20_2.AnchorSideTop
  L21_2.Control = L19_2
  L21_2 = L20_2.AnchorSideTop
  L22_2 = asrCenter
  L21_2.Side = L22_2
  L21_2 = L20_2.AnchorSideRight
  L21_2.Control = L19_2
  L20_2.Left = 207
  L20_2.Height = 19
  L20_2.Top = 130
  L20_2.Width = 93
  L20_2.Anchors = "[akTop, akRight]"
  L21_2 = L20_2.BorderSpacing
  L21_2.Around = 10
  L20_2.ParentFont = true
  L20_2.Caption = "Renew Income"
  L20_2.ParentBidiMode = false
  L20_2.TabOrder = 8
  L21_2 = createButton
  L22_2 = L7_2
  L21_2 = L21_2(L22_2)
  L22_2 = L21_2.AnchorSideRight
  L22_2.Control = L7_2
  L22_2 = L21_2.AnchorSideRight
  L23_2 = asrBottom
  L22_2.Side = L23_2
  L22_2 = L21_2.AnchorSideBottom
  L22_2.Control = L7_2
  L22_2 = L21_2.AnchorSideBottom
  L23_2 = asrBottom
  L22_2.Side = L23_2
  L21_2.Left = 311
  L21_2.Height = 25
  L21_2.Top = 89
  L21_2.Width = 75
  L21_2.Anchors = "[akRight, akBottom]"
  L22_2 = L21_2.BorderSpacing
  L22_2.Around = 5
  L21_2.ParentFont = true
  L21_2.Caption = "Cancel"
  L21_2.TabOrder = 1
  L22_2 = createButton
  L23_2 = L7_2
  L22_2 = L22_2(L23_2)
  L23_2 = L22_2.AnchorSideRight
  L23_2.Control = L21_2
  L23_2 = L22_2.AnchorSideBottom
  L23_2.Control = L7_2
  L23_2 = L22_2.AnchorSideBottom
  L24_2 = asrBottom
  L23_2.Side = L24_2
  L22_2.Left = 231
  L22_2.Height = 25
  L22_2.Top = 89
  L22_2.Width = 75
  L22_2.Anchors = "[akRight, akBottom]"
  L23_2 = L22_2.BorderSpacing
  L23_2.Around = 5
  L22_2.ParentFont = true
  L22_2.Caption = "Apply"
  L22_2.TabOrder = 2
  L23_2 = L8_2.AnchorSideBottom
  L23_2.Control = L21_2
  L23_2 = 4
  L24_2 = 5000000
  L25_2 = 1000000
  L26_2 = readInteger
  L27_2 = getAddressSafe
  L28_2 = "datTimeRoot"
  L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2 = L27_2(L28_2)
  L26_2 = L26_2(L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2)
  L27_2 = L26_2 + 327680
  L28_2 = 0
  L29_2 = 0
  L30_2 = 5
  L31_2 = 0
  L32_2 = 0
  
  function L33_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L1_3 = changeDateNoAddr
    L1_3, L2_3, L3_3 = L1_3()
    L4_3 = formatDate
    L5_3 = L1_3
    L6_3 = L2_3
    L7_3 = L3_3
    L8_3 = 1
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
    L16_2.Text = L4_3
    L31_2 = L3_3
    L4_3 = writeSmallInteger
    L5_3 = L4_2
    L6_3 = cluo
    L6_3 = L6_3.Csst
    L5_3 = L5_3 + L6_3
    L6_3 = setDate
    L7_3 = L1_3
    L8_3 = L2_3
    L9_3 = L3_3
    L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3, L8_3, L9_3)
    L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)
    L4_3 = writeSmallInteger
    L5_3 = L4_2
    L6_3 = cluo
    L6_3 = L6_3.Csst
    L5_3 = L5_3 + L6_3
    L5_3 = L5_3 + 2
    L6_3 = L3_3
    L4_3(L5_3, L6_3)
    L4_3 = readInteger
    L5_3 = L4_2
    L6_3 = cluo
    L6_3 = L6_3.Csst
    L5_3 = L5_3 + L6_3
    L4_3 = L4_3(L5_3)
    L26_2 = L4_3
  end
  
  L15_2.OnClick = L33_2
  
  function L33_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L1_3 = changeDateNoAddr
    L1_3, L2_3, L3_3 = L1_3()
    L4_3 = formatDate
    L5_3 = L1_3
    L6_3 = L2_3
    L7_3 = L3_3
    L8_3 = 1
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
    L18_2.Text = L4_3
    L32_2 = L3_3
    L4_3 = writeSmallInteger
    L5_3 = L4_2
    L6_3 = cluo
    L6_3 = L6_3.Csen
    L5_3 = L5_3 + L6_3
    L6_3 = setDate
    L7_3 = L1_3
    L8_3 = L2_3
    L9_3 = L3_3
    L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3, L8_3, L9_3)
    L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)
    L4_3 = writeSmallInteger
    L5_3 = L4_2
    L6_3 = cluo
    L6_3 = L6_3.Csen
    L5_3 = L5_3 + L6_3
    L5_3 = L5_3 + 2
    L6_3 = L3_3
    L4_3(L5_3, L6_3)
    L4_3 = readInteger
    L5_3 = L4_2
    L6_3 = cluo
    L6_3 = L6_3.Csen
    L5_3 = L5_3 + L6_3
    L4_3 = L4_3(L5_3)
    L27_2 = L4_3
  end
  
  L17_2.OnClick = L33_2
  
  function L33_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L14_2.Text
    L1_3 = #L1_3
    if L1_3 == 0 then
      L1_3 = 5000000
      L24_2 = L1_3
    else
      L1_3 = validateValue
      L2_3 = L14_2.Text
      L3_3 = 1
      L4_3 = 1000000000
      L5_3 = 1000000000
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
      L24_2 = L1_3
    end
    L1_3 = L31_2
    if L1_3 ~= 0 then
      L1_3 = L32_2
      if L1_3 ~= 0 then
        L1_3 = L32_2
        L2_3 = L31_2
        L1_3 = L1_3 - L2_3
        L30_2 = L1_3
      end
    end
    L1_3 = L30_2
    if L1_3 ~= 0 then
      L1_3 = tonumber
      L2_3 = string
      L2_3 = L2_3.format
      L3_3 = "%.f"
      L4_3 = L24_2
      L5_3 = L30_2
      L4_3 = L4_3 / L5_3
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3, L4_3)
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
      L25_2 = L1_3
    end
    L1_3 = L20_2.Checked
    if L1_3 then
      L1_3 = 1
      L29_2 = L1_3
    end
    L1_3 = L19_2.Checked
    if L1_3 then
      L1_3 = 1
      L28_2 = L1_3
    end
    L1_3 = table
    L1_3 = L1_3.contains
    L2_3 = clubSponsorshipTypes
    L3_3 = L13_2.Text
    L1_3 = L1_3(L2_3, L3_3)
    L23_2 = L1_3
    L1_3 = writeByte
    L2_3 = L4_2
    L3_3 = cluo
    L3_3 = L3_3.Csty
    L2_3 = L2_3 + L3_3
    L3_3 = L23_2
    L1_3(L2_3, L3_3)
    L1_3 = writeInteger
    L2_3 = L4_2
    L3_3 = cluo
    L3_3 = L3_3.Csti
    L2_3 = L2_3 + L3_3
    L3_3 = L24_2
    L1_3(L2_3, L3_3)
    L1_3 = writeInteger
    L2_3 = L4_2
    L3_3 = cluo
    L3_3 = L3_3.Csts
    L2_3 = L2_3 + L3_3
    L3_3 = L25_2
    L1_3(L2_3, L3_3)
    L1_3 = writeInteger
    L2_3 = L4_2
    L3_3 = cluo
    L3_3 = L3_3.Csst
    L2_3 = L2_3 + L3_3
    L3_3 = L26_2
    L1_3(L2_3, L3_3)
    L1_3 = writeInteger
    L2_3 = L4_2
    L3_3 = cluo
    L3_3 = L3_3.Csen
    L2_3 = L2_3 + L3_3
    L3_3 = L27_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L3_3 = cluo
    L3_3 = L3_3.Rnin
    L2_3 = L2_3 + L3_3
    L3_3 = L29_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L3_3 = cluo
    L3_3 = L3_3.Fxin
    L2_3 = L2_3 + L3_3
    L3_3 = L28_2
    L1_3(L2_3, L3_3)
    L1_3 = addClubSponsorship
    L2_3 = A1_2
    L3_3 = A2_2
    L1_3(L2_3, L3_3)
    L1_3 = L7_2.Close
    L1_3()
    L1_3 = getAddressList
    L1_3 = L1_3()
    L1_3 = L1_3.getMemoryRecordByID
    L2_3 = 12910
    L1_3 = L1_3(L2_3)
    L2_3 = L1_3.Active
    if L2_3 then
      L2_3 = enableClubSponsorshipRecords
      L3_3 = 2
      L2_3(L3_3)
    end
    L2_3 = enableAutoDisable
    L3_3 = A0_2
    L4_3 = nil
    L2_3(L3_3, L4_3)
  end
  
  L22_2.OnClick = L33_2
  
  function L33_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L7_2.Close
    L1_3()
    L1_3 = enableAutoDisable
    L2_3 = A0_2
    L3_3 = nil
    L1_3(L2_3, L3_3)
  end
  
  L21_2.OnClick = L33_2
  L33_2 = L7_2.Show
  L33_2()
end

addClubSponsorshipDialog = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addClubSponsorshipDialog"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L3_2 = readQword
  L4_2 = "ptrPerson"
  L3_2 = L3_2(L4_2)
  if L3_2 ~= nil and L3_2 ~= 0 then
    L4_2 = isPerson
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_14
    end
  end
  do return end
  ::lbl_14::
  L4_2 = getAddressSafe
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = createFont
  L5_2 = L5_2()
  L5_2.CharSet = "ANSI_CHARSET"
  L5_2.Size = 8
  L5_2.Name = "Segoe UI Semibold"
  L5_2.Pitch = "fpVariable"
  L5_2.Quality = "fqDraft"
  L5_2.Style = "[fsBold]"
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "Wants to be a\r\n"
  L8_2 = "Doesn't wants to be a\r\n"
  L9_2 = "Has Knowledge Of\r\n"
  L10_2 = "Doesn't Have Knowledge Of\r\n"
  L11_2 = "Prefers to scout in\r\n"
  L12_2 = "Doesn't want to scout in"
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
  L6_2 = L6_2(L7_2)
  L7_2 = string
  L7_2 = L7_2.format
  L8_2 = "Not Set\r\n"
  L9_2 = "Manager\r\n"
  L10_2 = "Player\r\n"
  L11_2 = "Coach\r\n"
  L12_2 = "Assistant Manager\r\n"
  L13_2 = "First Team Coach\r\n"
  L14_2 = "Fitness Coach\r\n"
  L15_2 = "Physio\r\n"
  L16_2 = "Youth Team Coach\r\n"
  L17_2 = "Scout\r\n"
  L18_2 = "Goalkeeping Coach"
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
  L7_2 = L7_2(L8_2)
  L8_2 = string
  L8_2 = L8_2.format
  L9_2 = "Club\r\n"
  L10_2 = "Competition\r\n"
  L11_2 = "Continent\r\n"
  L12_2 = "Nation"
  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2
  L8_2 = L8_2(L9_2)
  L9_2 = string
  L9_2 = L9_2.format
  L10_2 = "Club\r\n"
  L11_2 = "International"
  L10_2 = L10_2 .. L11_2
  L9_2 = L9_2(L10_2)
  L10_2 = createForm
  L11_2 = false
  L10_2 = L10_2(L11_2)
  L10_2.BorderIcons = "[biSystemMenu]"
  L10_2.BorderStyle = "bsDialog"
  L10_2.Caption = "Add Person Career Plans"
  L11_2 = TreeView
  L11_2 = L11_2.Color
  L10_2.Color = L11_2
  L10_2.Height = 165
  L10_2.Position = "poMainFormCenter"
  L10_2.Width = 350
  L10_2.Font = L5_2
  L11_2 = createPanel
  L12_2 = L10_2
  L11_2 = L11_2(L12_2)
  L12_2 = L11_2.AnchorSideLeft
  L12_2.Control = L10_2
  L12_2 = L11_2.AnchorSideTop
  L12_2.Control = L10_2
  L12_2 = L11_2.AnchorSideRight
  L12_2.Control = L10_2
  L12_2 = L11_2.AnchorSideRight
  L13_2 = asrBottom
  L12_2.Side = L13_2
  L12_2 = L11_2.AnchorSideBottom
  L13_2 = CEButton2
  L12_2.Control = L13_2
  L11_2.Left = 0
  L11_2.Height = 130
  L11_2.Top = 0
  L11_2.Width = 350
  L11_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L11_2.ClientHeight = 130
  L11_2.ClientWidth = 350
  L12_2 = clWhite
  L11_2.Color = L12_2
  L11_2.ParentColor = false
  L11_2.TabOrder = 0
  L12_2 = createLabel
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  L13_2 = L12_2.AnchorSideLeft
  L13_2.Control = L11_2
  L13_2 = L12_2.AnchorSideTop
  L13_2.Control = L11_2
  L12_2.Left = 11
  L12_2.Height = 13
  L12_2.Top = 11
  L12_2.Width = 50
  L13_2 = L12_2.BorderSpacing
  L13_2.Around = 10
  L12_2.Caption = "Condition"
  L12_2.ParentColor = false
  L13_2 = createLabel
  L14_2 = L11_2
  L13_2 = L13_2(L14_2)
  L14_2 = L13_2.AnchorSideLeft
  L14_2.Control = L11_2
  L14_2 = L13_2.AnchorSideTop
  L14_2.Control = L12_2
  L14_2 = L13_2.AnchorSideTop
  L15_2 = asrBottom
  L14_2.Side = L15_2
  L13_2.Left = 11
  L13_2.Height = 13
  L13_2.Top = 34
  L13_2.Width = 18
  L14_2 = L13_2.BorderSpacing
  L14_2.Around = 10
  L13_2.Caption = "Job"
  L13_2.ParentColor = false
  L14_2 = createLabel
  L15_2 = L11_2
  L14_2 = L14_2(L15_2)
  L15_2 = L14_2.AnchorSideLeft
  L15_2.Control = L11_2
  L15_2 = L14_2.AnchorSideTop
  L15_2.Control = L13_2
  L15_2 = L14_2.AnchorSideTop
  L16_2 = asrBottom
  L15_2.Side = L16_2
  L14_2.Left = 11
  L14_2.Height = 13
  L14_2.Top = 57
  L14_2.Width = 60
  L15_2 = L14_2.BorderSpacing
  L15_2.Around = 10
  L14_2.Caption = "Object Type"
  L14_2.ParentColor = false
  L15_2 = createLabel
  L16_2 = L11_2
  L15_2 = L15_2(L16_2)
  L16_2 = L15_2.AnchorSideLeft
  L16_2.Control = L11_2
  L16_2 = L15_2.AnchorSideTop
  L16_2.Control = L14_2
  L16_2 = L15_2.AnchorSideTop
  L17_2 = asrBottom
  L16_2.Side = L17_2
  L15_2.Left = 11
  L15_2.Height = 13
  L15_2.Top = 80
  L15_2.Width = 66
  L16_2 = L15_2.BorderSpacing
  L16_2.Around = 10
  L15_2.Caption = "Object Name"
  L15_2.ParentColor = false
  L16_2 = createLabel
  L17_2 = L11_2
  L16_2 = L16_2(L17_2)
  L17_2 = L16_2.AnchorSideLeft
  L17_2.Control = L11_2
  L17_2 = L16_2.AnchorSideTop
  L17_2.Control = L15_2
  L17_2 = L16_2.AnchorSideTop
  L18_2 = asrBottom
  L17_2.Side = L18_2
  L16_2.Left = 11
  L16_2.Height = 13
  L16_2.Top = 103
  L16_2.Width = 31
  L17_2 = L16_2.BorderSpacing
  L17_2.Around = 10
  L16_2.Caption = "Scope"
  L16_2.ParentColor = false
  L17_2 = createComboBox
  L18_2 = L11_2
  L17_2 = L17_2(L18_2)
  L18_2 = L17_2.AnchorSideTop
  L18_2.Control = L12_2
  L18_2 = L17_2.AnchorSideTop
  L19_2 = asrCenter
  L18_2.Side = L19_2
  L18_2 = L17_2.AnchorSideRight
  L18_2.Control = L11_2
  L18_2 = L17_2.AnchorSideRight
  L19_2 = asrBottom
  L18_2.Side = L19_2
  L17_2.Left = 189
  L17_2.Height = 21
  L17_2.Top = 7
  L17_2.Width = 150
  L17_2.Anchors = "[akTop, akRight]"
  L18_2 = L17_2.BorderSpacing
  L18_2.Around = 10
  L17_2.ItemHeight = 13
  L18_2 = L17_2.Items
  L18_2.Text = L6_2
  L17_2.Style = "csDropDownList"
  L17_2.TabOrder = 0
  L17_2.ItemIndex = 0
  L18_2 = createComboBox
  L19_2 = L11_2
  L18_2 = L18_2(L19_2)
  L19_2 = L18_2.AnchorSideTop
  L19_2.Control = L13_2
  L19_2 = L18_2.AnchorSideTop
  L20_2 = asrCenter
  L19_2.Side = L20_2
  L19_2 = L18_2.AnchorSideRight
  L19_2.Control = L11_2
  L19_2 = L18_2.AnchorSideRight
  L20_2 = asrBottom
  L19_2.Side = L20_2
  L18_2.Left = 189
  L18_2.Height = 21
  L18_2.Top = 30
  L18_2.Width = 150
  L18_2.Anchors = "[akTop, akRight]"
  L19_2 = L18_2.BorderSpacing
  L19_2.Around = 10
  L18_2.ItemHeight = 13
  L19_2 = L18_2.Items
  L19_2.Text = L7_2
  L18_2.Style = "csDropDownList"
  L18_2.TabOrder = 1
  L18_2.ItemIndex = 0
  L19_2 = createComboBox
  L20_2 = L11_2
  L19_2 = L19_2(L20_2)
  L20_2 = L19_2.AnchorSideTop
  L20_2.Control = L14_2
  L20_2 = L19_2.AnchorSideTop
  L21_2 = asrCenter
  L20_2.Side = L21_2
  L20_2 = L19_2.AnchorSideRight
  L20_2.Control = L11_2
  L20_2 = L19_2.AnchorSideRight
  L21_2 = asrBottom
  L20_2.Side = L21_2
  L19_2.Left = 189
  L19_2.Height = 21
  L19_2.Top = 53
  L19_2.Width = 150
  L19_2.Anchors = "[akTop, akRight]"
  L20_2 = L19_2.BorderSpacing
  L20_2.Around = 10
  L19_2.ItemHeight = 13
  L20_2 = L19_2.Items
  L20_2.Text = L8_2
  L19_2.Style = "csDropDownList"
  L19_2.TabOrder = 2
  L19_2.ItemIndex = 0
  L20_2 = createEdit
  L21_2 = L11_2
  L20_2 = L20_2(L21_2)
  L21_2 = L20_2.AnchorSideTop
  L21_2.Control = L15_2
  L21_2 = L20_2.AnchorSideTop
  L22_2 = asrCenter
  L21_2.Side = L22_2
  L21_2 = L20_2.AnchorSideRight
  L21_2.Control = L11_2
  L21_2 = L20_2.AnchorSideRight
  L22_2 = asrBottom
  L21_2.Side = L22_2
  L20_2.Left = 189
  L20_2.Height = 21
  L20_2.Top = 76
  L20_2.Width = 150
  L20_2.Anchors = "[akTop, akRight]"
  L21_2 = L20_2.BorderSpacing
  L21_2.Top = 10
  L21_2 = L20_2.BorderSpacing
  L21_2.Right = 10
  L20_2.Enabled = false
  L20_2.TabOrder = 3
  L20_2.SelStart = 0
  L20_2.SelLength = 0
  L21_2 = clBlack
  L20_2.TextHintFontColor = L21_2
  L21_2 = fsBold
  L20_2.TextHintFontStyle = L21_2
  L21_2 = createButton
  L22_2 = L11_2
  L21_2 = L21_2(L22_2)
  L22_2 = L21_2.AnchorSideTop
  L22_2.Control = L15_2
  L22_2 = L21_2.AnchorSideTop
  L23_2 = asrCenter
  L22_2.Side = L23_2
  L22_2 = L21_2.AnchorSideRight
  L22_2.Control = L20_2
  L21_2.Left = 109
  L21_2.Height = 21
  L21_2.Top = 76
  L21_2.Width = 75
  L21_2.Anchors = "[akTop, akRight]"
  L22_2 = L21_2.BorderSpacing
  L22_2.Around = 5
  L21_2.Caption = "Select"
  L21_2.TabOrder = 4
  L22_2 = createComboBox
  L23_2 = L11_2
  L22_2 = L22_2(L23_2)
  L23_2 = L22_2.AnchorSideTop
  L23_2.Control = L16_2
  L23_2 = L22_2.AnchorSideTop
  L24_2 = asrCenter
  L23_2.Side = L24_2
  L23_2 = L22_2.AnchorSideRight
  L23_2.Control = L11_2
  L23_2 = L22_2.AnchorSideRight
  L24_2 = asrBottom
  L23_2.Side = L24_2
  L22_2.Left = 189
  L22_2.Height = 21
  L22_2.Top = 99
  L22_2.Width = 150
  L22_2.Anchors = "[akTop, akRight]"
  L23_2 = L22_2.BorderSpacing
  L23_2.Around = 10
  L22_2.ItemHeight = 13
  L23_2 = L22_2.Items
  L23_2.Text = L9_2
  L22_2.Style = "csDropDownList"
  L22_2.TabOrder = 5
  L22_2.ItemIndex = 0
  L23_2 = createButton
  L24_2 = L10_2
  L23_2 = L23_2(L24_2)
  L24_2 = L23_2.AnchorSideRight
  L24_2.Control = L10_2
  L24_2 = L23_2.AnchorSideRight
  L25_2 = asrBottom
  L24_2.Side = L25_2
  L24_2 = L23_2.AnchorSideBottom
  L24_2.Control = L10_2
  L24_2 = L23_2.AnchorSideBottom
  L25_2 = asrBottom
  L24_2.Side = L25_2
  L23_2.Left = 311
  L23_2.Height = 25
  L23_2.Top = 89
  L23_2.Width = 75
  L23_2.Anchors = "[akRight, akBottom]"
  L24_2 = L23_2.BorderSpacing
  L24_2.Around = 5
  L23_2.ParentFont = true
  L23_2.Caption = "Cancel"
  L23_2.TabOrder = 1
  L24_2 = createButton
  L25_2 = L10_2
  L24_2 = L24_2(L25_2)
  L25_2 = L24_2.AnchorSideRight
  L25_2.Control = L23_2
  L25_2 = L24_2.AnchorSideBottom
  L25_2.Control = L10_2
  L25_2 = L24_2.AnchorSideBottom
  L26_2 = asrBottom
  L25_2.Side = L26_2
  L24_2.Left = 231
  L24_2.Height = 25
  L24_2.Top = 89
  L24_2.Width = 75
  L24_2.Anchors = "[akRight, akBottom]"
  L25_2 = L24_2.BorderSpacing
  L25_2.Around = 5
  L24_2.ParentFont = true
  L24_2.Caption = "Apply"
  L24_2.TabOrder = 2
  L25_2 = L11_2.AnchorSideBottom
  L25_2.Control = L23_2
  L25_2 = 0
  L26_2 = 0
  L27_2 = 0
  L28_2 = ""
  L29_2 = 0
  L30_2 = 1
  
  function L31_2(A0_3)
    local L1_3
    L1_3 = L17_2.ItemIndex
    if 1 < L1_3 then
      L18_2.ItemIndex = 0
      L19_2.ItemIndex = 3
      L22_2.ItemIndex = 0
      L18_2.Enabled = false
      L19_2.Enabled = false
      L22_2.Enabled = false
    else
      L18_2.Enabled = true
      L19_2.Enabled = true
      L22_2.Enabled = true
    end
  end
  
  L17_2.OnChange = L31_2
  
  function L31_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = 0
    L2_3 = L19_2.ItemIndex
    if L2_3 == 0 then
      L2_3 = createCustomSelectionList
      L3_3 = "Club List"
      L4_3 = ClubTableStart
      L5_3 = ClubTableEnd
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L1_3 = L2_3
    else
      L2_3 = L19_2.ItemIndex
      if L2_3 == 1 then
        L2_3 = createCustomSelectionList
        L3_3 = "Competition List"
        L4_3 = CompTableStart
        L5_3 = CompTableEnd
        L2_3 = L2_3(L3_3, L4_3, L5_3)
        L1_3 = L2_3
      else
        L2_3 = L19_2.ItemIndex
        if L2_3 == 2 then
          L2_3 = createCustomSelectionList
          L3_3 = "Continent List"
          L4_3 = ContinentTableStart
          L5_3 = ContinentTableEnd
          L2_3 = L2_3(L3_3, L4_3, L5_3)
          L1_3 = L2_3
        else
          L2_3 = createCustomSelectionList
          L3_3 = "Nation List"
          L4_3 = NationTableStart
          L5_3 = NationTableEnd
          L2_3 = L2_3(L3_3, L4_3, L5_3)
          L1_3 = L2_3
        end
      end
    end
    if L1_3 == nil then
      return
    end
    L2_3 = getObjectName
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L20_2.Text = L2_3
    L3_3 = readInteger
    L4_3 = objo
    L4_3 = L4_3.Duni
    L4_3 = L1_3 + L4_3
    L3_3 = L3_3(L4_3)
    L29_2 = L3_3
  end
  
  L21_2.OnClick = L31_2
  
  function L31_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = table
    L1_3 = L1_3.contains
    L2_3 = careerPlansConditionTypes
    L3_3 = L17_2.Text
    L1_3 = L1_3(L2_3, L3_3)
    L25_2 = L1_3
    L1_3 = table
    L1_3 = L1_3.contains
    L2_3 = careerPlansJobTypes
    L3_3 = L18_2.Text
    L1_3 = L1_3(L2_3, L3_3)
    L26_2 = L1_3
    L1_3 = table
    L1_3 = L1_3.contains
    L2_3 = careerPlansObjectTypes
    L3_3 = L19_2.Text
    L1_3 = L1_3(L2_3, L3_3)
    L27_2 = L1_3
    L1_3 = tonumber
    L2_3 = L22_2.ItemIndex
    L1_3 = L1_3(L2_3)
    L1_3 = L1_3 + 1
    if not L1_3 then
      L1_3 = 1
    end
    L30_2 = L1_3
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 8
    L3_3 = L25_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 10
    L3_3 = L26_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 11
    L3_3 = L27_2
    L1_3(L2_3, L3_3)
    L1_3 = writeInteger
    L2_3 = L4_2
    L3_3 = L29_2
    L1_3(L2_3, L3_3)
    L1_3 = writeInteger
    L2_3 = L4_2
    L2_3 = L2_3 + 4
    L3_3 = L29_2
    L1_3(L2_3, L3_3)
    L1_3 = writeByte
    L2_3 = L4_2
    L2_3 = L2_3 + 9
    L3_3 = L30_2
    L1_3(L2_3, L3_3)
    L1_3 = addCareerPlans
    L2_3 = A1_2
    L3_3 = A2_2
    L1_3(L2_3, L3_3)
    L1_3 = L10_2.Close
    L1_3()
    L1_3 = getAddressList
    L1_3 = L1_3()
    L1_3 = L1_3.getMemoryRecordByID
    L2_3 = 22739
    L1_3 = L1_3(L2_3)
    L2_3 = L1_3.Active
    if L2_3 then
      L2_3 = enablePersonCareerPlans
      L3_3 = 2
      L2_3(L3_3)
    end
    L2_3 = enableAutoDisable
    L3_3 = A0_2
    L4_3 = nil
    L2_3(L3_3, L4_3)
  end
  
  L24_2.OnClick = L31_2
  
  function L31_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L10_2.Close
    L1_3()
    L1_3 = enableAutoDisable
    L2_3 = A0_2
    L3_3 = nil
    L1_3(L2_3, L3_3)
  end
  
  L23_2.OnClick = L31_2
  L31_2 = L10_2.Show
  L31_2()
end

addCareerPlansDialog = L8_1
L8_1 = registerLuaFunctionHighlight
L9_1 = "addCareerPlansDialog"
L8_1(L9_1)

function L8_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L4_2 = {}
  L5_2 = createForm
  L6_2 = false
  L5_2 = L5_2(L6_2)
  L6_2 = createPanel
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = createEdit
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = createListBox
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L9_2 = createButton
  L10_2 = L6_2
  L9_2 = L9_2(L10_2)
  L10_2 = createButton
  L11_2 = L6_2
  L10_2 = L10_2(L11_2)
  L11_2 = createLabel
  L12_2 = L6_2
  L11_2 = L11_2(L12_2)
  L12_2 = enum_values
  L12_2 = L12_2.dbts
  L12_2 = L12_2[A1_2]
  if not L12_2 then
    L12_2 = ""
  end
  L5_2.Height = 300
  L5_2.Width = 350
  L5_2.Caption = L12_2
  L5_2.Position = "poMainFormCenter"
  L5_2.BorderStyle = "bsDialog"
  L5_2.Color = 2558999
  L13_2 = L5_2.Font
  L13_2.CharSet = "ANSI_CHARSET"
  L13_2 = L5_2.Font
  L13_2.Size = 9
  L13_2 = L5_2.Font
  L13_2.Name = "Segoe UI Semibold"
  L13_2 = L5_2.Font
  L13_2.Pitch = "fpVariable"
  L13_2 = L5_2.Font
  L13_2.Quality = "fqDraft"
  L13_2 = L5_2.Font
  L13_2.Style = "[fsBold]"
  L13_2 = L5_2.Font
  L13_2.Color = 2558999
  L6_2.Left = 0
  L6_2.Top = 0
  L13_2 = alClient
  L6_2.Align = L13_2
  L13_2 = bvNone
  L6_2.BevelOuter = L13_2
  L6_2.ClientHeight = 400
  L6_2.ClientWidth = 450
  L6_2.ParentColor = true
  L6_2.ParentFont = true
  L6_2.TabOrder = 0
  L13_2 = L7_2.AnchorSideLeft
  L13_2.Control = L6_2
  L13_2 = L7_2.AnchorSideTop
  L13_2.Control = L6_2
  L13_2 = L7_2.AnchorSideRight
  L13_2.Control = L6_2
  L13_2 = L7_2.AnchorSideRight
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L7_2.Left = 10
  L7_2.Height = 21
  L7_2.Top = 10
  L7_2.Width = 270
  L7_2.Anchors = "[akTop, akLeft, akRight]"
  L13_2 = L7_2.BorderSpacing
  L13_2.Around = 10
  L7_2.TabOrder = 0
  L13_2 = TrID
  L13_2 = L13_2[447522]
  L7_2.TextHint = L13_2
  L7_2.SelStart = 0
  L7_2.SelLength = 0
  L13_2 = clBlack
  L7_2.TextHintFontColor = L13_2
  L13_2 = fsBold
  L7_2.TextHintFontStyle = L13_2
  L13_2 = L8_2.AnchorSideLeft
  L13_2.Control = L6_2
  L13_2 = L8_2.AnchorSideTop
  L13_2.Control = L7_2
  L13_2 = L8_2.AnchorSideTop
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L13_2 = L8_2.AnchorSideRight
  L13_2.Control = L6_2
  L13_2 = L8_2.AnchorSideRight
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L13_2 = L8_2.AnchorSideBottom
  L13_2.Control = L9_2
  L8_2.Left = 10
  L8_2.Height = 318
  L8_2.Top = 41
  L8_2.Width = 430
  L8_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L13_2 = L8_2.BorderSpacing
  L13_2.Left = 10
  L13_2 = L8_2.BorderSpacing
  L13_2.Right = 10
  L8_2.ItemHeight = 0
  L8_2.TabOrder = 1
  L13_2 = L9_2.AnchorSideRight
  L13_2.Control = L6_2
  L13_2 = L9_2.AnchorSideRight
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L13_2 = L9_2.AnchorSideBottom
  L13_2.Control = L6_2
  L13_2 = L9_2.AnchorSideBottom
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L9_2.Left = 365
  L9_2.Height = 21
  L9_2.Top = 369
  L9_2.Width = 75
  L9_2.Anchors = "[akRight, akBottom]"
  L13_2 = L9_2.BorderSpacing
  L13_2.Around = 10
  L13_2 = TrID
  L13_2 = L13_2[229828]
  L9_2.Caption = L13_2
  L9_2.TabOrder = 2
  L13_2 = L10_2.AnchorSideRight
  L13_2.Control = L9_2
  L13_2 = L10_2.AnchorSideBottom
  L13_2.Control = L6_2
  L13_2 = L10_2.AnchorSideBottom
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L10_2.Left = 280
  L10_2.Height = 21
  L10_2.Top = 369
  L10_2.Width = 75
  L10_2.Anchors = "[akRight, akBottom]"
  L13_2 = L10_2.BorderSpacing
  L13_2.Around = 10
  L10_2.Caption = A2_2
  L10_2.TabOrder = 3
  L13_2 = L11_2.AnchorSideLeft
  L13_2.Control = L6_2
  L13_2 = L11_2.AnchorSideTop
  L13_2.Control = L10_2
  L13_2 = L11_2.AnchorSideTop
  L14_2 = asrCenter
  L13_2.Side = L14_2
  L13_2 = L11_2.AnchorSideBottom
  L14_2 = asrBottom
  L13_2.Side = L14_2
  L11_2.Left = 11
  L11_2.Height = 15
  L11_2.Top = 172
  L11_2.Width = 48
  L13_2 = L11_2.BorderSpacing
  L13_2.Around = 10
  L11_2.Caption = "Press ENTER to search"
  L13_2 = L11_2.Font
  L14_2 = clWhite
  L13_2.Color = L14_2
  
  function L13_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L11_2.Caption = "Press ENTER to search"
    L1_3 = isKeyPressed
    L2_3 = VK_RETURN
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L1_3 = L8_2.Items
      L1_3.Text = ""
      L1_3 = A0_3.Text
      L1_3 = #L1_3
      if 2 < L1_3 then
        L1_3 = formSearch
        L2_3 = A0_3.Text
        L3_3 = A1_2
        L4_3 = L8_2
        L5_3 = L11_2
        L6_3 = A3_2
        L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
        L4_2 = L1_3
      end
    end
  end
  
  L7_2.OnKeyDown = L13_2
  
  function L13_2(A0_3)
    local L1_3
    L1_3 = mrCancel
    L5_2.ModalResult = L1_3
  end
  
  L9_2.OnClick = L13_2
  
  function L13_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_2
    L2_3 = L5_2
    L3_3 = L4_2
    L1_3(L2_3, L3_3)
    L1_3 = mrCancel
    L5_2.ModalResult = L1_3
  end
  
  L10_2.OnClick = L13_2
  L13_2 = L5_2.showModal
  L13_2()
  L13_2 = L5_2.destroy
  L13_2()
end

formSearchDatabaseSingle = L8_1

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = {}
  L3_2 = createForm
  L4_2 = false
  L3_2 = L3_2(L4_2)
  L4_2 = createPanel
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = createEdit
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = createComboBox
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L7_2 = createListBox
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  L8_2 = createButton
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L9_2 = createButton
  L10_2 = L4_2
  L9_2 = L9_2(L10_2)
  L10_2 = createLabel
  L11_2 = L4_2
  L10_2 = L10_2(L11_2)
  L3_2.Height = 300
  L3_2.Width = 350
  L11_2 = TrID
  L11_2 = L11_2[292640]
  L3_2.Caption = L11_2
  L3_2.Position = "poMainFormCenter"
  L3_2.BorderStyle = "bsDialog"
  L3_2.Color = 2558999
  L11_2 = L3_2.Font
  L11_2.CharSet = "ANSI_CHARSET"
  L11_2 = L3_2.Font
  L11_2.Size = 9
  L11_2 = L3_2.Font
  L11_2.Name = "Segoe UI Semibold"
  L11_2 = L3_2.Font
  L11_2.Pitch = "fpVariable"
  L11_2 = L3_2.Font
  L11_2.Quality = "fqDraft"
  L11_2 = L3_2.Font
  L11_2.Style = "[fsBold]"
  L11_2 = L3_2.Font
  L11_2.Color = 2558999
  L4_2.Left = 0
  L4_2.Top = 0
  L11_2 = alClient
  L4_2.Align = L11_2
  L11_2 = bvNone
  L4_2.BevelOuter = L11_2
  L4_2.ClientHeight = 400
  L4_2.ClientWidth = 450
  L4_2.ParentColor = true
  L4_2.ParentFont = true
  L4_2.TabOrder = 0
  L11_2 = L5_2.AnchorSideLeft
  L11_2.Control = L4_2
  L11_2 = L5_2.AnchorSideTop
  L11_2.Control = L4_2
  L11_2 = L5_2.AnchorSideRight
  L11_2.Control = L6_2
  L5_2.Left = 10
  L5_2.Height = 21
  L5_2.Top = 10
  L5_2.Width = 270
  L5_2.Anchors = "[akTop, akLeft, akRight]"
  L11_2 = L5_2.BorderSpacing
  L11_2.Around = 10
  L5_2.TabOrder = 0
  L11_2 = TrID
  L11_2 = L11_2[447522]
  L5_2.TextHint = L11_2
  L5_2.SelStart = 0
  L5_2.SelLength = 0
  L11_2 = clBlack
  L5_2.TextHintFontColor = L11_2
  L11_2 = fsBold
  L5_2.TextHintFontStyle = L11_2
  L11_2 = L6_2.AnchorSideTop
  L11_2.Control = L4_2
  L11_2 = L6_2.AnchorSideRight
  L11_2.Control = L4_2
  L11_2 = L6_2.AnchorSideRight
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L6_2.Left = 290
  L6_2.Height = 21
  L6_2.Top = 10
  L6_2.Width = 100
  L6_2.Anchors = "[akTop, akRight]"
  L11_2 = L6_2.BorderSpacing
  L11_2.Around = 10
  L6_2.ItemHeight = 13
  L6_2.Style = "csDropDownList"
  L6_2.TabOrder = 1
  L6_2.Items = A1_2
  L6_2.ItemIndex = 0
  L11_2 = L7_2.AnchorSideLeft
  L11_2.Control = L4_2
  L11_2 = L7_2.AnchorSideTop
  L11_2.Control = L5_2
  L11_2 = L7_2.AnchorSideTop
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L11_2 = L7_2.AnchorSideRight
  L11_2.Control = L4_2
  L11_2 = L7_2.AnchorSideRight
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L11_2 = L7_2.AnchorSideBottom
  L11_2.Control = L8_2
  L7_2.Left = 10
  L7_2.Height = 318
  L7_2.Top = 41
  L7_2.Width = 430
  L7_2.Anchors = "[akTop, akLeft, akRight, akBottom]"
  L11_2 = L7_2.BorderSpacing
  L11_2.Left = 10
  L11_2 = L7_2.BorderSpacing
  L11_2.Right = 10
  L7_2.ItemHeight = 0
  L7_2.TabOrder = 3
  L11_2 = L8_2.AnchorSideRight
  L11_2.Control = L4_2
  L11_2 = L8_2.AnchorSideRight
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L11_2 = L8_2.AnchorSideBottom
  L11_2.Control = L4_2
  L11_2 = L8_2.AnchorSideBottom
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L8_2.Left = 365
  L8_2.Height = 21
  L8_2.Top = 369
  L8_2.Width = 75
  L8_2.Anchors = "[akRight, akBottom]"
  L11_2 = L8_2.BorderSpacing
  L11_2.Around = 10
  L11_2 = TrID
  L11_2 = L11_2[229828]
  L8_2.Caption = L11_2
  L8_2.TabOrder = 4
  L11_2 = L9_2.AnchorSideRight
  L11_2.Control = L8_2
  L11_2 = L9_2.AnchorSideBottom
  L11_2.Control = L4_2
  L11_2 = L9_2.AnchorSideBottom
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L9_2.Left = 280
  L9_2.Height = 21
  L9_2.Top = 369
  L9_2.Width = 75
  L9_2.Anchors = "[akRight, akBottom]"
  L11_2 = L9_2.BorderSpacing
  L11_2.Around = 10
  L11_2 = TrID
  L11_2 = L11_2[229715]
  L9_2.Caption = L11_2
  L9_2.TabOrder = 5
  L11_2 = L10_2.AnchorSideLeft
  L11_2.Control = L4_2
  L11_2 = L10_2.AnchorSideTop
  L11_2.Control = L9_2
  L11_2 = L10_2.AnchorSideTop
  L12_2 = asrCenter
  L11_2.Side = L12_2
  L11_2 = L10_2.AnchorSideBottom
  L12_2 = asrBottom
  L11_2.Side = L12_2
  L10_2.Left = 11
  L10_2.Height = 15
  L10_2.Top = 172
  L10_2.Width = 48
  L11_2 = L10_2.BorderSpacing
  L11_2.Around = 10
  L10_2.Caption = "Press ENTER to search"
  L11_2 = L10_2.Font
  L12_2 = clWhite
  L11_2.Color = L12_2
  
  function L11_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L10_2.Caption = "Press ENTER to search"
    L1_3 = isKeyPressed
    L2_3 = VK_RETURN
    L1_3 = L1_3(L2_3)
    if L1_3 then
      L1_3 = L7_2.Items
      L1_3.Text = ""
      L1_3 = A0_3.Text
      L1_3 = #L1_3
      if 2 < L1_3 then
        L1_3 = table
        L1_3 = L1_3.contains
        L2_3 = enum_values
        L2_3 = L2_3.dbts
        L3_3 = L6_2.Items
        L4_3 = L6_2.ItemIndex
        L3_3 = L3_3[L4_3]
        L1_3 = L1_3(L2_3, L3_3)
        L2_3 = formSearch
        L3_3 = A0_3.Text
        L4_3 = L1_3
        L5_3 = L7_2
        L6_3 = L10_2
        L7_3 = true
        L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)
        L2_2 = L2_3
      end
    end
  end
  
  L5_2.OnKeyDown = L11_2
  
  function L11_2(A0_3)
    local L1_3
    L1_3 = mrCancel
    L3_2.ModalResult = L1_3
  end
  
  L8_2.OnClick = L11_2
  
  function L11_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A0_2
    L2_3 = L3_2
    L3_3 = L2_2
    L1_3(L2_3, L3_3)
  end
  
  L9_2.OnClick = L11_2
  L11_2 = L3_2.showModal
  L11_2()
  L11_2 = L3_2.destroy
  L11_2()
end

searchDatabaseForm = L8_1

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.getCurrentAddress
  L1_2 = L1_2()
  if L1_2 == nil or L1_2 == 0 then
    return
  end
  L2_2 = {}
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = A0_2.Description
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 0
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 1
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readInteger
  L6_2 = L1_2 + 2
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 6
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 7
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 8
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 10
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 11
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 13
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 15
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 17
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 19
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 9
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.concat
  L4_2 = L2_2
  L5_2 = ","
  return L3_2(L4_2, L5_2)
end

function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = L1_2.getCurrentAddress
  L2_2 = L2_2()
  if L2_2 == nil or L2_2 == 0 then
    return
  end
  L3_2 = createStringlist
  L3_2 = L3_2()
  L4_2 = L3_2.add
  L5_2 = "itemName,isActive,itemType,uid,maxAge,pos,posFam,attrBoost,attr1,attr2,attr3,attr4,attr5,prog"
  L4_2(L5_2)
  L4_2 = L3_2.add
  L5_2 = L8_1
  L6_2 = L1_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = string
  L4_2 = L4_2.format
  L5_2 = "ACPD - %s - %s"
  L6_2 = string
  L6_2 = L6_2.gsub
  L7_2 = L1_2.Description
  L8_2 = ": "
  L9_2 = ""
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = os
  L7_2 = L7_2.time
  L7_2, L8_2, L9_2 = L7_2()
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L5_2 = saveCSV
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
end

function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = createStringlist
  L2_2 = L2_2()
  L3_2 = L2_2.add
  L4_2 = "itemName,isActive,itemType,uid,maxAge,pos,posFam,attrBoost,attr1,attr2,attr3,attr4,attr5,prog"
  L3_2(L4_2)
  L3_2 = L1_2.Count
  if 4 < L3_2 then
    L3_2 = 5
    L4_2 = L1_2.Count
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = L2_2.add
      L8_2 = L8_1
      L9_2 = L1_2.Child
      L10_2 = L6_2 - 1
      L9_2 = L9_2[L10_2]
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      L7_2(L8_2, L9_2, L10_2)
    end
  end
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "ACPD - All Items - %s"
  L5_2 = os
  L5_2 = L5_2.time
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2()
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = saveCSV
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
end

function L11_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  if A0_2 then
    L10_2 = A0_2.Control
    L10_2 = L10_2[0]
    L10_2 = L10_2.Control
    L5_2 = L10_2[2]
    if L5_2 == nil then
      return
    end
    L6_2 = L5_2.ItemIndex
    if L6_2 == -1 then
      return
    end
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L7_2 = L10_2.name
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L8_2 = L10_2.id
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L9_2 = L10_2.type
  else
    L7_2 = A2_2
    L8_2 = A3_2
    L9_2 = A4_2
  end
  L10_2 = getAddressSafe
  L11_2 = "xxetbzjy"
  L10_2 = L10_2(L11_2)
  if L10_2 == nil then
    return
  end
  L11_2 = getAddressSafe
  L12_2 = L10_2 + 257
  L11_2 = L11_2(L12_2)
  if L11_2 == nil then
    return
  end
  L12_2 = getAddressList
  L12_2 = L12_2()
  L12_2 = L12_2.getMemoryRecordByID
  L13_2 = 23721
  L12_2 = L12_2(L13_2)
  if L12_2 ~= nil then
    L13_2 = L12_2.count
    L13_2 = L13_2 - 4
    if L13_2 == 32 then
      L14_2 = messageDialog
      L15_2 = [[
The maximum number of items has been reached!

Please remove some items.]]
      L16_2 = 0
      L14_2(L15_2, L16_2)
      return
    end
    L14_2 = nil
    L15_2 = nil
    L16_2 = nil
    L17_2 = nil
    L18_2 = nil
    L19_2 = nil
    L20_2 = findRecord
    L21_2 = L12_2
    L22_2 = L7_2
    L20_2, L21_2 = L20_2(L21_2, L22_2)
    L17_2 = L21_2
    L14_2 = L20_2
    L20_2 = getAddressSafe
    L21_2 = 21 * L13_2
    L21_2 = L11_2 + L21_2
    L20_2 = L20_2(L21_2)
    if not L14_2 then
      L21_2 = createRecord
      L22_2 = L12_2
      L23_2 = L7_2
      L24_2 = vtGrouped
      L25_2 = 21 * L13_2
      L25_2 = L11_2 + L25_2
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L14_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Child3
      L14_2.Color = L21_2
      L14_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L14_2.DontSave = true
      L21_2 = createRecord
      L22_2 = L14_2
      L23_2 = "Export Item"
      L24_2 = vtGrouped
      L25_2 = nil
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L15_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Text
      L15_2.Color = L21_2
      
      function L21_2(A0_3, A1_3, A2_3)
        local L3_3, L4_3
        L3_3 = L9_1
        L4_3 = A0_3
        L3_3(L4_3)
        L3_3 = false
        return L3_3
      end
      
      L15_2.OnActivate = L21_2
      L21_2 = createRecord
      L22_2 = L14_2
      L23_2 = TrID
      L23_2 = L23_2[900002]
      L24_2 = vtGrouped
      L25_2 = nil
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L15_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.SeparatorSmall
      L15_2.Color = L21_2
      L21_2 = createRecord
      L22_2 = L14_2
      L23_2 = "Is Active ?"
      L24_2 = vtByte
      L25_2 = "+0"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L15_2 = L21_2
      L15_2.Color = 65535
      L15_2.DropDownReadOnly = true
      L15_2.DropDownDescriptionOnly = true
      L15_2.DisplayAsDropDownListItem = true
      L21_2 = L15_2.DropDownList
      L22_2 = typeOptionStringMaps
      L22_2 = L22_2.binaryOptionType
      L21_2.Text = L22_2
      L15_2.Value = 1
      L21_2 = {}
      L22_2 = TrID
      L22_2 = L22_2[294179]
      L21_2[25] = L22_2
      L22_2 = TrID
      L22_2 = L22_2[229389]
      L21_2[5] = L22_2
      L22_2 = TrID
      L22_2 = L22_2[229390]
      L21_2[9] = L22_2
      L22_2 = TrID
      L22_2 = L22_2[294180]
      L21_2[1] = L22_2
      L22_2 = TrID
      L22_2 = L22_2[294181]
      L21_2[24] = L22_2
      L18_2 = L21_2
      L21_2 = enumsToStringList
      L22_2 = L18_2
      L23_2 = true
      L21_2 = L21_2(L22_2, L23_2)
      L19_2 = L21_2
      L21_2 = createRecord
      L22_2 = L14_2
      L23_2 = "Item Type"
      L24_2 = vtByte
      L25_2 = "+0x1"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L15_2 = L21_2
      L15_2.Color = 65535
      L15_2.DropDownReadOnly = true
      L15_2.DropDownDescriptionOnly = true
      L15_2.DisplayAsDropDownListItem = true
      L21_2 = L15_2.DropDownList
      L21_2.Text = L19_2
      L15_2.Value = L9_2
      L21_2 = createRecord
      L22_2 = L14_2
      L23_2 = "Unique ID"
      L24_2 = vtDword
      L25_2 = "+0x2"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L15_2 = L21_2
      L15_2.Color = 65535
      L15_2.Value = L8_2
      L21_2 = dependencies
      L22_2 = {}
      L23_2 = 5
      L24_2 = 9
      L25_2 = 24
      L26_2 = 25
      L22_2[1] = L23_2
      L22_2[2] = L24_2
      L22_2[3] = L25_2
      L22_2[4] = L26_2
      L23_2 = L9_2
      L21_2 = L21_2(L22_2, L23_2)
      if L21_2 then
        L21_2 = createRecord
        L22_2 = L14_2
        L23_2 = TrID
        L23_2 = L23_2[900002]
        L24_2 = vtGrouped
        L25_2 = nil
        L26_2 = nil
        L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
        L15_2 = L21_2
        L21_2 = Color
        L21_2 = L21_2.SeparatorSmall
        L15_2.Color = L21_2
        L21_2 = createRecord
        L22_2 = L14_2
        L23_2 = "Player Max Age Filter"
        L24_2 = vtByte
        L25_2 = "+0x6"
        L26_2 = nil
        L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
        L15_2 = L21_2
        L21_2 = Color
        L21_2 = L21_2.ReadMe
        L15_2.Color = L21_2
        L15_2.DropDownReadOnly = false
        L15_2.DropDownDescriptionOnly = true
        L15_2.DisplayAsDropDownListItem = true
        L21_2 = L15_2.DropDownList
        L21_2.Text = "0:All Ages"
        L15_2.Value = 0
        L21_2 = {}
        L21_2[0] = "All Roles"
        L21_2[1] = "Defending Roles (GK/DC)"
        L21_2[2] = "Midfield Roles (DM/M/AM C)"
        L21_2[3] = "Flank Roles (D/WB/M/AM RL)"
        L21_2[4] = "Attacking Roles (ST)"
        L18_2 = L21_2
        L21_2 = enumsToStringList
        L22_2 = L18_2
        L23_2 = true
        L21_2 = L21_2(L22_2, L23_2)
        L19_2 = L21_2
        L21_2 = createRecord
        L22_2 = L14_2
        L23_2 = "Player Position Filter"
        L24_2 = vtByte
        L25_2 = "+0x7"
        L26_2 = nil
        L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
        L15_2 = L21_2
        L21_2 = Color
        L21_2 = L21_2.ReadMe
        L15_2.Color = L21_2
        L15_2.DropDownReadOnly = true
        L15_2.DropDownDescriptionOnly = true
        L15_2.DisplayAsDropDownListItem = true
        L21_2 = L15_2.DropDownList
        L21_2.Text = L19_2
        L15_2.Value = 0
        L21_2 = {}
        L21_2[18] = "Natural"
        L21_2[15] = "Accomplished"
        L21_2[12] = "Competent"
        L18_2 = L21_2
        L21_2 = enumsToStringList
        L22_2 = L18_2
        L23_2 = true
        L21_2 = L21_2(L22_2, L23_2)
        L19_2 = L21_2
        L21_2 = createRecord
        L22_2 = L14_2
        L23_2 = "Player Position's Familiarity Filter"
        L24_2 = vtByte
        L25_2 = "+0x8"
        L26_2 = nil
        L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
        L15_2 = L21_2
        L21_2 = Color
        L21_2 = L21_2.ReadMe
        L15_2.Color = L21_2
        L15_2.DropDownReadOnly = true
        L15_2.DropDownDescriptionOnly = true
        L15_2.DisplayAsDropDownListItem = true
        L21_2 = L15_2.DropDownList
        L21_2.Text = L19_2
        L15_2.Value = 18
      end
      L21_2 = createRecord
      L22_2 = L14_2
      L23_2 = TrID
      L23_2 = L23_2[900002]
      L24_2 = vtGrouped
      L25_2 = nil
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L15_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.SeparatorSmall
      L15_2.Color = L21_2
      L21_2 = {}
      L22_2 = TrID
      L22_2 = L22_2[293210]
      L21_2[0] = L22_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 34
      L23_2 = TrID
      L23_2 = L23_2[227769]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 46
      L23_2 = TrID
      L23_2 = L23_2[227774]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 42
      L23_2 = TrID
      L23_2 = L23_2[227780]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 39
      L23_2 = TrID
      L23_2 = L23_2[349773]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 50
      L23_2 = TrID
      L23_2 = L23_2[227830]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 38
      L23_2 = TrID
      L23_2 = L23_2[227879]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 37
      L23_2 = TrID
      L23_2 = L23_2[227898]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 36
      L23_2 = TrID
      L23_2 = L23_2[227900]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 45
      L23_2 = TrID
      L23_2 = L23_2[227772]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 17
      L23_2 = TrID
      L23_2 = L23_2[227776]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 43
      L23_2 = TrID
      L23_2 = L23_2[227782]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 52
      L23_2 = TrID
      L23_2 = L23_2[227914]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 53
      L23_2 = TrID
      L23_2 = L23_2[227916]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 18
      L23_2 = TrID
      L23_2 = L23_2[227801]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 51
      L23_2 = TrID
      L23_2 = L23_2[227803]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 26
      L23_2 = TrID
      L23_2 = L23_2[227812]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 40
      L23_2 = TrID
      L23_2 = L23_2[230010]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 6
      L23_2 = TrID
      L23_2 = L23_2[227877]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 20
      L23_2 = TrID
      L23_2 = L23_2[227886]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 28
      L23_2 = TrID
      L23_2 = L23_2[227910]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 10
      L23_2 = TrID
      L23_2 = L23_2[230023]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 29
      L23_2 = TrID
      L23_2 = L23_2[227912]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 27
      L23_2 = TrID
      L23_2 = L23_2[227896]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 0
      L23_2 = TrID
      L23_2 = L23_2[227798]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 1
      L23_2 = TrID
      L23_2 = L23_2[227805]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 2
      L23_2 = TrID
      L23_2 = L23_2[227810]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 22
      L23_2 = TrID
      L23_2 = L23_2[227894]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 35
      L23_2 = TrID
      L23_2 = L23_2[276817]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 3
      L23_2 = TrID
      L23_2 = L23_2[227818]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 4
      L23_2 = TrID
      L23_2 = L23_2[227834]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 30
      L23_2 = TrID
      L23_2 = L23_2[227836]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 5
      L23_2 = TrID
      L23_2 = L23_2[227838]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 7
      L23_2 = TrID
      L23_2 = L23_2[227881]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 8
      L23_2 = TrID
      L23_2 = L23_2[227883]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 9
      L23_2 = TrID
      L23_2 = L23_2[227902]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 23
      L23_2 = TrID
      L23_2 = L23_2[227904]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 12
      L23_2 = TrID
      L23_2 = L23_2[388016]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 13
      L23_2 = TrID
      L23_2 = L23_2[561006]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 14
      L23_2 = TrID
      L23_2 = L23_2[227791]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 31
      L23_2 = TrID
      L23_2 = L23_2[227808]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 11
      L23_2 = TrID
      L23_2 = L23_2[227816]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 15
      L23_2 = TrID
      L23_2 = L23_2[227832]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 19
      L23_2 = TrID
      L23_2 = L23_2[227861]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 33
      L23_2 = TrID
      L23_2 = L23_2[227908]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 21
      L23_2 = TrID
      L23_2 = L23_2[227888]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 32
      L23_2 = TrID
      L23_2 = L23_2[227890]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 16
      L23_2 = TrID
      L23_2 = L23_2[227906]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 44
      L23_2 = TrID
      L23_2 = L23_2[230006]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 47
      L23_2 = TrID
      L23_2 = L23_2[230008]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 49
      L23_2 = TrID
      L23_2 = L23_2[230011]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 24
      L23_2 = TrID
      L23_2 = L23_2[230000]
      L21_2[L22_2] = L23_2
      L22_2 = plao
      L22_2 = L22_2.Patr
      L22_2 = L22_2 + 25
      L23_2 = TrID
      L23_2 = L23_2[230001]
      L21_2[L22_2] = L23_2
      L18_2 = L21_2
      L21_2 = enumsToStringList
      L22_2 = L18_2
      L23_2 = true
      L21_2 = L21_2(L22_2, L23_2)
      L19_2 = L21_2
      L21_2 = createRecord
      L22_2 = L14_2
      L23_2 = "Use Attributes Booster"
      L24_2 = vtByte
      L25_2 = "+A"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L15_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Presets
      L15_2.Color = L21_2
      L15_2.DropDownReadOnly = true
      L15_2.DropDownDescriptionOnly = true
      L15_2.DisplayAsDropDownListItem = true
      L21_2 = L15_2.DropDownList
      L22_2 = typeOptionStringMaps
      L22_2 = L22_2.binaryOptionType
      L21_2.Text = L22_2
      L21_2 = createRecord
      L22_2 = L15_2
      L23_2 = "Attribute 1"
      L24_2 = vtWord
      L25_2 = "+0x1"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L16_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Text
      L16_2.Color = L21_2
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L21_2 = L16_2.DropDownList
      L21_2.Text = L19_2
      L21_2 = createRecord
      L22_2 = L15_2
      L23_2 = "Attribute 2"
      L24_2 = vtWord
      L25_2 = "+0x3"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L16_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Text
      L16_2.Color = L21_2
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L21_2 = L16_2.DropDownList
      L21_2.Text = L19_2
      L21_2 = createRecord
      L22_2 = L15_2
      L23_2 = "Attribute 3"
      L24_2 = vtWord
      L25_2 = "+0x5"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L16_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Text
      L16_2.Color = L21_2
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L21_2 = L16_2.DropDownList
      L21_2.Text = L19_2
      L21_2 = createRecord
      L22_2 = L15_2
      L23_2 = "Attribute 4"
      L24_2 = vtWord
      L25_2 = "+0x7"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L16_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Text
      L16_2.Color = L21_2
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L21_2 = L16_2.DropDownList
      L21_2.Text = L19_2
      L21_2 = createRecord
      L22_2 = L15_2
      L23_2 = "Attribute 5"
      L24_2 = vtWord
      L25_2 = "+0x9"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L16_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Text
      L16_2.Color = L21_2
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L21_2 = L16_2.DropDownList
      L21_2.Text = L19_2
      L21_2 = createRecord
      L22_2 = L14_2
      L23_2 = "Progress Rate"
      L24_2 = vtByte
      L25_2 = "+0x9"
      L26_2 = nil
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
      L15_2 = L21_2
      L21_2 = Color
      L21_2 = L21_2.Presets
      L15_2.Color = L21_2
      L15_2.Value = 1
      L21_2 = writeQword
      L22_2 = 8 * L13_2
      L22_2 = L10_2 + L22_2
      L23_2 = L20_2
      L21_2(L22_2, L23_2)
      L21_2 = writeByte
      L22_2 = L10_2 + 256
      L23_2 = L13_2 + 1
      L21_2(L22_2, L23_2)
      L21_2 = xxetbzjy
      L22_2 = {}
      L22_2.indx = L13_2
      L22_2.mrec = L14_2
      L23_2 = L14_2.getCurrentAddress
      L23_2 = L23_2()
      L22_2.addr = L23_2
      L23_2 = readBytes
      L24_2 = L14_2.getCurrentAddress
      L24_2 = L24_2()
      L25_2 = 21
      L26_2 = true
      L23_2 = L23_2(L24_2, L25_2, L26_2)
      L22_2.data = L23_2
      L21_2[L7_2] = L22_2
      
      function L21_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
        L0_3 = table
        L0_3 = L0_3.removekey
        L1_3 = xxetbzjy
        L2_3 = L7_2
        L0_3(L1_3, L2_3)
        L0_3 = readByte
        L1_3 = L10_2
        L1_3 = L1_3 + 256
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L1_3 = L12_2.count
          L1_3 = L1_3 - 2
          if L0_3 <= L1_3 then
            L1_3 = readBytes
            L2_3 = L14_2.getCurrentAddress
            L2_3 = L2_3()
            L2_3 = L2_3 + 21
            L3_3 = L13_2
            L3_3 = 32 - L3_3
            L3_3 = L3_3 + 1
            L3_3 = L3_3 * 21
            L4_3 = true
            L1_3 = L1_3(L2_3, L3_3, L4_3)
            L2_3 = writeBytes
            L3_3 = L14_2.getCurrentAddress
            L3_3 = L3_3()
            L4_3 = L1_3
            L2_3(L3_3, L4_3)
            L2_3 = pairs
            L3_3 = xxetbzjy
            L2_3, L3_3, L4_3 = L2_3(L3_3)
            for L5_3, L6_3 in L2_3, L3_3, L4_3 do
              L7_3 = L13_2
              L8_3 = L6_3.indx
              if L7_3 <= L8_3 then
                L7_3 = xxetbzjy
                L7_3 = L7_3[L5_3]
                L8_3 = L6_3.indx
                L8_3 = L8_3 - 1
                L7_3.indx = L8_3
                L7_3 = xxetbzjy
                L7_3 = L7_3[L5_3]
                L8_3 = L11_2
                L9_3 = xxetbzjy
                L9_3 = L9_3[L5_3]
                L9_3 = L9_3.indx
                L9_3 = 21 * L9_3
                L8_3 = L8_3 + L9_3
                L7_3.addr = L8_3
                L7_3 = xxetbzjy
                L7_3 = L7_3[L5_3]
                L8_3 = readBytes
                L9_3 = xxetbzjy
                L9_3 = L9_3[L5_3]
                L9_3 = L9_3.addr
                L10_3 = 21
                L11_3 = true
                L8_3 = L8_3(L9_3, L10_3, L11_3)
                L7_3.data = L8_3
                L7_3 = xxetbzjy
                L7_3 = L7_3[L5_3]
                L7_3 = L7_3.mrec
                L8_3 = xxetbzjy
                L8_3 = L8_3[L5_3]
                L8_3 = L8_3.addr
                L7_3.Address = L8_3
              end
            end
          end
          L0_3 = L0_3 - 1
          L1_3 = writeByte
          L2_3 = L10_2
          L2_3 = L2_3 + 256
          L3_3 = L0_3
          L1_3(L2_3, L3_3)
          L1_3 = writeQword
          L2_3 = L10_2
          L3_3 = L0_3 * 8
          L2_3 = L2_3 + L3_3
          L3_3 = 0
          L1_3(L2_3, L3_3)
        end
      end
      
      L14_2.OnDestroy = L21_2
    else
      L21_2 = xxetbzjy
      L21_2 = L21_2[L7_2]
      L22_2 = L17_2 - 4
      L21_2.indx = L22_2
      L21_2 = xxetbzjy
      L21_2 = L21_2[L7_2]
      L22_2 = L17_2 - 4
      L22_2 = L22_2 * 21
      L22_2 = L11_2 + L22_2
      L21_2.addr = L22_2
      L21_2 = xxetbzjy
      L21_2 = L21_2[L7_2]
      L22_2 = readBytes
      L23_2 = xxetbzjy
      L23_2 = L23_2[L7_2]
      L23_2 = L23_2.addr
      L24_2 = 21
      L25_2 = true
      L22_2 = L22_2(L23_2, L24_2, L25_2)
      L21_2.data = L22_2
      L21_2 = xxetbzjy
      L21_2 = L21_2[L7_2]
      L21_2 = L21_2.mrec
      L22_2 = xxetbzjy
      L22_2 = L22_2[L7_2]
      L22_2 = L22_2.addr
      L21_2.Address = L22_2
    end
  end
end

function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = readCSV
  L3_2 = loadCSV
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L3_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  if L2_2 == nil then
    return
  end
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L2_2[L6_2]
    L8_2 = L8_2[1]
    L9_2 = L2_2[L6_2]
    L9_2 = L9_2[3]
    L10_2 = L2_2[L6_2]
    L10_2 = L10_2[4]
    L11_2 = L11_1
    L12_2 = nil
    L13_2 = nil
    L14_2 = L8_2
    L15_2 = tonumber
    L16_2 = L10_2
    L15_2 = L15_2(L16_2)
    L16_2 = tonumber
    L17_2 = L9_2
    L16_2, L17_2 = L16_2(L17_2)
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L11_2 = findRecord
    L12_2 = L1_2
    L13_2 = L8_2
    L11_2, L12_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L13_2 = L11_2.getCurrentAddress
      L13_2 = L13_2()
      if L13_2 == nil or L13_2 == 0 then
        return
      end
      L14_2 = writeByte
      L15_2 = L13_2 + 0
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[2]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 1
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[3]
      L14_2(L15_2, L16_2)
      L14_2 = writeInteger
      L15_2 = L13_2 + 2
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[4]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 6
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[5]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 7
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[6]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 8
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[7]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 10
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[8]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 11
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[9]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 13
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[10]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 15
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[11]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 17
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[12]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 19
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[13]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 9
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[14]
      L14_2(L15_2, L16_2)
    end
  end
end

L13_1 = getAddressList
L13_1 = L13_1()
L13_1 = L13_1.getMemoryRecordByID
L14_1 = 23685
L13_1 = L13_1(L14_1)
if L13_1 ~= nil then
  function L14_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2
    
    L3_2 = createStringList
    L3_2 = L3_2()
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[294181]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[294179]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[229389]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[229390]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[294180]
    L4_2(L5_2)
    L4_2 = searchDatabaseForm
    L5_2 = L11_1
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  
  L13_1.OnActivate = L14_1
end
L14_1 = getAddressList
L14_1 = L14_1()
L14_1 = L14_1.getMemoryRecordByID
L15_1 = 24316
L14_1 = L14_1(L15_1)
if L14_1 ~= nil then
  function L15_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2
    
    L3_2 = L10_1
    L4_2 = A0_2
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  
  L14_1.OnActivate = L15_1
end
L15_1 = getAddressList
L15_1 = L15_1()
L15_1 = L15_1.getMemoryRecordByID
L16_1 = 24315
L15_1 = L15_1(L16_1)
if L15_1 ~= nil then
  function L16_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2
    
    L3_2 = L12_1
    L4_2 = A0_2
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  
  L15_1.OnActivate = L16_1
end
cdznuteg = L11_1

function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.getCurrentAddress
  L1_2 = L1_2()
  if L1_2 == nil or L1_2 == 0 then
    return
  end
  L2_2 = {}
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = A0_2.Description
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 0
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 1
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readInteger
  L6_2 = L1_2 + 2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 6
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 7
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 8
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 9
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 10
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 12
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 14
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 15
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.concat
  L4_2 = L2_2
  L5_2 = ","
  return L3_2(L4_2, L5_2)
end

function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = L1_2.getCurrentAddress
  L2_2 = L2_2()
  if L2_2 == nil or L2_2 == 0 then
    return
  end
  L3_2 = createStringlist
  L3_2 = L3_2()
  L4_2 = L3_2.add
  L5_2 = "itemName,enabled,itemType,uniqueId,positionFilter,positionFamiliarity,fitnessMoraleMode,morale,condition,sharpness,fatigue,lockedMode,attributesMode,attributesBoost,allPositionsFamiliarity"
  L4_2(L5_2)
  L4_2 = L3_2.add
  L5_2 = L16_1
  L6_2 = L1_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = string
  L4_2 = L4_2.format
  L5_2 = "GDGN - %s - %s"
  L6_2 = string
  L6_2 = L6_2.gsub
  L7_2 = L1_2.Description
  L8_2 = ": "
  L9_2 = ""
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = os
  L7_2 = L7_2.time
  L7_2, L8_2, L9_2 = L7_2()
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L5_2 = saveCSV
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
end

function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = createStringlist
  L2_2 = L2_2()
  L3_2 = L2_2.add
  L4_2 = "itemName,enabled,itemType,uniqueId,positionFilter,positionFamiliarity,fitnessMoraleMode,morale,condition,sharpness,fatigue,lockedMode,attributesMode,attributesBoost,allPositionsFamiliarity"
  L3_2(L4_2)
  L3_2 = L1_2.Count
  if 4 < L3_2 then
    L3_2 = 5
    L4_2 = L1_2.Count
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = L2_2.add
      L8_2 = L16_1
      L9_2 = L1_2.Child
      L10_2 = L6_2 - 1
      L9_2 = L9_2[L10_2]
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      L7_2(L8_2, L9_2, L10_2)
    end
  end
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "GDGN - All Items - %s"
  L5_2 = os
  L5_2 = L5_2.time
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2()
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = saveCSV
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
end

function L19_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  if A0_2 then
    L10_2 = A0_2.Control
    L10_2 = L10_2[0]
    L10_2 = L10_2.Control
    L5_2 = L10_2[2]
    if L5_2 == nil then
      return
    end
    L6_2 = L5_2.ItemIndex
    if L6_2 == -1 then
      return
    end
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L7_2 = L10_2.name
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L8_2 = L10_2.id
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L9_2 = L10_2.type
  else
    L7_2 = A2_2
    L8_2 = A3_2
    L9_2 = A4_2
  end
  L10_2 = getAddressSafe
  L11_2 = "hdeffxoa"
  L10_2 = L10_2(L11_2)
  if L10_2 == nil then
    return
  end
  L11_2 = getAddressSafe
  L12_2 = L10_2 + 257
  L11_2 = L11_2(L12_2)
  if L11_2 == nil then
    return
  end
  L12_2 = getAddressList
  L12_2 = L12_2()
  L12_2 = L12_2.getMemoryRecordByID
  L13_2 = 23636
  L12_2 = L12_2(L13_2)
  if L12_2 ~= nil then
    L13_2 = L12_2.count
    L13_2 = L13_2 - 4
    if L13_2 == 32 then
      L14_2 = messageDialog
      L15_2 = [[
The maximum number of items has been reached!

Please remove some items.]]
      L16_2 = 0
      L14_2(L15_2, L16_2)
      return
    end
    L14_2 = nil
    L15_2 = nil
    L16_2 = nil
    L17_2 = nil
    L18_2 = nil
    L19_2 = nil
    L20_2 = nil
    L21_2 = nil
    L22_2 = findRecord
    L23_2 = L12_2
    L24_2 = L7_2
    L22_2, L23_2 = L22_2(L23_2, L24_2)
    L19_2 = L23_2
    L14_2 = L22_2
    L22_2 = getAddressSafe
    L23_2 = 16 * L13_2
    L23_2 = L11_2 + L23_2
    L22_2 = L22_2(L23_2)
    if not L14_2 then
      L23_2 = createRecord
      L24_2 = L12_2
      L25_2 = L7_2
      L26_2 = vtGrouped
      L27_2 = 16 * L13_2
      L27_2 = L11_2 + L27_2
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L14_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Header
      L14_2.Color = L23_2
      L14_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L14_2.DontSave = true
      
      function L23_2(A0_3)
        local L1_3
        L1_3 = Color
        L1_3 = L1_3.SwitchOn
        A0_3.Color = L1_3
        L1_3 = true
        return L1_3
      end
      
      L14_2.OnActivate = L23_2
      
      function L23_2(A0_3)
        local L1_3
        L1_3 = Color
        L1_3 = L1_3.Header
        A0_3.Color = L1_3
        L1_3 = true
        return L1_3
      end
      
      L14_2.OnDeactivate = L23_2
      L23_2 = createRecord
      L24_2 = L14_2
      L25_2 = "Export Item"
      L26_2 = vtGrouped
      L27_2 = nil
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L15_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Text
      L15_2.Color = L23_2
      
      function L23_2(A0_3, A1_3, A2_3)
        local L3_3, L4_3
        L3_3 = L17_1
        L4_3 = A0_3
        L3_3(L4_3)
        L3_3 = false
        return L3_3
      end
      
      L15_2.OnActivate = L23_2
      L23_2 = createRecord
      L24_2 = L14_2
      L25_2 = TrID
      L25_2 = L25_2[900002]
      L26_2 = vtGrouped
      L27_2 = nil
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L15_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.SeparatorSmall
      L15_2.Color = L23_2
      L23_2 = createRecord
      L24_2 = L14_2
      L25_2 = "Enabled"
      L26_2 = vtByte
      L27_2 = "+0"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L15_2 = L23_2
      L15_2.Color = 65535
      L15_2.DropDownReadOnly = true
      L15_2.DropDownDescriptionOnly = true
      L15_2.DisplayAsDropDownListItem = true
      L23_2 = L15_2.DropDownList
      L24_2 = typeOptionStringMaps
      L24_2 = L24_2.binaryOptionType
      L23_2.Text = L24_2
      L15_2.Value = 1
      L23_2 = {}
      L24_2 = TrID
      L24_2 = L24_2[294178]
      L23_2[3] = L24_2
      L24_2 = TrID
      L24_2 = L24_2[294179]
      L23_2[5] = L24_2
      L24_2 = TrID
      L24_2 = L24_2[229389]
      L23_2[19] = L24_2
      L24_2 = TrID
      L24_2 = L24_2[229390]
      L23_2[9] = L24_2
      L20_2 = L23_2
      L23_2 = enumsToStringList
      L24_2 = L20_2
      L25_2 = true
      L23_2 = L23_2(L24_2, L25_2)
      L21_2 = L23_2
      L23_2 = createRecord
      L24_2 = L14_2
      L25_2 = "Item Type"
      L26_2 = vtByte
      L27_2 = "+0x1"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L15_2 = L23_2
      L15_2.Color = 65535
      L15_2.DropDownReadOnly = true
      L15_2.DropDownDescriptionOnly = true
      L15_2.DisplayAsDropDownListItem = true
      L23_2 = L15_2.DropDownList
      L23_2.Text = L21_2
      L15_2.Value = L9_2
      L23_2 = createRecord
      L24_2 = L14_2
      L25_2 = "Unique ID"
      L26_2 = vtDword
      L27_2 = "+0x2"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L15_2 = L23_2
      L15_2.Color = 65535
      L15_2.Value = L8_2
      L23_2 = dependencies
      L24_2 = {}
      L25_2 = 9
      L26_2 = 24
      L24_2[1] = L25_2
      L24_2[2] = L26_2
      L25_2 = L9_2
      L23_2 = L23_2(L24_2, L25_2)
      if L23_2 then
        L23_2 = createRecord
        L24_2 = L14_2
        L25_2 = TrID
        L25_2 = L25_2[900002]
        L26_2 = vtGrouped
        L27_2 = nil
        L28_2 = nil
        L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
        L15_2 = L23_2
        L23_2 = Color
        L23_2 = L23_2.SeparatorSmall
        L15_2.Color = L23_2
        L23_2 = {}
        L23_2[0] = "All Roles"
        L23_2[1] = "Defending Roles (GK/DC)"
        L23_2[2] = "Midfield Roles (DM/M/AM C)"
        L23_2[3] = "Flank Roles (D/WB/M/AM RL)"
        L23_2[4] = "Attacking Roles (ST)"
        L20_2 = L23_2
        L23_2 = enumsToStringList
        L24_2 = L20_2
        L25_2 = true
        L23_2 = L23_2(L24_2, L25_2)
        L21_2 = L23_2
        L23_2 = createRecord
        L24_2 = L14_2
        L25_2 = "Player Position Filter"
        L26_2 = vtByte
        L27_2 = "+0x6"
        L28_2 = nil
        L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
        L15_2 = L23_2
        L23_2 = Color
        L23_2 = L23_2.ReadMe
        L15_2.Color = L23_2
        L15_2.DropDownReadOnly = true
        L15_2.DropDownDescriptionOnly = true
        L15_2.DisplayAsDropDownListItem = true
        L23_2 = L15_2.DropDownList
        L23_2.Text = L21_2
        L15_2.Value = 0
        L23_2 = {}
        L24_2 = TrID
        L24_2 = L24_2[248634]
        L23_2[18] = L24_2
        L24_2 = TrID
        L24_2 = L24_2[248635]
        L23_2[15] = L24_2
        L24_2 = TrID
        L24_2 = L24_2[248636]
        L23_2[12] = L24_2
        L20_2 = L23_2
        L23_2 = enumsToStringList
        L24_2 = L20_2
        L25_2 = true
        L23_2 = L23_2(L24_2, L25_2)
        L21_2 = L23_2
        L23_2 = createRecord
        L24_2 = L14_2
        L25_2 = "Player Position's Familiarity Filter"
        L26_2 = vtByte
        L27_2 = "+0x7"
        L28_2 = nil
        L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
        L15_2 = L23_2
        L23_2 = Color
        L23_2 = L23_2.ReadMe
        L15_2.Color = L23_2
        L15_2.DropDownReadOnly = true
        L15_2.DropDownDescriptionOnly = true
        L15_2.DisplayAsDropDownListItem = true
        L23_2 = L15_2.DropDownList
        L23_2.Text = L21_2
        L15_2.Value = 18
      end
      L23_2 = createRecord
      L24_2 = L14_2
      L25_2 = TrID
      L25_2 = L25_2[900002]
      L26_2 = vtGrouped
      L27_2 = nil
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L15_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.SeparatorSmall
      L15_2.Color = L23_2
      L23_2 = createRecord
      L24_2 = L14_2
      L25_2 = "Potential Ability Modifiers >"
      L26_2 = vtGrouped
      L27_2 = nil
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L15_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Child3
      L15_2.Color = L23_2
      L15_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L23_2 = {}
      L23_2[0] = "Inactive"
      L23_2[1] = "Active - Presets Ranges"
      L23_2[2] = "Active - Custom Ranges"
      L20_2 = L23_2
      L23_2 = enumsToStringList
      L24_2 = L20_2
      L25_2 = true
      L23_2 = L23_2(L24_2, L25_2)
      L21_2 = L23_2
      L23_2 = createRecord
      L24_2 = L15_2
      L25_2 = "Potential Ability Mode"
      L26_2 = vtByte
      L27_2 = "+0x8"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L16_2 = L23_2
      L16_2.Color = 65535
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L23_2 = L16_2.DropDownList
      L23_2.Text = L21_2
      L23_2 = createRecord
      L24_2 = L15_2
      L25_2 = TrID
      L25_2 = L25_2[900002]
      L26_2 = vtGrouped
      L27_2 = nil
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L16_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.SeparatorSmall
      L16_2.Color = L23_2
      L23_2 = createRecord
      L24_2 = L15_2
      L25_2 = "Presets Ranges >"
      L26_2 = vtGrouped
      L27_2 = "+0x9"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L16_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Child4
      L16_2.Color = L23_2
      L16_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L23_2 = {}
      L23_2[1] = "Grassroots Level"
      L23_2[2] = "Local Amateur"
      L23_2[3] = "Semi-Pro Foundations"
      L23_2[4] = "Developing Academy"
      L23_2[5] = "Regional Academy"
      L23_2[6] = "Emerging Academy"
      L23_2[7] = "Professional Pathway"
      L23_2[8] = "Competitive Academy"
      L23_2[9] = "National-Level Academy"
      L23_2[10] = "Strong Academy"
      L23_2[11] = "High-Level Academy"
      L23_2[12] = "Talent Factory"
      L23_2[13] = "Elite Talent Producer"
      L23_2[14] = "Top Academy"
      L23_2[15] = "Elite Academy"
      L23_2[16] = "World-Class Academy"
      L23_2[17] = "Legendary Academy"
      L20_2 = L23_2
      L23_2 = enumsToStringList
      L24_2 = L20_2
      L25_2 = true
      L23_2 = L23_2(L24_2, L25_2)
      L21_2 = L23_2
      L23_2 = createRecord
      L24_2 = L16_2
      L25_2 = "Potential Ability Range"
      L26_2 = vtByte
      L27_2 = "+0"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L17_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Text
      L17_2.Color = L23_2
      L17_2.DropDownReadOnly = true
      L17_2.DropDownDescriptionOnly = true
      L17_2.DisplayAsDropDownListItem = true
      L23_2 = L17_2.DropDownList
      L23_2.Text = L21_2
      L23_2 = createRecord
      L24_2 = L15_2
      L25_2 = "Custom Ranges >"
      L26_2 = vtGrouped
      L27_2 = "+0xA"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L16_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Child4
      L16_2.Color = L23_2
      L16_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L23_2 = createRecord
      L24_2 = L16_2
      L25_2 = "Minimum Potential Ability"
      L26_2 = vtWord
      L27_2 = "+0"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L17_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Text
      L17_2.Color = L23_2
      L23_2 = createRecord
      L24_2 = L16_2
      L25_2 = "Maximum Potential Ability"
      L26_2 = vtWord
      L27_2 = "+0x2"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L17_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Text
      L17_2.Color = L23_2
      L23_2 = createRecord
      L24_2 = L14_2
      L25_2 = "Wonderkid Generator >"
      L26_2 = vtGrouped
      L27_2 = "+0x0E"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L15_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Child3
      L15_2.Color = L23_2
      L15_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L23_2 = {}
      L23_2[0] = "Inactive"
      L23_2[1] = "Active"
      L20_2 = L23_2
      L23_2 = enumsToStringList
      L24_2 = L20_2
      L25_2 = true
      L23_2 = L23_2(L24_2, L25_2)
      L21_2 = L23_2
      L23_2 = createRecord
      L24_2 = L15_2
      L25_2 = "Generate Wonderkid (Based on Potential Ability)"
      L26_2 = vtByte
      L27_2 = "+0"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L16_2 = L23_2
      L16_2.Color = 65535
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L23_2 = L16_2.DropDownList
      L23_2.Text = L21_2
      L23_2 = createRecord
      L24_2 = L15_2
      L25_2 = TrID
      L25_2 = L25_2[900002]
      L26_2 = vtGrouped
      L27_2 = nil
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L16_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.SeparatorSmall
      L16_2.Color = L23_2
      L23_2 = {}
      L23_2[5] = "5%"
      L23_2[10] = "10%"
      L23_2[25] = "25%"
      L23_2[50] = "50%"
      L23_2[75] = "75%"
      L23_2[99] = "99%"
      L20_2 = L23_2
      L23_2 = enumsToStringList
      L24_2 = L20_2
      L25_2 = true
      L23_2 = L23_2(L24_2, L25_2)
      L21_2 = L23_2
      L23_2 = createRecord
      L24_2 = L15_2
      L25_2 = "Wonderkid Chance"
      L26_2 = vtByte
      L27_2 = "+0x1"
      L28_2 = nil
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L16_2 = L23_2
      L23_2 = Color
      L23_2 = L23_2.Text
      L16_2.Color = L23_2
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L23_2 = L16_2.DropDownList
      L23_2.Text = L21_2
      L23_2 = writeByte
      L24_2 = L22_2 + 8
      L25_2 = 1
      L23_2(L24_2, L25_2)
      L23_2 = writeByte
      L24_2 = L22_2 + 9
      L25_2 = 15
      L23_2(L24_2, L25_2)
      L23_2 = writeSmallInteger
      L24_2 = L22_2 + 10
      L25_2 = 150
      L23_2(L24_2, L25_2)
      L23_2 = writeSmallInteger
      L24_2 = L22_2 + 12
      L25_2 = 180
      L23_2(L24_2, L25_2)
      L23_2 = writeByte
      L24_2 = L22_2 + 14
      L25_2 = 1
      L23_2(L24_2, L25_2)
      L23_2 = writeByte
      L24_2 = L22_2 + 15
      L25_2 = 25
      L23_2(L24_2, L25_2)
      L23_2 = writeQword
      L24_2 = 8 * L13_2
      L24_2 = L10_2 + L24_2
      L25_2 = L22_2
      L23_2(L24_2, L25_2)
      L23_2 = writeByte
      L24_2 = L10_2 + 256
      L25_2 = L13_2 + 1
      L23_2(L24_2, L25_2)
      L23_2 = hdeffxoa
      L24_2 = {}
      L24_2.indx = L13_2
      L24_2.mrec = L14_2
      L25_2 = L14_2.getCurrentAddress
      L25_2 = L25_2()
      L24_2.addr = L25_2
      L25_2 = readBytes
      L26_2 = L14_2.getCurrentAddress
      L26_2 = L26_2()
      L27_2 = 16
      L28_2 = true
      L25_2 = L25_2(L26_2, L27_2, L28_2)
      L24_2.data = L25_2
      L23_2[L7_2] = L24_2
      
      function L23_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
        L0_3 = table
        L0_3 = L0_3.removekey
        L1_3 = hdeffxoa
        L2_3 = L7_2
        L0_3(L1_3, L2_3)
        L0_3 = readByte
        L1_3 = L10_2
        L1_3 = L1_3 + 256
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L1_3 = L12_2.count
          L1_3 = L1_3 - 2
          if L0_3 <= L1_3 then
            L1_3 = readBytes
            L2_3 = L14_2.getCurrentAddress
            L2_3 = L2_3()
            L2_3 = L2_3 + 16
            L3_3 = L13_2
            L3_3 = 32 - L3_3
            L3_3 = L3_3 + 1
            L3_3 = L3_3 * 16
            L4_3 = true
            L1_3 = L1_3(L2_3, L3_3, L4_3)
            L2_3 = writeBytes
            L3_3 = L14_2.getCurrentAddress
            L3_3 = L3_3()
            L4_3 = L1_3
            L2_3(L3_3, L4_3)
            L2_3 = pairs
            L3_3 = hdeffxoa
            L2_3, L3_3, L4_3 = L2_3(L3_3)
            for L5_3, L6_3 in L2_3, L3_3, L4_3 do
              L7_3 = L13_2
              L8_3 = L6_3.indx
              if L7_3 <= L8_3 then
                L7_3 = hdeffxoa
                L7_3 = L7_3[L5_3]
                L8_3 = L6_3.indx
                L8_3 = L8_3 - 1
                L7_3.indx = L8_3
                L7_3 = hdeffxoa
                L7_3 = L7_3[L5_3]
                L8_3 = L11_2
                L9_3 = hdeffxoa
                L9_3 = L9_3[L5_3]
                L9_3 = L9_3.indx
                L9_3 = 16 * L9_3
                L8_3 = L8_3 + L9_3
                L7_3.addr = L8_3
                L7_3 = hdeffxoa
                L7_3 = L7_3[L5_3]
                L8_3 = readBytes
                L9_3 = hdeffxoa
                L9_3 = L9_3[L5_3]
                L9_3 = L9_3.addr
                L10_3 = 16
                L11_3 = true
                L8_3 = L8_3(L9_3, L10_3, L11_3)
                L7_3.data = L8_3
                L7_3 = hdeffxoa
                L7_3 = L7_3[L5_3]
                L7_3 = L7_3.mrec
                L8_3 = hdeffxoa
                L8_3 = L8_3[L5_3]
                L8_3 = L8_3.addr
                L7_3.Address = L8_3
              end
            end
          end
          L0_3 = L0_3 - 1
          L1_3 = writeByte
          L2_3 = L10_2
          L2_3 = L2_3 + 256
          L3_3 = L0_3
          L1_3(L2_3, L3_3)
          L1_3 = writeQword
          L2_3 = L10_2
          L3_3 = L0_3 * 8
          L2_3 = L2_3 + L3_3
          L3_3 = 0
          L1_3(L2_3, L3_3)
        end
      end
      
      L14_2.OnDestroy = L23_2
    else
      L23_2 = hdeffxoa
      L23_2 = L23_2[L7_2]
      L24_2 = L19_2 - 4
      L23_2.indx = L24_2
      L23_2 = hdeffxoa
      L23_2 = L23_2[L7_2]
      L24_2 = L19_2 - 4
      L24_2 = L24_2 * 16
      L24_2 = L11_2 + L24_2
      L23_2.addr = L24_2
      L23_2 = hdeffxoa
      L23_2 = L23_2[L7_2]
      L24_2 = readBytes
      L25_2 = hdeffxoa
      L25_2 = L25_2[L7_2]
      L25_2 = L25_2.addr
      L26_2 = 16
      L27_2 = true
      L24_2 = L24_2(L25_2, L26_2, L27_2)
      L23_2.data = L24_2
      L23_2 = hdeffxoa
      L23_2 = L23_2[L7_2]
      L23_2 = L23_2.mrec
      L24_2 = hdeffxoa
      L24_2 = L24_2[L7_2]
      L24_2 = L24_2.addr
      L23_2.Address = L24_2
    end
  end
end

function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = readCSV
  L3_2 = loadCSV
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L3_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  if L2_2 == nil then
    return
  end
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L2_2[L6_2]
    L8_2 = L8_2[1]
    L9_2 = L2_2[L6_2]
    L9_2 = L9_2[3]
    L10_2 = L2_2[L6_2]
    L10_2 = L10_2[4]
    L11_2 = L19_1
    L12_2 = nil
    L13_2 = nil
    L14_2 = L8_2
    L15_2 = tonumber
    L16_2 = L10_2
    L15_2 = L15_2(L16_2)
    L16_2 = tonumber
    L17_2 = L9_2
    L16_2, L17_2 = L16_2(L17_2)
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L11_2 = findRecord
    L12_2 = L1_2
    L13_2 = L8_2
    L11_2, L12_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L13_2 = L11_2.getCurrentAddress
      L13_2 = L13_2()
      if L13_2 == nil or L13_2 == 0 then
        return
      end
      L14_2 = writeByte
      L15_2 = L13_2 + 0
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[2]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 1
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[3]
      L14_2(L15_2, L16_2)
      L14_2 = writeInteger
      L15_2 = L13_2 + 2
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[4]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 6
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[5]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 7
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[6]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 8
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[7]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 9
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[8]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 10
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[9]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 12
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[10]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 14
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[11]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 15
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[12]
      L14_2(L15_2, L16_2)
    end
  end
end

L21_1 = getAddressList
L21_1 = L21_1()
L21_1 = L21_1.getMemoryRecordByID
L22_1 = 24006
L21_1 = L21_1(L22_1)
if L21_1 ~= nil then
  function L22_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2
    
    L3_2 = createStringList
    L3_2 = L3_2()
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[294178]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[294179]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[229389]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[229390]
    L4_2(L5_2)
    L4_2 = searchDatabaseForm
    L5_2 = L19_1
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  
  L21_1.OnActivate = L22_1
end
L22_1 = getAddressList
L22_1 = L22_1()
L22_1 = L22_1.getMemoryRecordByID
L23_1 = 24503
L22_1 = L22_1(L23_1)
if L22_1 ~= nil then
  function L23_1(A0_2, A1_2, A2_2)
    local L3_2
    
    L3_2 = false
    return L3_2
  end
  
  L22_1.OnActivate = L23_1
end
L23_1 = getAddressList
L23_1 = L23_1()
L23_1 = L23_1.getMemoryRecordByID
L24_1 = 24503
L23_1 = L23_1(L24_1)
if L23_1 ~= nil then
  function L24_1(A0_2, A1_2, A2_2)
    local L3_2
    
    L3_2 = false
    return L3_2
  end
  
  L23_1.OnActivate = L24_1
end
duxsqxkd = L19_1

function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.getCurrentAddress
  L1_2 = L1_2()
  if L1_2 == nil or L1_2 == 0 then
    return
  end
  L2_2 = {}
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = A0_2.Description
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 0
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 1
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readInteger
  L6_2 = L1_2 + 2
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 6
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 7
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 8
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 9
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 10
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 12
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readSmallInteger
  L6_2 = L1_2 + 14
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 16
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = readByte
  L6_2 = L1_2 + 17
  L5_2, L6_2 = L5_2(L6_2)
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = table
  L3_2 = L3_2.concat
  L4_2 = L2_2
  L5_2 = ","
  return L3_2(L4_2, L5_2)
end

function L25_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = L1_2.getCurrentAddress
  L2_2 = L2_2()
  if L2_2 == nil or L2_2 == 0 then
    return
  end
  L3_2 = createStringlist
  L3_2 = L3_2()
  L4_2 = L3_2.add
  L5_2 = "itemName,isActive,itemType,uid,pos,posFam,useFitnessMod,morale,condition,sharpness,fatigue,useAttrMod,attrBoost"
  L4_2(L5_2)
  L4_2 = L3_2.add
  L5_2 = L24_1
  L6_2 = L1_2
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = string
  L4_2 = L4_2.format
  L5_2 = "OMAM - %s - %s"
  L6_2 = string
  L6_2 = L6_2.gsub
  L7_2 = L1_2.Description
  L8_2 = ": "
  L9_2 = ""
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = os
  L7_2 = L7_2.time
  L7_2, L8_2, L9_2 = L7_2()
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L5_2 = saveCSV
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
end

function L26_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = createStringlist
  L2_2 = L2_2()
  L3_2 = L2_2.add
  L4_2 = "itemName,isActive,itemType,uid,pos,posFam,useFitnessMod,morale,condition,sharpness,fatigue,useAttrMod,attrBoost"
  L3_2(L4_2)
  L3_2 = L1_2.Count
  if 4 < L3_2 then
    L3_2 = 5
    L4_2 = L1_2.Count
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = L2_2.add
      L8_2 = L24_1
      L9_2 = L1_2.Child
      L10_2 = L6_2 - 1
      L9_2 = L9_2[L10_2]
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      L7_2(L8_2, L9_2, L10_2)
    end
  end
  L3_2 = string
  L3_2 = L3_2.format
  L4_2 = "OMAM - All Items - %s"
  L5_2 = os
  L5_2 = L5_2.time
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2()
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = saveCSV
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2(L5_2, L6_2)
end

function L27_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L5_2 = nil
  L6_2 = nil
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  if A0_2 then
    L10_2 = A0_2.Control
    L10_2 = L10_2[0]
    L10_2 = L10_2.Control
    L5_2 = L10_2[2]
    if L5_2 == nil then
      return
    end
    L6_2 = L5_2.ItemIndex
    if L6_2 == -1 then
      return
    end
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L7_2 = L10_2.name
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L8_2 = L10_2.id
    L10_2 = L5_2.ItemIndex
    L10_2 = A1_2[L10_2]
    L9_2 = L10_2.type
  else
    L7_2 = A2_2
    L8_2 = A3_2
    L9_2 = A4_2
  end
  L10_2 = getAddressSafe
  L11_2 = "ipizednt"
  L10_2 = L10_2(L11_2)
  if L10_2 == nil then
    return
  end
  L11_2 = getAddressSafe
  L12_2 = L10_2 + 257
  L11_2 = L11_2(L12_2)
  if L11_2 == nil then
    return
  end
  L12_2 = getAddressList
  L12_2 = L12_2()
  L12_2 = L12_2.getMemoryRecordByID
  L13_2 = 24079
  L12_2 = L12_2(L13_2)
  if L12_2 ~= nil then
    L13_2 = L12_2.count
    L13_2 = L13_2 - 4
    if L13_2 == 32 then
      L14_2 = messageDialog
      L15_2 = [[
The maximum number of items has been reached!

Please remove some items.]]
      L16_2 = 0
      L14_2(L15_2, L16_2)
      return
    end
    L14_2 = nil
    L15_2 = nil
    L16_2 = nil
    L17_2 = nil
    L18_2 = nil
    L19_2 = nil
    L20_2 = nil
    L21_2 = findRecord
    L22_2 = L12_2
    L23_2 = L7_2
    L21_2, L22_2 = L21_2(L22_2, L23_2)
    L18_2 = L22_2
    L14_2 = L21_2
    L21_2 = getAddressSafe
    L22_2 = 18 * L13_2
    L22_2 = L11_2 + L22_2
    L21_2 = L21_2(L22_2)
    if not L14_2 then
      L22_2 = createRecord
      L23_2 = L12_2
      L24_2 = L7_2
      L25_2 = vtGrouped
      L26_2 = 18 * L13_2
      L26_2 = L11_2 + L26_2
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L14_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Child3
      L14_2.Color = L22_2
      L14_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L14_2.DontSave = true
      L22_2 = createRecord
      L23_2 = L14_2
      L24_2 = "Export Item"
      L25_2 = vtGrouped
      L26_2 = nil
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L15_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L15_2.Color = L22_2
      
      function L22_2(A0_3, A1_3, A2_3)
        local L3_3, L4_3
        L3_3 = L25_1
        L4_3 = A0_3
        L3_3(L4_3)
        L3_3 = false
        return L3_3
      end
      
      L15_2.OnActivate = L22_2
      L22_2 = createRecord
      L23_2 = L14_2
      L24_2 = TrID
      L24_2 = L24_2[900002]
      L25_2 = vtGrouped
      L26_2 = nil
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L15_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.SeparatorSmall
      L15_2.Color = L22_2
      L22_2 = createRecord
      L23_2 = L14_2
      L24_2 = "Is Active ?"
      L25_2 = vtByte
      L26_2 = "+0"
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L15_2 = L22_2
      L15_2.Color = 65535
      L15_2.DropDownReadOnly = true
      L15_2.DropDownDescriptionOnly = true
      L15_2.DisplayAsDropDownListItem = true
      L22_2 = L15_2.DropDownList
      L23_2 = typeOptionStringMaps
      L23_2 = L23_2.binaryOptionType
      L22_2.Text = L23_2
      L15_2.Value = 1
      L22_2 = {}
      L23_2 = TrID
      L23_2 = L23_2[229390]
      L22_2[9] = L23_2
      L23_2 = TrID
      L23_2 = L23_2[294181]
      L22_2[24] = L23_2
      L23_2 = TrID
      L23_2 = L23_2[294180]
      L22_2[1] = L23_2
      L19_2 = L22_2
      L22_2 = enumsToStringList
      L23_2 = L19_2
      L24_2 = true
      L22_2 = L22_2(L23_2, L24_2)
      L20_2 = L22_2
      L22_2 = createRecord
      L23_2 = L14_2
      L24_2 = "Item Type"
      L25_2 = vtByte
      L26_2 = "+0x1"
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L15_2 = L22_2
      L15_2.Color = 65535
      L15_2.DropDownReadOnly = true
      L15_2.DropDownDescriptionOnly = true
      L15_2.DisplayAsDropDownListItem = true
      L22_2 = L15_2.DropDownList
      L22_2.Text = L20_2
      L15_2.Value = L9_2
      L22_2 = createRecord
      L23_2 = L14_2
      L24_2 = "Unique ID"
      L25_2 = vtDword
      L26_2 = "+0x2"
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L15_2 = L22_2
      L15_2.Color = 65535
      L15_2.Value = L8_2
      L22_2 = dependencies
      L23_2 = {}
      L24_2 = 9
      L25_2 = 24
      L23_2[1] = L24_2
      L23_2[2] = L25_2
      L24_2 = L9_2
      L22_2 = L22_2(L23_2, L24_2)
      if L22_2 then
        L22_2 = createRecord
        L23_2 = L14_2
        L24_2 = TrID
        L24_2 = L24_2[900002]
        L25_2 = vtGrouped
        L26_2 = nil
        L27_2 = nil
        L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
        L15_2 = L22_2
        L22_2 = Color
        L22_2 = L22_2.SeparatorSmall
        L15_2.Color = L22_2
        L22_2 = {}
        L22_2[0] = "All Roles"
        L22_2[1] = "Defending Roles (GK/DC)"
        L22_2[2] = "Midfield Roles (DM/M/AM C)"
        L22_2[3] = "Flank Roles (D/WB/M/AM RL)"
        L22_2[4] = "Attacking Roles (ST)"
        L19_2 = L22_2
        L22_2 = enumsToStringList
        L23_2 = L19_2
        L24_2 = true
        L22_2 = L22_2(L23_2, L24_2)
        L20_2 = L22_2
        L22_2 = createRecord
        L23_2 = L14_2
        L24_2 = "Player Position Filter"
        L25_2 = vtByte
        L26_2 = "+0x6"
        L27_2 = nil
        L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
        L15_2 = L22_2
        L22_2 = Color
        L22_2 = L22_2.ReadMe
        L15_2.Color = L22_2
        L15_2.DropDownReadOnly = true
        L15_2.DropDownDescriptionOnly = true
        L15_2.DisplayAsDropDownListItem = true
        L22_2 = L15_2.DropDownList
        L22_2.Text = L20_2
        L15_2.Value = 0
        L22_2 = {}
        L22_2[18] = "Natural"
        L22_2[15] = "Accomplished"
        L22_2[12] = "Competent"
        L19_2 = L22_2
        L22_2 = enumsToStringList
        L23_2 = L19_2
        L24_2 = true
        L22_2 = L22_2(L23_2, L24_2)
        L20_2 = L22_2
        L22_2 = createRecord
        L23_2 = L14_2
        L24_2 = "Player Position's Familiarity Filter"
        L25_2 = vtByte
        L26_2 = "+0x7"
        L27_2 = nil
        L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
        L15_2 = L22_2
        L22_2 = Color
        L22_2 = L22_2.ReadMe
        L15_2.Color = L22_2
        L15_2.DropDownReadOnly = true
        L15_2.DropDownDescriptionOnly = true
        L15_2.DisplayAsDropDownListItem = true
        L22_2 = L15_2.DropDownList
        L22_2.Text = L20_2
        L15_2.Value = 18
      end
      L22_2 = createRecord
      L23_2 = L14_2
      L24_2 = TrID
      L24_2 = L24_2[900002]
      L25_2 = vtGrouped
      L26_2 = nil
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L15_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.SeparatorSmall
      L15_2.Color = L22_2
      L22_2 = createRecord
      L23_2 = L14_2
      L24_2 = "Fitness & Morale Modifier >"
      L25_2 = vtGrouped
      L26_2 = "+0x8"
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L15_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Child4
      L15_2.Color = L22_2
      L15_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L22_2 = createRecord
      L23_2 = L15_2
      L24_2 = "Keep Player Match Fit and Prevent Fitness Drop (Low Injury Risk)"
      L25_2 = vtByte
      L26_2 = "+0"
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L16_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L16_2.Color = L22_2
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L22_2 = L16_2.DropDownList
      L23_2 = typeOptionStringMaps
      L23_2 = L23_2.binaryOptionType
      L22_2.Text = L23_2
      
      function L22_2(A0_3, A1_3, A2_3)
        local L3_3, L4_3, L5_3, L6_3
        L3_3 = getAddressSafe
        L4_3 = A0_3.getCurrentAddress
        L4_3, L5_3, L6_3 = L4_3()
        L3_3 = L3_3(L4_3, L5_3, L6_3)
        L4_3 = tonumber
        L5_3 = A2_3
        L4_3 = L4_3(L5_3)
        if L4_3 == 1 then
          L4_3 = writeByte
          L5_3 = L3_3 + 1
          L6_3 = 0
          L4_3(L5_3, L6_3)
        end
      end
      
      L16_2.OnValueChangedByUser = L22_2
      L22_2 = createRecord
      L23_2 = L15_2
      L24_2 = "Force Player to Low Condition (High Injury Risk)"
      L25_2 = vtByte
      L26_2 = "+1"
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L16_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L16_2.Color = L22_2
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L22_2 = L16_2.DropDownList
      L23_2 = typeOptionStringMaps
      L23_2 = L23_2.binaryOptionType
      L22_2.Text = L23_2
      
      function L22_2(A0_3, A1_3, A2_3)
        local L3_3, L4_3, L5_3, L6_3
        L3_3 = getAddressSafe
        L4_3 = A0_3.getCurrentAddress
        L4_3, L5_3, L6_3 = L4_3()
        L3_3 = L3_3(L4_3, L5_3, L6_3)
        L4_3 = tonumber
        L5_3 = A2_3
        L4_3 = L4_3(L5_3)
        if L4_3 == 1 then
          L4_3 = writeByte
          L5_3 = L3_3 - 1
          L6_3 = 0
          L4_3(L5_3, L6_3)
        end
      end
      
      L16_2.OnValueChangedByUser = L22_2
      L22_2 = createRecord
      L23_2 = L14_2
      L24_2 = "Attributes Modifier >"
      L25_2 = vtGrouped
      L26_2 = "+0x10"
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L15_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Child4
      L15_2.Color = L22_2
      L15_2.options = "[moHideChildren,moDeactivateChildrenAsWell]"
      L22_2 = createRecord
      L23_2 = L15_2
      L24_2 = "Use Attributes Modifier"
      L25_2 = vtByte
      L26_2 = "+0"
      L27_2 = nil
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
      L16_2 = L22_2
      L16_2.Color = 65535
      L16_2.DropDownReadOnly = true
      L16_2.DropDownDescriptionOnly = true
      L16_2.DisplayAsDropDownListItem = true
      L22_2 = L16_2.DropDownList
      L23_2 = typeOptionStringMaps
      L23_2 = L23_2.binaryOptionType
      L22_2.Text = L23_2
      L22_2 = createRecord
      L23_2 = L15_2
      L24_2 = "Set the Player's All Attributes value to"
      L25_2 = vtCustom
      L26_2 = "+0x1"
      L27_2 = nil
      L28_2 = "FM Attribute"
      L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      L16_2 = L22_2
      L22_2 = Color
      L22_2 = L22_2.Text
      L16_2.Color = L22_2
      L22_2 = writeQword
      L23_2 = 8 * L13_2
      L23_2 = L10_2 + L23_2
      L24_2 = L21_2
      L22_2(L23_2, L24_2)
      L22_2 = writeByte
      L23_2 = L10_2 + 256
      L24_2 = L13_2 + 1
      L22_2(L23_2, L24_2)
      L22_2 = ipizednt
      L23_2 = {}
      L23_2.indx = L13_2
      L23_2.mrec = L14_2
      L24_2 = L14_2.getCurrentAddress
      L24_2 = L24_2()
      L23_2.addr = L24_2
      L24_2 = readBytes
      L25_2 = L14_2.getCurrentAddress
      L25_2 = L25_2()
      L26_2 = 18
      L27_2 = true
      L24_2 = L24_2(L25_2, L26_2, L27_2)
      L23_2.data = L24_2
      L22_2[L7_2] = L23_2
      
      function L22_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
        L0_3 = table
        L0_3 = L0_3.removekey
        L1_3 = ipizednt
        L2_3 = L7_2
        L0_3(L1_3, L2_3)
        L0_3 = readByte
        L1_3 = L10_2
        L1_3 = L1_3 + 256
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L1_3 = L12_2.count
          L1_3 = L1_3 - 2
          if L0_3 <= L1_3 then
            L1_3 = readBytes
            L2_3 = L14_2.getCurrentAddress
            L2_3 = L2_3()
            L2_3 = L2_3 + 18
            L3_3 = L13_2
            L3_3 = 32 - L3_3
            L3_3 = L3_3 + 1
            L3_3 = L3_3 * 18
            L4_3 = true
            L1_3 = L1_3(L2_3, L3_3, L4_3)
            L2_3 = writeBytes
            L3_3 = L14_2.getCurrentAddress
            L3_3 = L3_3()
            L4_3 = L1_3
            L2_3(L3_3, L4_3)
            L2_3 = pairs
            L3_3 = ipizednt
            L2_3, L3_3, L4_3 = L2_3(L3_3)
            for L5_3, L6_3 in L2_3, L3_3, L4_3 do
              L7_3 = L13_2
              L8_3 = L6_3.indx
              if L7_3 <= L8_3 then
                L7_3 = ipizednt
                L7_3 = L7_3[L5_3]
                L8_3 = L6_3.indx
                L8_3 = L8_3 - 1
                L7_3.indx = L8_3
                L7_3 = ipizednt
                L7_3 = L7_3[L5_3]
                L8_3 = L11_2
                L9_3 = ipizednt
                L9_3 = L9_3[L5_3]
                L9_3 = L9_3.indx
                L9_3 = 18 * L9_3
                L8_3 = L8_3 + L9_3
                L7_3.addr = L8_3
                L7_3 = ipizednt
                L7_3 = L7_3[L5_3]
                L8_3 = readBytes
                L9_3 = ipizednt
                L9_3 = L9_3[L5_3]
                L9_3 = L9_3.addr
                L10_3 = 18
                L11_3 = true
                L8_3 = L8_3(L9_3, L10_3, L11_3)
                L7_3.data = L8_3
                L7_3 = ipizednt
                L7_3 = L7_3[L5_3]
                L7_3 = L7_3.mrec
                L8_3 = ipizednt
                L8_3 = L8_3[L5_3]
                L8_3 = L8_3.addr
                L7_3.Address = L8_3
              end
            end
          end
          L0_3 = L0_3 - 1
          L1_3 = writeByte
          L2_3 = L10_2
          L2_3 = L2_3 + 256
          L3_3 = L0_3
          L1_3(L2_3, L3_3)
          L1_3 = writeQword
          L2_3 = L10_2
          L3_3 = L0_3 * 8
          L2_3 = L2_3 + L3_3
          L3_3 = 0
          L1_3(L2_3, L3_3)
        end
      end
      
      L14_2.OnDestroy = L22_2
    else
      L22_2 = ipizednt
      L22_2 = L22_2[L7_2]
      L23_2 = L18_2 - 4
      L22_2.indx = L23_2
      L22_2 = ipizednt
      L22_2 = L22_2[L7_2]
      L23_2 = L18_2 - 4
      L23_2 = L23_2 * 18
      L23_2 = L11_2 + L23_2
      L22_2.addr = L23_2
      L22_2 = ipizednt
      L22_2 = L22_2[L7_2]
      L23_2 = readBytes
      L24_2 = ipizednt
      L24_2 = L24_2[L7_2]
      L24_2 = L24_2.addr
      L25_2 = 18
      L26_2 = true
      L23_2 = L23_2(L24_2, L25_2, L26_2)
      L22_2.data = L23_2
      L22_2 = ipizednt
      L22_2 = L22_2[L7_2]
      L22_2 = L22_2.mrec
      L23_2 = ipizednt
      L23_2 = L23_2[L7_2]
      L23_2 = L23_2.addr
      L22_2.Address = L23_2
    end
  end
end

function L28_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A0_2 == nil then
    return
  end
  L1_2 = A0_2.Parent
  if L1_2 == nil then
    return
  end
  L2_2 = readCSV
  L3_2 = loadCSV
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L3_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  if L2_2 == nil then
    return
  end
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L2_2[L6_2]
    L8_2 = L8_2[1]
    L9_2 = L2_2[L6_2]
    L9_2 = L9_2[3]
    L10_2 = L2_2[L6_2]
    L10_2 = L10_2[4]
    L11_2 = L27_1
    L12_2 = nil
    L13_2 = nil
    L14_2 = L8_2
    L15_2 = tonumber
    L16_2 = L10_2
    L15_2 = L15_2(L16_2)
    L16_2 = tonumber
    L17_2 = L9_2
    L16_2, L17_2 = L16_2(L17_2)
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L11_2 = findRecord
    L12_2 = L1_2
    L13_2 = L8_2
    L11_2, L12_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L13_2 = L11_2.getCurrentAddress
      L13_2 = L13_2()
      if L13_2 == nil or L13_2 == 0 then
        return
      end
      L14_2 = writeByte
      L15_2 = L13_2 + 0
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[2]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 1
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[3]
      L14_2(L15_2, L16_2)
      L14_2 = writeInteger
      L15_2 = L13_2 + 2
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[4]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 6
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[5]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 7
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[6]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 8
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[7]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 9
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[8]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 10
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[9]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 12
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[10]
      L14_2(L15_2, L16_2)
      L14_2 = writeSmallInteger
      L15_2 = L13_2 + 14
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[11]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 16
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[12]
      L14_2(L15_2, L16_2)
      L14_2 = writeByte
      L15_2 = L13_2 + 17
      L16_2 = L2_2[L6_2]
      L16_2 = L16_2[13]
      L14_2(L15_2, L16_2)
    end
  end
end

L29_1 = getAddressList
L29_1 = L29_1()
L29_1 = L29_1.getMemoryRecordByID
L30_1 = 24080
L29_1 = L29_1(L30_1)
if L29_1 ~= nil then
  function L30_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2
    
    L3_2 = createStringList
    L3_2 = L3_2()
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[229390]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[294181]
    L4_2(L5_2)
    L4_2 = L3_2.add
    L5_2 = TrID
    L5_2 = L5_2[294180]
    L4_2(L5_2)
    L4_2 = searchDatabaseForm
    L5_2 = L27_1
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  
  L29_1.OnActivate = L30_1
end
L30_1 = getAddressList
L30_1 = L30_1()
L30_1 = L30_1.getMemoryRecordByID
L31_1 = 24360
L30_1 = L30_1(L31_1)
if L30_1 ~= nil then
  function L31_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2
    
    L3_2 = L26_1
    L4_2 = A0_2
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  
  L30_1.OnActivate = L31_1
end
L31_1 = getAddressList
L31_1 = L31_1()
L31_1 = L31_1.getMemoryRecordByID
L32_1 = 24359
L31_1 = L31_1(L32_1)
if L31_1 ~= nil then
  function L32_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2
    
    L3_2 = L28_1
    L4_2 = A0_2
    L3_2(L4_2)
    L3_2 = false
    return L3_2
  end
  
  L31_1.OnActivate = L32_1
end
dedbawiy = L27_1
L32_1 = Comparison
L32_1 = L32_1.LoadPlayer1
L33_1 = loadPlayer1Data
L32_1.OnClick = L33_1
L32_1 = Comparison
L32_1 = L32_1.LoadPlayer2
L33_1 = loadPlayer2Data
L32_1.OnClick = L33_1
L32_1 = Comparison
L32_1 = L32_1.ShowPersonalitiesCheckbox
L33_1 = showPersonalities
L32_1.OnClick = L33_1
L32_1 = Comparison
L32_1 = L32_1.ShowGKCheckbox
L33_1 = showGK
L32_1.OnClick = L33_1
L32_1 = FMCETableForms
return L32_1
