unit uViewPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uViewBase,

  uManagerForm, Vcl.StdCtrls, System.Actions, Vcl.ActnList, Vcl.ComCtrls,
  uViewLogin, uModel.Constantes, Vcl.StdActns;

type
  TViewPrincipal = class(TViewBase)
    MainMenu: TMainMenu;
    Sistema1: TMenuItem;
    mnuPOO: TMenuItem;
    mnuPessoa: TMenuItem;
    ActionList: TActionList;
    actPOO: TAction;
    actPessoa: TAction;
    actLista: TAction;
    mnuListas: TMenuItem;
    StatusBar: TStatusBar;
    actLogOff: TAction;
    EfetuarLogOff1: TMenuItem;
    N1: TMenuItem;
    actSair: TFileExit;
    mnuSair: TMenuItem;
    procedure actPOOExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogOffExecute(Sender: TObject);
  private
    
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.actLogOffExecute(Sender: TObject);
begin
  Self.FormCreate(Sender);
end;

procedure TViewPrincipal.actPOOExecute(Sender: TObject);
begin
  TManagerForm.setShowForm('TView' + Copy(TAction(Sender).Name, 4));
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  TViewLogin.getInstancia.ShowModal;

  if not TViewLogin.getInstancia.getLoginValido then
  begin
    TViewLogin.getInstancia.setFreeInstancia;
    Application.Terminate;
    Exit;
  end;

  StatusBar.Panels[0].Text := 'Usuário logado: ' + TViewLogin.getInstancia.edtUsuario.Text;
  StatusBar.Panels[1].Text := 'Data atual: ' + FormatDateTime(C_MascaraData, Now);
end;

procedure TViewPrincipal.FormDestroy(Sender: TObject);
begin
  TViewLogin.getInstancia.setFreeInstancia;
end;

end.
