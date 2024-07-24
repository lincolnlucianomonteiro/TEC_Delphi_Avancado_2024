unit uModel.Cliente;

interface

uses
  SysUtils, uModel.Validacoes;

type
  TCliente = class(TValidacoes)
  private
    fNome     : string;
    fTelefone : string;
    fEndereco : string;
    procedure setNome(const Value: string);
    procedure setEndereco(const Value: string);
    procedure setTelefone(const Value: string);

    function getEndereco: string;
    function getNome: string;
    function getTelefone: string;
    function getDadosCompletos: string;
  public
    property Nome           : string read getNome     write setNome;
    property Telefone       : string read getTelefone write setTelefone;
    property Endereco       : string read getEndereco write setEndereco;
    property DadosCompletos : string read getDadosCompletos;
  end;

implementation

procedure TCliente.setNome(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'O Nome do cliente é obrigatório.'); // Regra de Negócio
  fNome := Value;
end;

function TCliente.getDadosCompletos : string;
begin
  Result := 'Dados Completos: ' + Nome + ' - ' + Endereco + ' - ' + Telefone
end;

function TCliente.getEndereco: string;
begin
  Result := fEndereco;
end;

function TCliente.getNome: string;
begin
  Result := fNome;
end;

function TCliente.getTelefone: string;
begin
  Result := fTelefone;
end;

procedure TCliente.setEndereco(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'O Endereço do cliente é obrigatório.');
  fEndereco := Value;
end;

procedure TCliente.setTelefone(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'O Telefone do cliente é obrigatório.');
  fTelefone := Value;
end;

end.
