object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SortNumSequence'
  ClientHeight = 579
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object PanelToolBar: TPanel
    Left = 0
    Top = 459
    Width = 521
    Height = 120
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 458
    ExplicitWidth = 517
    object PanelGenerateSeq: TPanel
      Left = 1
      Top = 1
      Width = 180
      Height = 118
      Align = alLeft
      TabOrder = 0
      object LabelLengthSeq: TLabel
        Left = 1
        Top = 1
        Width = 178
        Height = 42
        Align = alTop
        Caption = #1044#1083#1080#1085#1072' '#1087#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitWidth = 150
      end
      object EditLengthSeq: TEdit
        Left = 0
        Top = 43
        Width = 180
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = EditLengthSeqChange
      end
      object BtnGenerateSeq: TButton
        Left = 18
        Top = 85
        Width = 140
        Height = 28
        Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BtnGenerateSeqClick
      end
    end
    object GBToolBarBubbleSort: TGroupBox
      Left = 360
      Top = 1
      Width = 160
      Height = 118
      Align = alRight
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' "'#1055#1091#1079#1099#1088#1100#1082#1086#1084'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 356
      object LabelBSTimeAndProgress: TLabel
        Left = 2
        Top = 91
        Width = 156
        Height = 25
        Align = alBottom
        Caption = #1042#1088#1077#1084#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 59
      end
      object BtnBubbleSortSeq: TButton
        Left = 4
        Top = 45
        Width = 140
        Height = 40
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BtnBubbleSortSeqClick
      end
    end
    object GBToolBarQuickSort: TGroupBox
      Left = 200
      Top = 1
      Width = 160
      Height = 118
      Align = alRight
      Caption = '"'#1041#1099#1089#1090#1088#1072#1103'" '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 196
      object LabelQSTimeAndProgress: TLabel
        Left = 2
        Top = 91
        Width = 156
        Height = 25
        Align = alBottom
        Caption = #1042#1088#1077#1084#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 59
      end
      object BtnQuickSortSeq: TButton
        Left = 3
        Top = 45
        Width = 140
        Height = 40
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        WordWrap = True
        OnClick = BtnQuickSortSeqClick
      end
    end
  end
  object LBSeq1: TListBox
    Left = 0
    Top = 0
    Width = 200
    Height = 459
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 21
    ParentFont = False
    TabOrder = 1
    ExplicitHeight = 458
  end
  object ChartSortProgress: TChart
    Left = 200
    Top = 0
    Width = 321
    Height = 459
    Legend.Visible = False
    Title.Text.Strings = (
      #1069#1083#1077#1084#1077#1085#1090#1099' '#1087#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1080)
    View3D = False
    Align = alClient
    AutoSize = True
    TabOrder = 2
    ExplicitWidth = 317
    ExplicitHeight = 458
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      HoverElement = []
      Marks.Visible = False
      Title = 'SeriesSeq'
      MultiBar = mbNone
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      Data = {
        0006000000000000000000744000000000001870400000000000906F40000000
        000000744000000000000871400000000000A07440}
      Detail = {0000000000}
    end
  end
end
