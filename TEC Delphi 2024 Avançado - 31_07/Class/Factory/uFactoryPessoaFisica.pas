unit uFactoryPessoaFisica;

interface

uses
  uModel.PessoaFisica;

type
  TFactoryPessoaFisica = class // Factory method para pessoa f�sica
  private
    fPessoaFisica : TPessoaFisica;

    function getPessoaFisica: TPessoaFisica;
  public
    destructor Destroy; override;
    property PessoaFisica : TPessoaFisica read getPessoaFisica;
  end;

implementation

destructor TFactoryPessoaFisica.Destroy;
begin
  fPessoaFisica.Free;
end;

function TFactoryPessoaFisica.getPessoaFisica: TPessoaFisica;
begin
  if fPessoaFisica = nil then
    fPessoaFisica := TPessoaFisica.Create;

  Result := fPessoaFisica;
end;

end.
