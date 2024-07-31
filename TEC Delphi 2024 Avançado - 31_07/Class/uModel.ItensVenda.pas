unit uModel.ItensVenda;

interface

uses uModel.Validacoes, System.SysUtils;

type
  TModelItensVenda = class(TValidacoes)
  private
    fValorUnitario: Double;
    fQuantidade: Integer;
    fNomeProduto: string;
    function getValorTotalItem: Double;
    procedure setNomeProduto(const Value: string);
    procedure setQuantidade(const Value: Integer);
    procedure setValorUnitario(const Value: Double);
  public
    property NomeProduto    : string read fNomeProduto write setNomeProduto;
    property ValorUnitario  : Double read fValorUnitario write setValorUnitario;
    property Quantidade     : Integer read fQuantidade write setQuantidade;
    property ValorTotalItem : Double read getValorTotalItem;
  end;

implementation

function TModelItensVenda.getValorTotalItem : Double;
begin
  Result := fValorUnitario * fQuantidade;
end;

procedure TModelItensVenda.setNomeProduto(const Value: string);
begin
  ValidarCampo(Trim(Value) <> '', 'O nome do produto é obrigatório.');
  fNomeProduto := Value.Trim;
end;

procedure TModelItensVenda.setQuantidade(const Value: Integer);
begin
  ValidarCampo(Value > 0, 'A quantidade tem que ser maior que zero.');
  fQuantidade := Value;
end;

procedure TModelItensVenda.setValorUnitario(const Value: Double);
begin
  ValidarCampo(Value > 0, 'O valor unitário tem que ser maior que zero.');

  fValorUnitario := Value;
end;

end.
