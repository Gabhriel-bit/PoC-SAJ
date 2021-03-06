unit uSimulador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uSimulacoes,
  Vcl.ExtCtrls, Vcl.Menus, System.Generics.Collections;

type
  TfrmSimuladores = class(TForm)
    Panel1: TPanel;
    edt_Capital: TEdit;
    edt_Juros: TEdit;
    edt_Meses: TEdit;
    lv_Parcelas: TListView;
    pn_TiuloParcelas: TPanel;
    btn_Sair: TButton;
    btn_Simular: TButton;
    btn_Limpar: TButton;
    pn_InfoJuros: TPanel;
    pn_InfoMeses: TPanel;
    pn_InfoCapital: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
    procedure edt_JurosExit(Sender: TObject);
    procedure edt_MesesExit(Sender: TObject);
    procedure btn_SimularClick(Sender: TObject);
    procedure edt_CapitalExit(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
  private
    { Private declarations }
    umaSimulacao : simulacoes;
    procedure gerarListView();
  protected
    procedure ParcelaToItem(pParcela : parcelas);
  public
    { Public declarations }
  end;

var
  frmSimuladores: TfrmSimuladores;

implementation

{$R *.dfm}

procedure TfrmSimuladores.btn_LimparClick(Sender: TObject);
begin
  edt_Capital.Clear;
  edt_Meses.Clear;
  edt_Juros.Clear;
  lv_Parcelas.Items.Clear;
  edt_Capital.SetFocus;
  pn_InfoJuros.Caption := '';
  pn_InfoMeses.Caption := '';
  pn_InfoCapital.Caption := '';
  umaSimulacao.destrua_se();
  umaSimulacao := simulacoes.crieObj();
end;

procedure TfrmSimuladores.btn_SairClick(Sender: TObject);
begin
  Close();
end;

procedure TfrmSimuladores.btn_SimularClick(Sender: TObject);
begin
  if (edt_Capital.Text = '') OR (pn_InfoCapital.Caption <> '') then
    edt_Capital.SetFocus
  else if (edt_Meses.Text = '') OR (pn_InfoMeses.Caption <> '') then
   edt_Meses.SetFocus
  else if (edt_Juros.Text = '') OR (pn_InfoJuros.Caption <> '') then
    edt_Juros.SetFocus
  else
  begin
   umaSimulacao.Capital := StrToFloat(StringReplace(edt_Capital.Text, '.', '', []));
   umaSimulacao.Taxa    := StrToFloat(
                              StringReplace(StringReplace(edt_Juros.Text, '.', '', []),
                                            '%', '', []));
   umaSimulacao.Meses   := StrToInt(edt_Meses.Text);
   umaSimulacao.gerarParcelas;
   self.gerarListView;
  end
end;

procedure TfrmSimuladores.edt_CapitalExit(Sender: TObject);
var
  vlCapital : double;
begin
  if not TryStrToFloat(StringReplace(edt_Capital.Text, '.', '', []), vlCapital) then
    pn_InfoCapital.Caption := ('O valor inv?lido!')
  else
    if vlCapital <= 0 then
      pn_InfoCapital.Caption := ('O valor inv?lido!')
    else
    begin
      pn_InfoCapital.Caption := '';
      edt_capital.Text := FormatFloat('#,##0.00', vlCapital);
    end;
end;

procedure TfrmSimuladores.edt_JurosExit(Sender: TObject);
var
  vlTaxa : double;
begin
  if not TryStrToFloat(StringReplace(StringReplace(edt_Juros.Text, '.', '', []), '%', '', []), vlTaxa) then
    pn_InfoJuros.Caption := ('O valor inv?lido!')
  else
    if vlTaxa <= 0 then 
      pn_InfoJuros.Caption := ('O valor inv?lido!')
    else
    begin
      pn_InfoJuros.Caption := '';
      edt_Juros.Text := FormatFloat('#,##0.00', vlTaxa);
    end;
end;

procedure TfrmSimuladores.edt_MesesExit(Sender: TObject);
var
  vlMeses : integer;
begin
  if not TryStrToInt(self.edt_Meses.Text, vlMeses) then
    pn_InfoMeses.Caption := ('O valor inv?lido!')
  else
    if (vlMeses <= 0) then
      pn_InfoMeses.Caption := ('O valor inv?lido!')
    else
      pn_InfoMeses.Caption := '';    
end;

procedure TfrmSimuladores.FormActivate(Sender: TObject);
begin
  umaSimulacao := simulacoes.crieObj();
end;

procedure TfrmSimuladores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  Release;
  frmSimuladores := nil;
end;

procedure TfrmSimuladores.gerarListView;
Var
  i : integer;
  vlItem : TListItem;
  vlJurosTotal : real;
begin
  lv_Parcelas.Items.Clear;
  vlJurosTotal := 0;
  for I := 0 to umaSimulacao.ListaParcelas.Count - 1 do
  begin
    vlJurosTotal := vlJurosTotal + umaSimulacao.ListaParcelas[I].Juros;
    ParcelaToItem(umaSimulacao.ListaParcelas[I])
  end;
  vlItem := lv_Parcelas.Items.Add;
  vlItem.Caption := '';
  vlItem.SubItems.Add('Totais');
  vlItem.SubItems.Add(FormatFloat('#,##0.00', vlJurosTotal));
  vlItem.SubItems.Add(FormatFloat('#,##0.00', umaSimulacao.Capital));
  vlItem.SubItems.Add(FormatFloat('#,##0.00', umaSimulacao.Capital + vlJurosTotal));
  vlItem.SubItems.Add('');
end;

procedure TfrmSimuladores.ParcelaToItem(pParcela: parcelas);
var vlItem : TListItem;
begin
   vlItem := lv_Parcelas.Items.Add;
   vlItem.Caption := '';
   vlItem.SubItems.Add(IntToStr(pParcela.Numero));
   vlItem.SubItems.Add(FormatFloat('#,##0.00', pParcela.Juros));
   if (pParcela.AmrSalDev = 0) AND (pParcela.Numero <> 0) then
    vlItem.SubItems.Add('')
   else
    vlItem.SubItems.Add(FormatFloat('#,##0.00', pParcela.AmrSalDev));
   if (pParcela.Pagamento = 0) AND (pParcela.Numero <> 0) then
    vlItem.SubItems.Add('')
   else
    vlItem.SubItems.Add(FormatFloat('#,##0.00', pParcela.Pagamento));
   vlItem.SubItems.Add(FormatFloat('#,##0.00', pParcela.SalDev));
end;

end.
