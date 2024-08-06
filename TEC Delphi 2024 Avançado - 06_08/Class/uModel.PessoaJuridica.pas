unit uModel.PessoaJuridica;

interface

uses
  uModel.Pessoa, System.SysUtils, System.MaskUtils, uModel.Constantes;

type
  TPessoaJuridica = class(TPessoa)
  strict private
    fCNPJ : string;
    procedure setCNPJ(const Value: string);
  protected
    fValor : Boolean;
  public
    property CNPJ : string read fCNPJ write setCNPJ;
    function FormatarDocumento : string; override;
    function DadosCompletos: string; override;
  end;

implementation

function TPessoaJuridica.DadosCompletos: string;
begin
  Result := Format('%s%s%s',[Nome, ' - ', FormatarDocumento]);
end;

function TPessoaJuridica.FormatarDocumento: string;
begin
  Result := FormatMaskText(C_MascaraCNPJ, fCNPJ);
end;

procedure TPessoaJuridica.setCNPJ(const Value: string);
begin
  ValidarCampo(Length(Trim(Value)) = 14, 'O campo CPNJ é inválido.');
  fCNPJ := Value;
end;


end.
