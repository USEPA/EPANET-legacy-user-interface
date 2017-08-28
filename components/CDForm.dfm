object ChartOptionsForm: TChartOptionsForm
  Left = 410
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Chart Options'
  ClientHeight = 376
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 353
    Height = 313
    ActivePage = XaxisPage
    TabOrder = 0
    object GeneralPage: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 54
        Height = 13
        Caption = 'Panel Color'
      end
      object Label2: TLabel
        Left = 8
        Top = 72
        Width = 85
        Height = 13
        Caption = 'Background Color'
      end
      object Label3: TLabel
        Left = 8
        Top = 112
        Width = 51
        Height = 13
        Caption = 'View in 3D'
      end
      object Label4: TLabel
        Left = 8
        Top = 152
        Width = 85
        Height = 13
        Caption = '3D Effect Percent'
      end
      object Label5: TLabel
        Left = 8
        Top = 200
        Width = 46
        Height = 13
        Caption = 'Main Title'
      end
      object PanelColorBox: TColorBox
        Left = 132
        Top = 16
        Width = 117
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 0
      end
      object BackColorBox: TColorBox
        Left = 132
        Top = 64
        Width = 117
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
      end
      object View3DBox: TCheckBox
        Left = 136
        Top = 104
        Width = 25
        Height = 25
        TabOrder = 2
      end
      object Percent3DBox: TSpinEdit
        Left = 136
        Top = 144
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object GraphTitleBox: TEdit
        Left = 8
        Top = 216
        Width = 263
        Height = 21
        TabOrder = 4
      end
      object GraphTitleFontBtn: TButton
        Left = 280
        Top = 216
        Width = 49
        Height = 25
        Caption = 'Font...'
        TabOrder = 5
        OnClick = GraphTitleFontBtnClick
      end
    end
    object XaxisPage: TTabSheet
      Caption = 'Horizontal Axis'
      ImageIndex = 1
      object Label6: TLabel
        Left = 8
        Top = 24
        Width = 41
        Height = 13
        Caption = 'Minimum'
      end
      object Label7: TLabel
        Left = 8
        Top = 64
        Width = 44
        Height = 13
        Caption = 'Maximum'
      end
      object XIncrementLabel: TLabel
        Left = 8
        Top = 104
        Width = 47
        Height = 13
        Caption = 'Increment'
      end
      object Label11: TLabel
        Left = 8
        Top = 216
        Width = 42
        Height = 13
        Caption = 'Axis Title'
      end
      object XDataMinLabel: TLabel
        Left = 198
        Top = 20
        Width = 73
        Height = 13
        Caption = 'XDataMinLabel'
      end
      object XDataMaxLabel: TLabel
        Left = 198
        Top = 60
        Width = 76
        Height = 13
        Caption = 'XDataMaxLabel'
      end
      object XFormatLabel: TLabel
        Left = 8
        Top = 88
        Width = 32
        Height = 13
        Caption = 'Format'
      end
      object Xmin: TEdit
        Left = 96
        Top = 16
        Width = 87
        Height = 21
        TabOrder = 0
      end
      object Xmax: TEdit
        Left = 96
        Top = 56
        Width = 87
        Height = 21
        TabOrder = 1
      end
      object Xinc: TEdit
        Left = 96
        Top = 96
        Width = 87
        Height = 21
        TabOrder = 2
      end
      object Xauto: TCheckBox
        Left = 8
        Top = 136
        Width = 101
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Auto Scale'
        TabOrder = 4
      end
      object Xtitle: TEdit
        Left = 8
        Top = 232
        Width = 265
        Height = 21
        TabOrder = 6
      end
      object XFontBtn: TButton
        Left = 280
        Top = 232
        Width = 49
        Height = 25
        Caption = 'Font...'
        TabOrder = 7
        OnClick = XFontBtnClick
      end
      object Xgrid: TCheckBox
        Left = 8
        Top = 176
        Width = 101
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Grid Lines'
        TabOrder = 5
      end
      object DateFmtCombo: TComboBox
        Left = 200
        Top = 96
        Width = 105
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
    end
    object YaxisPage: TTabSheet
      Caption = 'Vertical Axis'
      ImageIndex = 2
      object Label9: TLabel
        Left = 8
        Top = 24
        Width = 41
        Height = 13
        Caption = 'Minimum'
      end
      object Label12: TLabel
        Left = 8
        Top = 64
        Width = 44
        Height = 13
        Caption = 'Maximum'
      end
      object Label13: TLabel
        Left = 8
        Top = 104
        Width = 47
        Height = 13
        Caption = 'Increment'
      end
      object Label15: TLabel
        Left = 8
        Top = 216
        Width = 42
        Height = 13
        Caption = 'Axis Title'
      end
      object YDataMinLabel: TLabel
        Left = 198
        Top = 20
        Width = 73
        Height = 13
        Caption = 'YDataMinLabel'
      end
      object YDataMaxLabel: TLabel
        Left = 198
        Top = 60
        Width = 76
        Height = 13
        Caption = 'YDataMaxLabel'
      end
      object Ymin: TEdit
        Left = 96
        Top = 16
        Width = 87
        Height = 21
        TabOrder = 0
      end
      object Ymax: TEdit
        Left = 96
        Top = 56
        Width = 87
        Height = 21
        TabOrder = 1
      end
      object Yinc: TEdit
        Left = 96
        Top = 96
        Width = 87
        Height = 21
        TabOrder = 2
      end
      object Yauto: TCheckBox
        Left = 8
        Top = 136
        Width = 101
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Auto Scale'
        TabOrder = 3
      end
      object Ytitle: TEdit
        Left = 8
        Top = 232
        Width = 265
        Height = 21
        TabOrder = 5
      end
      object YFontBtn: TButton
        Left = 280
        Top = 232
        Width = 49
        Height = 25
        Caption = 'Font...'
        TabOrder = 6
        OnClick = YFontBtnClick
      end
      object Ygrid: TCheckBox
        Left = 8
        Top = 176
        Width = 101
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Grid Lines'
        TabOrder = 4
      end
    end
    object LegendPage: TTabSheet
      Caption = 'Legend'
      ImageIndex = 3
      object Label18: TLabel
        Left = 8
        Top = 40
        Width = 37
        Height = 13
        Caption = 'Position'
      end
      object Label19: TLabel
        Left = 8
        Top = 80
        Width = 24
        Height = 13
        Caption = 'Color'
      end
      object Label20: TLabel
        Left = 8
        Top = 112
        Width = 65
        Height = 13
        Caption = 'Symbol Width'
      end
      object LegendFrameBox: TCheckBox
        Left = 8
        Top = 152
        Width = 121
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Framed'
        TabOrder = 3
      end
      object LegendVisibleBox: TCheckBox
        Left = 8
        Top = 184
        Width = 121
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Visible'
        TabOrder = 4
      end
      object LegendPosBox: TComboBox
        Left = 116
        Top = 32
        Width = 117
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
      end
      object LegendColorBox: TColorBox
        Left = 116
        Top = 72
        Width = 117
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
        ItemHeight = 16
        TabOrder = 1
      end
      object LegendWidthBox: TSpinEdit
        Left = 116
        Top = 112
        Width = 49
        Height = 22
        Increment = 6
        MaxValue = 120
        MinValue = 6
        TabOrder = 2
        Value = 25
      end
    end
    object SeriesPage: TTabSheet
      Caption = 'Series'
      ImageIndex = 4
      object Label21: TLabel
        Left = 8
        Top = 24
        Width = 29
        Height = 13
        Caption = 'Series'
      end
      object Label22: TLabel
        Left = 8
        Top = 64
        Width = 59
        Height = 13
        Caption = 'Legend Title'
      end
      object SeriesListBox: TComboBox
        Left = 96
        Top = 16
        Width = 92
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
        OnClick = SeriesListBoxClick
      end
      object SeriesTitle: TEdit
        Left = 96
        Top = 56
        Width = 177
        Height = 21
        TabOrder = 1
      end
      object LegendFontBtn: TButton
        Left = 280
        Top = 56
        Width = 49
        Height = 25
        Caption = 'Font...'
        TabOrder = 2
        OnClick = LegendFontBtnClick
      end
      object PageControl2: TPageControl
        Left = 48
        Top = 96
        Width = 233
        Height = 185
        ActivePage = LabelsOptionsSheet
        TabOrder = 3
        object LineOptionsSheet: TTabSheet
          Caption = 'Lines'
          object Label23: TLabel
            Left = 16
            Top = 16
            Width = 23
            Height = 13
            Caption = 'Style'
          end
          object Label24: TLabel
            Left = 16
            Top = 56
            Width = 24
            Height = 13
            Caption = 'Color'
          end
          object Label25: TLabel
            Left = 16
            Top = 96
            Width = 20
            Height = 13
            Caption = 'Size'
          end
          object LineStyleBox: TComboBox
            Left = 72
            Top = 11
            Width = 118
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = LineStyleBoxChange
          end
          object LineColorBox: TColorBox
            Left = 72
            Top = 48
            Width = 118
            Height = 22
            Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
            ItemHeight = 16
            TabOrder = 1
          end
          object LineSizeBox: TSpinEdit
            Left = 72
            Top = 88
            Width = 45
            Height = 22
            MaxValue = 10
            MinValue = 1
            TabOrder = 2
            Value = 1
          end
          object LineVisibleBox: TCheckBox
            Left = 16
            Top = 128
            Width = 69
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Visible'
            TabOrder = 3
          end
        end
        object MarkOptionsSheet: TTabSheet
          Caption = 'Markers'
          ImageIndex = 1
          object Label26: TLabel
            Left = 16
            Top = 16
            Width = 23
            Height = 13
            Caption = 'Style'
          end
          object Label27: TLabel
            Left = 16
            Top = 56
            Width = 24
            Height = 13
            Caption = 'Color'
          end
          object Label28: TLabel
            Left = 16
            Top = 96
            Width = 20
            Height = 13
            Caption = 'Size'
          end
          object MarkVisibleBox: TCheckBox
            Left = 16
            Top = 128
            Width = 69
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Visible'
            TabOrder = 0
          end
          object MarkStyleBox: TComboBox
            Left = 72
            Top = 11
            Width = 118
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 1
          end
          object MarkColorBox: TColorBox
            Left = 72
            Top = 48
            Width = 118
            Height = 22
            Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
            ItemHeight = 16
            TabOrder = 2
          end
          object MarkSizeBox: TSpinEdit
            Left = 72
            Top = 88
            Width = 45
            Height = 22
            MaxValue = 10
            MinValue = 1
            TabOrder = 3
            Value = 1
          end
        end
        object AreaOptionsSheet: TTabSheet
          Caption = 'Patterns'
          ImageIndex = 2
          object Label29: TLabel
            Left = 16
            Top = 16
            Width = 23
            Height = 13
            Caption = 'Style'
          end
          object Label30: TLabel
            Left = 16
            Top = 56
            Width = 24
            Height = 13
            Caption = 'Color'
          end
          object Label31: TLabel
            Left = 16
            Top = 96
            Width = 42
            Height = 13
            Caption = 'Stacking'
          end
          object AreaFillStyleBox: TComboBox
            Left = 88
            Top = 11
            Width = 118
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
          end
          object AreaColorBox: TColorBox
            Left = 88
            Top = 48
            Width = 118
            Height = 22
            Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
            ItemHeight = 16
            TabOrder = 1
          end
          object StackStyleBox: TComboBox
            Left = 88
            Top = 88
            Width = 118
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 2
          end
        end
        object PieOptionsSheet: TTabSheet
          Caption = 'Pie Options'
          ImageIndex = 3
          object Label32: TLabel
            Left = 24
            Top = 96
            Width = 70
            Height = 13
            Caption = 'Rotation Angle'
          end
          object PieCircledBox: TCheckBox
            Left = 24
            Top = 24
            Width = 105
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Circular'
            TabOrder = 0
          end
          object PiePatternBox: TCheckBox
            Left = 24
            Top = 56
            Width = 105
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Use Patterns'
            TabOrder = 1
          end
          object PieRotationBox: TSpinEdit
            Left = 116
            Top = 88
            Width = 45
            Height = 22
            Increment = 5
            MaxValue = 360
            MinValue = 0
            TabOrder = 2
            Value = 0
          end
        end
        object LabelsOptionsSheet: TTabSheet
          Caption = 'Labels'
          ImageIndex = 4
          object Label33: TLabel
            Left = 16
            Top = 16
            Width = 23
            Height = 13
            Caption = 'Style'
          end
          object Label34: TLabel
            Left = 16
            Top = 56
            Width = 24
            Height = 13
            Caption = 'Color'
          end
          object LabelsStyleBox: TComboBox
            Left = 88
            Top = 11
            Width = 118
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
          end
          object LabelsBackColorBox: TColorBox
            Left = 88
            Top = 48
            Width = 118
            Height = 22
            Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbPrettyNames]
            ItemHeight = 16
            TabOrder = 1
          end
          object LabelsTransparentBox: TCheckBox
            Left = 16
            Top = 80
            Width = 97
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Transparent'
            TabOrder = 2
          end
          object LabelsArrowsBox: TCheckBox
            Left = 16
            Top = 104
            Width = 97
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Show Arrows'
            TabOrder = 3
          end
          object LabelsVisibleBox: TCheckBox
            Left = 16
            Top = 128
            Width = 97
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Visible'
            TabOrder = 4
          end
        end
      end
    end
  end
  object DefaultBox: TCheckBox
    Left = 8
    Top = 336
    Width = 73
    Height = 17
    Caption = 'Default'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 336
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 336
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object BitBtn3: TBitBtn
    Left = 288
    Top = 336
    Width = 75
    Height = 25
    Caption = '&Help'
    TabOrder = 4
    OnClick = BitBtn3Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333336633
      3333333333333FF3333333330000333333364463333333333333388F33333333
      00003333333E66433333333333338F38F3333333000033333333E66333333333
      33338FF8F3333333000033333333333333333333333338833333333300003333
      3333446333333333333333FF3333333300003333333666433333333333333888
      F333333300003333333E66433333333333338F38F333333300003333333E6664
      3333333333338F38F3333333000033333333E6664333333333338F338F333333
      0000333333333E6664333333333338F338F3333300003333344333E666433333
      333F338F338F3333000033336664333E664333333388F338F338F33300003333
      E66644466643333338F38FFF8338F333000033333E6666666663333338F33888
      3338F3330000333333EE666666333333338FF33333383333000033333333EEEE
      E333333333388FFFFF8333330000333333333333333333333333388888333333
      0000}
    NumGlyphs = 2
  end
  object ColorBox3: TColorBox
    Left = 328
    Top = 376
    Width = 145
    Height = 22
    ItemHeight = 16
    TabOrder = 5
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 72
    Top = 344
  end
end
