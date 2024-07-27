unit uView.Principal;

interface

uses
  Manager.Form, u.View.Base, System.Classes, System.Actions,
  Vcl.ActnList, Vcl.Menus, System.SysUtils, Vcl.Controls, Vcl.Forms;

type
  TViewPrincipal = class(TViewBase)
    mnuPrincipal: TMainMenu;
    modCadastros: TMenuItem;
    mnuClientes: TMenuItem;
    ActionList: TActionList;
    actCliente: TAction;
    procedure actClienteExecute(Sender: TObject);
  private

  end;

implementation

{$R *.dfm}

procedure TViewPrincipal.actClienteExecute(Sender: TObject);
begin
  TManagerForm.setShowForm('TView' + Copy(TAction(Sender).Name, 4, string(TAction(Sender).Name).Length));
end;

end.
