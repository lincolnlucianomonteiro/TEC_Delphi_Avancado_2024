unit uAbstractFactoryPessoa;

interface

uses
  uFactoryPessoaFisica,
  uFactoryPessoaJuridica,
  uFactoryFonecedor;

type
  TAbstractFactoryPessoa = class // AbstractFactory para fábrica de pessoa
  private
    fFactoryPessoaFisica   : TFactoryPessoaFisica;
    fFactoryPessoaJuridica : TFactoryPessoaJuridica;
    fFactoryFornecedor     : TFactoryFornecedor;

    function getFactoryPessoaFisica   : TFactoryPessoaFisica;
    function getFactoryPessoaJuridica : TFactoryPessoaJuridica;
    function getFactoryFornecedor     : TFactoryFornecedor;
  public
    destructor Destroy; override;

    property FactoryPessoaFisica   : TFactoryPessoaFisica   read getFactoryPessoaFisica;
    property FactoryPessoaJuridica : TFactoryPessoaJuridica read getFactoryPessoaJuridica;
    property FactoryFornecedor     : TFactoryFornecedor     read getFactoryFornecedor;
  end;

implementation

{ TAbstractFactoryPessoa }

destructor TAbstractFactoryPessoa.Destroy;
begin
  fFactoryPessoaJuridica.Free;
  fFactoryPessoaFisica.Free;
  fFactoryFornecedor.Free;
end;

function TAbstractFactoryPessoa.getFactoryFornecedor: TFactoryFornecedor;
begin
  if fFactoryFornecedor = nil then
    fFactoryFornecedor := TFactoryFornecedor.Create;

  Result := fFactoryFornecedor;
end;

function TAbstractFactoryPessoa.getFactoryPessoaFisica: TFactoryPessoaFisica;
begin
  if fFactoryPessoaFisica = nil then
    fFactoryPessoaFisica := TFactoryPessoaFisica.Create;

  Result := fFactoryPessoaFisica;
end;

function TAbstractFactoryPessoa.getFactoryPessoaJuridica: TFactoryPessoaJuridica;
begin
  if fFactoryPessoaJuridica = nil then
    fFactoryPessoaJuridica := TFactoryPessoaJuridica.Create;

  Result := fFactoryPessoaJuridica;
end;

end.
