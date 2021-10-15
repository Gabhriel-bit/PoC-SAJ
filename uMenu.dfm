object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'PoC Sistema de Amortiza'#231#227'o Juros'
  ClientHeight = 454
  ClientWidth = 672
  Color = clMenuBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 161
    Height = 454
    Align = alLeft
    Color = clInactiveCaption
    Enabled = False
    ParentBackground = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 59
    Width = 137
    Height = 49
    Caption = 'FECHAR JANELAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 8
    Top = 11
    Width = 137
    Height = 49
    Caption = 'SIMULAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
end
