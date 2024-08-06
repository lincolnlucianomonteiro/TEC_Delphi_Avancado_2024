unit uViewLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uViewBase, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons,

  uUsuario;

type
  TViewLogin = class(TViewBase)
    edtUsuario: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnConfirmar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    class var fInstancia : TViewLogin;

    constructor CreateNew(const pNew : Boolean = True); reintroduce;
  public
    constructor Create; reintroduce;

    class function getInstancia : TViewLogin;
    class procedure setFreeInstancia;
  end;

implementation

{$R *.dfm}

{ TViewLogin }

constructor TViewLogin.Create;
begin
  // Invalidando o construtor padrão
  raise Exception.Create('Para instanciar esta classe, utilize TViewLogin.getInstancia!');
end;

constructor TViewLogin.CreateNew(const pNew : Boolean);
begin
  inherited Create(nil);
end;

class function TViewLogin.getInstancia: TViewLogin;
begin
  if fInstancia = nil { nulo } then
    fInstancia := TViewLogin.CreateNew;

  Result := fInstancia;
end;

class procedure TViewLogin.setFreeInstancia;
begin
  FreeAndNil(fInstancia);
end;

procedure TViewLogin.btnConfirmarClick(Sender: TObject);
begin
  Self.ModalResult := mrNone;

  TUsuario.getInstancia.Login := edtUsuario.Text;
  TUsuario.getInstancia.Senha := edtSenha.Text;

  if TUsuario.getInstancia.LoginValido then
    Self.ModalResult := mrOk;
end;

procedure TViewLogin.btnCancelarClick(Sender: TObject);
begin
  TUsuario.getInstancia.CancelarDados;
  Self.ModalResult := mrAbort;
end;

procedure TViewLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

end.
