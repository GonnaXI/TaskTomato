object dlgLogin: TdlgLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #30331#24405
  ClientHeight = 167
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbUserName: TLabel
    Left = 40
    Top = 21
    Width = 36
    Height = 13
    Caption = #29992#25143#21517
  end
  object lbPassword: TLabel
    Left = 40
    Top = 53
    Width = 24
    Height = 13
    Caption = #23494#30721
  end
  object ckSavePassword: TCheckBox
    Left = 40
    Top = 79
    Width = 97
    Height = 17
    Caption = #35760#20303#23494#30721
    TabOrder = 0
  end
  object ckAutoLogin: TCheckBox
    Left = 202
    Top = 79
    Width = 69
    Height = 17
    Caption = #33258#21160#30331#24405
    TabOrder = 1
  end
  object edtUserName: TEdit
    Left = 118
    Top = 18
    Width = 153
    Height = 21
    TabOrder = 2
    TextHint = #35831#36755#20837#29992#25143#21517
    OnKeyPress = edtUserNameKeyPress
  end
  object edtPassword: TEdit
    Left = 118
    Top = 45
    Width = 153
    Height = 21
    PasswordChar = '#'
    TabOrder = 3
    TextHint = #35831#36755#20837#23494#30721
  end
  object btnLogin: TButton
    Left = 40
    Top = 108
    Width = 231
    Height = 30
    Caption = #30331#24405
    TabOrder = 4
  end
end
