object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 413
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 561
    Top = 8
    Width = 64
    Height = 64
  end
  object RzToolButton1: TRzToolButton
    Left = 17
    Top = 10
    Width = 64
    Height = 64
    GradientColorStyle = gcsSystem
    Images = ImageList1
    UseToolbarButtonSize = False
    UseToolbarVisualStyle = False
    VisualStyle = vsGradient
  end
  object RzTabControl1: TRzTabControl
    Left = 8
    Top = 80
    Width = 619
    Height = 321
    TabOrder = 0
    Tabs = <
      item
        Caption = 'Tab1'
      end
      item
        Caption = 'Tab2'
      end>
    FixedDimension = 19
  end
  object ImageList1: TImageList
    Left = 288
    Top = 24
  end
end
