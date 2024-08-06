unit uUsuario;

interface

uses uModel.Validacoes, System.SysUtils;

type
  TUsuario = class(TValidacoes)
  private
    fLogin : string;
    fSenha : string;
    procedure setLogin(const Value: string);
    procedure setSenha(const Value: string);
    function getLoginValido: Boolean;

    class var fInstancia : TUsuario;

    constructor CreateNew(const pNew : Boolean = True); reintroduce;
  public
    constructor Create; reintroduce;

    property Login : string read fLogin write setLogin;
    property Senha : string read fSenha write setSenha;

    property LoginValido : Boolean read getLoginValido;
    procedure CancelarDados;

    class function getInstancia : TUsuario;
    class procedure setFreeInstancia;
  end;

implementation

{ TUsuario }

procedure TUsuario.CancelarDados;
begin
  fLogin := '';
  fSenha := '';
end;

constructor TUsuario.Create;
begin
  // Invalidando o construtor padrão
  raise Exception.Create('Para instanciar esta classe, utilize TUsuario.getInstancia!');
end;

constructor TUsuario.CreateNew(const pNew: Boolean);
begin
  inherited Create;
end;

class function TUsuario.getInstancia: TUsuario;
begin
  if fInstancia = nil then
    fInstancia := TUsuario.CreateNew;

  Result := fInstancia;
end;

function TUsuario.getLoginValido: Boolean;
begin
  Result := (fLogin <> '') and (fSenha <> '');
end;

class procedure TUsuario.setFreeInstancia;
begin
  fInstancia.Free;
end;

procedure TUsuario.setLogin(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'O login do usuário é obrigatório.');

  fLogin := Value.Trim;
end;

procedure TUsuario.setSenha(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'A senha do usuário é obrigatória.');

  fSenha := Value.Trim;
end;

end.
