unit uSimulacoes;

interface

uses
  Classes, SysUtils, Vcl.ComCtrls, System.Generics.Collections;

type
  parcelas = class
    private
      Fnumero : integer;
      Fjuros : real;
      FamrSaldDev : real;
      Fpagamento : real;
      FsaldoDev : real;
    public
      constructor crieObj();overload;
      constructor crieObj(pNumerp : integer; pJuros, pAmrSalDev, pPagamento, pSalDev: real);overload;
      destructor destrua_se();
      property Numero    : integer read Fnumero     write Fnumero;
      property Juros     : real    read Fjuros      write Fjuros;
      property AmrSalDev : real    read FamrSaldDev write FamrSaldDev;
      property Pagamento : real    read Fpagamento  write Fpagamento;
      property SalDev    : real    read FsaldoDev   write FsaldoDev;
      function Clone: parcelas;
  end;

  simulacoes = class
    private
      Fcapital : real;
      Ftaxa    : real;
      Fmeses   : integer;
      FlistaParcelas : TList<parcelas>;
    public
      constructor crieObj();overload;
      constructor crieObj(pCapital, pTaxa : real; pMeses : integer);overload;
      destructor destrua_se();

      property Capital : real    read Fcapital write Fcapital;
      property Taxa    : real    read Ftaxa    write Ftaxa;
      property Meses   : integer read Fmeses   write Fmeses;
      property ListaParcelas : TList<parcelas> read FlistaParcelas   write FlistaParcelas;

      procedure gerarParcelas();
  end;


implementation

{ parcelas }

constructor parcelas.crieObj(pNumerp: integer; pJuros, pAmrSalDev, pPagamento,
  pSalDev: real);
begin
  Fnumero     := pNumerp;
  Fjuros      := pJuros;
  FamrSaldDev := pAmrSalDev;
  Fpagamento  := pPagamento;
  FsaldoDev   := pSalDev;
end;

constructor parcelas.crieObj;
begin
  Fnumero     := 0;
  Fjuros      := 0;
  FamrSaldDev := 0;
  Fpagamento  := 0;
  FsaldoDev   := 0;
end;

destructor parcelas.destrua_se;
begin
end;

function parcelas.Clone: parcelas;
begin
  result := parcelas.crieObj(Numero, Juros, AmrSalDev, Pagamento, SalDev);
end;

{ simulacoes }

constructor simulacoes.crieObj(pCapital, pTaxa: real; pMeses: integer);
begin
  Fcapital := pCapital;
  Fmeses   := pMeses;
  Ftaxa    := pTaxa;
  FlistaParcelas := TList<parcelas>.Create();
end;

destructor simulacoes.destrua_se;
var
  I: Integer;
begin
  for I := 0 to FlistaParcelas.Count - 1 do
    FlistaParcelas[I].destrua_se();
  FlistaParcelas.Destroy;
end;

procedure simulacoes.gerarParcelas;
Var
  vlParcela    : parcelas;
  i            : integer;
begin
  if ListaParcelas.Count > 0 then
  begin
    ListaParcelas.Destroy;
    ListaParcelas := TList<parcelas>.Create();
  end;

  vlParcela := parcelas.crieObj(0, 0, 0, 0, Capital);
  ListaParcelas.Add(vlParcela);
  ListaParcelas.Count := 1;

  for I := 1 to Meses - 1 do
  begin
    vlParcela := parcelas.crieObj(
      I,
      ListaParcelas[I - 1].SalDev * (Taxa / 100),
      0,
      0,
      ListaParcelas[I - 1].SalDev + (ListaParcelas[I - 1].SalDev * (Taxa / 100))
    );
    ListaParcelas.Add(vlParcela.Clone);
    ListaParcelas.Count := I + 1;
  end;

  vlParcela := parcelas.crieObj(
    Meses,
    ListaParcelas[Meses - 1].SalDev * (Taxa / 100),
    Capital,
    ListaParcelas[Meses - 1].SalDev + ListaParcelas[Meses - 1].SalDev * (Taxa / 100),
    0
  );
  ListaParcelas.Add(vlParcela.Clone);
end;

constructor simulacoes.crieObj;
begin
  Fcapital := 0;
  Fmeses   := 0;
  Ftaxa    := 0;
  FlistaParcelas := TList<parcelas>.Create();
end;

end.
