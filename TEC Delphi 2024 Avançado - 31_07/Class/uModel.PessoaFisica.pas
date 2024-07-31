unit uModel.PessoaFisica;

interface

uses
  uModel.Pessoa, System.SysUtils, System.MaskUtils, uModel.Constantes,
  uModel.Fornecedor, System.Classes;

type
  TPessoaFisica = class(TPessoa)
  private
    fCPF : string;
    fLista : TStringList;
    procedure setCPF(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    property CPF : string read fCPF write setCPF;
    function FormatarDocumento : string; override;
    function DadosCompletos : string; override;
  end;

implementation

constructor TPessoaFisica.Create;
begin
  fLista := TStringList.Create;
end;

function TPessoaFisica.DadosCompletos: string;
begin
  Result := Format('%s%s%s',[Nome, ' - ', FormatarDocumento]);
end;

destructor TPessoaFisica.Destroy;
begin
  FreeAndNil(fLista);
end;

function TPessoaFisica.FormatarDocumento: string;
begin
  Result := FormatMaskText(C_MascaraCPF, fCPF);
end;

procedure TPessoaFisica.setCPF(const Value: string);
begin
  ValidarCampo(Length(Trim(Value)) = 11, 'O campo CPF é inválido.');
  fCPF := Value;
end;

end.
