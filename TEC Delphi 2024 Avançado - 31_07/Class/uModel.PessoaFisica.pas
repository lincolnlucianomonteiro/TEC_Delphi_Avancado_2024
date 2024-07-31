unit uModel.PessoaFisica;

interface

uses
  uModel.Pessoa, System.SysUtils, System.MaskUtils, uModel.Constantes,
  uModel.Fornecedor, System.Classes;

type
  TPessoaFisica = class(TPessoa)
  private
    fCPF : string;
    procedure setCPF(const Value: string);
  public
    property CPF : string read fCPF write setCPF;
    function FormatarDocumento : string; override;
    function DadosCompletos : string; override;
  end;

implementation

function TPessoaFisica.DadosCompletos: string;
begin
  Result := Format('%s%s%s',[Nome, ' - ', FormatarDocumento]);
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
