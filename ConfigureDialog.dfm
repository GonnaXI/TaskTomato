object Config: TConfig
  Left = 0
  Top = 0
  Caption = #35774#32622
  ClientHeight = 160
  ClientWidth = 245
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblWorkTime: TLabel
    Left = 24
    Top = 40
    Width = 60
    Height = 13
    Caption = #24037#20316#26102#38271#65306
  end
  object lblRestTime: TLabel
    Left = 24
    Top = 72
    Width = 60
    Height = 13
    Caption = #20241#24687#26102#38271#65306
  end
  object edtWorkTime: TEdit
    Left = 90
    Top = 37
    Width = 127
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object edtRestTime: TEdit
    Left = 90
    Top = 69
    Width = 127
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object btnConfirm: TButton
    Left = 32
    Top = 112
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 126
    Top = 112
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
  end
end
