unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uSimulador, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList;

type
  TfrmMenu = class(TForm)
    btn_Simular: TButton;
    btn_FecharJanelas: TButton;
    Panel1: TPanel;
    btn_Sair: TButton;
    procedure btn_SimularClick(Sender: TObject);
    procedure btn_FecharJanelasClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function CriarFrmSimulador(): TfrmSimuladores;
    procedure FecharTodosSimuladores();
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

procedure TfrmMenu.btn_SairClick(Sender: TObject);
begin
  self.FecharTodosSimuladores();
  Close();
end;

procedure TfrmMenu.btn_SimularClick(Sender: TObject);
begin
  self.CriarFrmSimulador();
end;

procedure TfrmMenu.btn_FecharJanelasClick(Sender: TObject);
begin
  self.FecharTodosSimuladores();
end;

function TfrmMenu.CriarFrmSimulador(): TfrmSimuladores;
begin
    result := TfrmSimuladores.Create(self);
    if MDIChildCount > 2 then
      self.ActiveMDIChild.WindowState := wsMinimized;
    self.MDIChildren[self.MDIChildCount - 1].Show;
end;

procedure TfrmMenu.FecharTodosSimuladores();
Var  I : Integer;
begin
  I := MDIChildCount;
  while (I > 0) do
  begin
    I := I -1;
    MDIChildren[I].Close;
  end;
end;

end.
