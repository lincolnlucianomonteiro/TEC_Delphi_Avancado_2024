unit uFactoryFonecedor;

interface

uses
  uFornecedor;

type
  TFactoryFornecedor = class // Factory method para fornecedor
  private
    ffornecedor : TFornecedor;

    function getFornecedor: TFornecedor;
  public
    destructor Destroy; override;
    property  Fornecedor: TFornecedor read getFornecedor;
  end;

implementation

destructor TFactoryFornecedor.Destroy;
begin
  ffornecedor.Free;
end;

function TFactoryFornecedor.getFornecedor: TFornecedor;
begin
  if ffornecedor = nil then
    ffornecedor := TFornecedor.Create;

  Result := ffornecedor;
end;

end.
