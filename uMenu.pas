unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uSimulador, Vcl.ExtCtrls, System.Generics.Collections;

type
  TfrmMenu = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    umaListaForm : TObjectList<TfrmSimuladores>;
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

procedure TfrmMenu.Button1Click(Sender: TObject);
begin
    umaListaForm.Add(TfrmSimuladores.Create(self));
    umaListaForm[umaListaForm.Count - 1].Show();
end;

procedure TfrmMenu.Button2Click(Sender: TObject);
begin
  while (umaListaForm.Count > 0) do
  begin
    umaListaForm[umaListaForm.Count-1].Close;
    umaListaForm.Delete(umaListaForm.Count-1);
  end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  umaListaForm := TObjectList<TfrmSimuladores>.Create();
end;

end.
