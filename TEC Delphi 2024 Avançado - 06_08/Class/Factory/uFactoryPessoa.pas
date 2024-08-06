unit uFactoryPessoa;

interface

uses
  uFactoryPessoaFisica,
  uFactoryPessoaJuridica;

type
  TFactoryPessoa = class // AbstractFactory para fábrica de pessoa
  private
    fFactoryPessoaFisica   : TFactoryPessoaFisica;
    fFactoryPessoaJuridica : TFactoryPessoaJuridica;

    function getFactoryPessoaFisica   : TFactoryPessoaFisica;
    function getFactoryPessoaJuridica : TFactoryPessoaJuridica;
  public
    destructor Destroy; override;

    property FactoryPessoaFisica   : TFactoryPessoaFisica   read getFactoryPessoaFisica;
    property FactoryPessoaJuridica : TFactoryPessoaJuridica read getFactoryPessoaJuridica;
  end;

implementation

{ TAbstractFactoryPessoa }

destructor TFactoryPessoa.Destroy;
begin
  fFactoryPessoaJuridica.Free;
  fFactoryPessoaFisica.Free;
end;

function TFactoryPessoa.getFactoryPessoaFisica: TFactoryPessoaFisica;
begin
  if fFactoryPessoaFisica = nil then
    fFactoryPessoaFisica := TFactoryPessoaFisica.Create;

  Result := fFactoryPessoaFisica;
end;

function TFactoryPessoa.getFactoryPessoaJuridica: TFactoryPessoaJuridica;
begin
  if fFactoryPessoaJuridica = nil then
    fFactoryPessoaJuridica := TFactoryPessoaJuridica.Create;

  Result := fFactoryPessoaJuridica;
end;

end.
