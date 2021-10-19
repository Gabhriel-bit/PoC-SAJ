program Project_SAJ;

uses
  Vcl.Forms,
  uMenu in 'uMenu.pas' {frmMenu},
  uSimulador in 'uSimulador.pas' {frmSimuladores},
  uSimulacoes in 'uSimulacoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
