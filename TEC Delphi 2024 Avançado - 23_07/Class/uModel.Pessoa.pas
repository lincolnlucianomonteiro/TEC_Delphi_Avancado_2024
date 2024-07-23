unit uModel.Pessoa;

interface

uses
  System.SysUtils, uModel.Validacoes;

type
  TPessoa = class(TValidacoes)
  private
    fNome  : string;
    fEmail : string;
    procedure setNome(const Value: string);
    procedure setEmail(const Value: string);
  public
    property Nome  : string read fNome  write setNome;
    property Email : string read fEmail write setEmail;
  end;

  TPessoaFisica = class(TPessoa)
  private
    fCPF : string;
    procedure setCPF(const Value: string);

    //'352.501.310-85'
  public
    property CPF : string read fCPF write setCPF;
  end;

  TPessoaJuridica = class(TPessoa)
  private
    fCNPJ : string;
    //70.901.918/0001-97
    procedure setCNPJ(const Value: string);
  public
    property CNPJ : string read fCNPJ write setCNPJ;
  end;

implementation

procedure TPessoa.setEmail(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'O campo Email é obrigatório.');
  fEmail := Value;
end;

procedure TPessoa.setNome(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'O campo Nome é obrigatório.');
  fNome := Value;
end;

procedure TPessoaFisica.setCPF(const Value: string);
begin
  ValidarCampo(Length(Trim(Value)) = 11, 'O campo CPF é inválido.');
  fCPF := Value;
end;

procedure TPessoaJuridica.setCNPJ(const Value: string);
begin
  ValidarCampo(Length(Trim(Value)) = 14, 'O campo CPNJ é inválido.');
  fCNPJ := Value;
end;

end.
