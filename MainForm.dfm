object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SortNumSequence'
  ClientHeight = 570
  ClientWidth = 762
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
    Top = 450
    Width = 762
    Height = 120
    Align = alBottom
    Caption = 'PanelToolBar'
    TabOrder = 0
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
  end
  object PanelLBs: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 450
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 408
    ExplicitTop = 264
    ExplicitWidth = 185
    ExplicitHeight = 41
    object LBSeq1: TListBox
      Left = 1
      Top = 1
      Width = 360
      Height = 448
      Align = alLeft
      ItemHeight = 15
      TabOrder = 0
    end
    object LBSeq2: TListBox
      Left = 401
      Top = 1
      Width = 360
      Height = 448
      Align = alRight
      ItemHeight = 15
      TabOrder = 1
      ExplicitLeft = 640
    end
  end
end