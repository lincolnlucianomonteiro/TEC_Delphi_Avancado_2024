unit uFactoryPessoaJuridica;

interface

uses
  uModel.PessoaJuridica;

type
  TFactoryPessoaJuridica = class // Factory method para pessoa juridica
  private
    fPessoaJuridica : TPessoaJuridica;

    function getPessoaJuridica: TPessoaJuridica;
  public
    destructor Destroy; override;
    property PessoaJuridica : TPessoaJuridica read getPessoaJuridica;
  end;

implementation

destructor TFactoryPessoaJuridica.Destroy;
begin
  fPessoaJuridica.Free;
end;

function TFactoryPessoaJuridica.getPessoaJuridica: TPessoaJuridica;
begin
  if fPessoaJuridica = nil then
    fPessoaJuridica := TPessoaJuridica.Create;

  Result := fPessoaJuridica;
end;

end.

