object frmSimuladores: TfrmSimuladores
  AlignWithMargins = True
  Left = 1
  Top = 1
  Margins.Left = 10
  Margins.Top = 10
  Margins.Right = 10
  Margins.Bottom = 10
  Anchors = [akRight]
  Caption = 'frmSimuladores'
  ClientHeight = 411
  ClientWidth = 784
  Color = clBtnFace
  Constraints.MaxHeight = 450
  Constraints.MaxWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 411
    Align = alClient
    Caption = 'Panel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      784
      411)
    object edt_Juros: TEdit
      Left = 1
      Top = 49
      Width = 782
      Height = 24
      Align = alTop
      TabOrder = 2
      TextHint = 'Taxa de juros (ex: 5%)'
      OnExit = edt_JurosExit
    end
    object edt_Capital: TEdit
      Left = 1
      Top = 1
      Width = 782
      Height = 24
      Align = alTop
      TabOrder = 0
      TextHint = 'Capital'
      OnExit = edt_CapitalExit
      ExplicitLeft = 2
      ExplicitTop = -4
    end
    object edt_Meses: TEdit
      Left = 1
      Top = 25
      Width = 782
      Height = 24
      Align = alTop
      TabOrder = 1
      TextHint = 'Meses'
      OnExit = edt_MesesExit
    end
    object lv_Parcelas: TListView
      Left = 1
      Top = 114
      Width = 782
      Height = 254
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          AutoSize = True
          Caption = 'nula'
          ImageIndex = 1
          MaxWidth = 1
          MinWidth = 1
          Tag = 1
        end
        item
          Alignment = taCenter
          Caption = 'n'
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Juros'
          ImageIndex = 2
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Amortiza'#231#227'o Saldo devedor'
          ImageIndex = 3
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Pagamento'
          ImageIndex = 4
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Saldo devedor'
          ImageIndex = 5
        end>
      GridLines = True
      ReadOnly = True
      TabOrder = 10
      TabStop = False
      ViewStyle = vsReport
    end
    object pn_TiuloParcelas: TPanel
      Left = 1
      Top = 73
      Width = 782
      Height = 41
      Align = alTop
      Caption = 'Sistema de Pagamento '#250'nico'
      Color = clHighlightText
      ParentBackground = False
      TabOrder = 7
    end
    object btn_Sair: TButton
      Left = 521
      Top = 368
      Width = 262
      Height = 43
      Anchors = [akRight, akBottom]
      Caption = 'SAIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btn_SairClick
    end
    object btn_Simular: TButton
      Left = 0
      Top = 368
      Width = 262
      Height = 43
      Anchors = [akLeft, akBottom]
      Caption = 'SIMULAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btn_SimularClick
    end
    object btn_Limpar: TButton
      Left = 261
      Top = 368
      Width = 261
      Height = 43
      Anchors = [akBottom]
      Caption = 'LIMPAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btn_LimparClick
    end
    object pn_InfoJuros: TPanel
      Left = 600
      Top = 50
      Width = 180
      Height = 20
      Anchors = [akTop, akRight]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
    end
    object pn_InfoMeses: TPanel
      Left = 600
      Top = 26
      Width = 180
      Height = 20
      Anchors = [akTop, akRight]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 8
    end
    object pn_InfoCapital: TPanel
      Left = 600
      Top = 3
      Width = 180
      Height = 20
      Anchors = [akTop, akRight]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
    end
  end
end
