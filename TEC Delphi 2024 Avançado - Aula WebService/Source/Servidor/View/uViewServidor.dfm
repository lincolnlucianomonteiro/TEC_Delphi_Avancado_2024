object ViewServidor: TViewServidor
  Left = 271
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Web Service - DataSnap'
  ClientHeight = 551
  ClientWidth = 830
  Color = clInactiveCaption
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object pnlStatus: TLabel
    Left = 0
    Top = 0
    Width = 830
    Height = 551
    Align = alClient
    Alignment = taCenter
    AutoSize = False
    Caption = 'Servidor Inativo'
    Color = clTeal
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    ExplicitLeft = 152
    ExplicitTop = 8
    ExplicitWidth = 483
    ExplicitHeight = 86
  end
  object lblPorta: TLabel
    Left = 8
    Top = 40
    Width = 36
    Height = 21
    Caption = 'Porta'
  end
  object edtPorta: TEdit
    Left = 8
    Top = 64
    Width = 121
    Height = 29
    TabOrder = 0
    Text = '8080'
  end
  object ToggleSwitch: TToggleSwitch
    Left = 8
    Top = 11
    Width = 121
    Height = 23
    StateCaptions.CaptionOn = 'Desativar'
    StateCaptions.CaptionOff = 'Ativar'
    TabOrder = 1
    ThumbWidth = 10
    OnClick = ToggleSwitchClick
  end
  object ApplicationEvents: TApplicationEvents
    OnIdle = ApplicationEventsIdle
    Left = 376
    Top = 304
  end
end
