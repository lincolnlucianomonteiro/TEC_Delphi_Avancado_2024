unit uViewPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uViewBase,

  uManagerForm, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

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
    Listas1: TMenuItem;
    procedure actPOOExecute(Sender: TObject);
  private
    
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.dfm}

procedure TViewPrincipal.actPOOExecute(Sender: TObject);
begin
  TManagerForm.setShowForm('TView' + Copy(TAction(Sender).Name, 4));
end;

end.
