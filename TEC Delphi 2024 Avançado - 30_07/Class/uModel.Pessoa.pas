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
  protected
    function FormatarDocumento : string; virtual; abstract;
    function DadosCompletos : string; virtual; abstract;
  public
    property Nome  : string read fNome  write setNome;
    property Email : string read fEmail write setEmail;
  end;

implementation

procedure TPessoa.setEmail(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'O campo Email é obrigatório.');
  fEmail := Value;
end;

procedure TPessoa.setNome(const Value: string);
begin
  ValidarCampo(Length(Trim(Value)) >= 5, 'O campo Nome é obrigatório.');
  fNome := Value;
end;

end.
