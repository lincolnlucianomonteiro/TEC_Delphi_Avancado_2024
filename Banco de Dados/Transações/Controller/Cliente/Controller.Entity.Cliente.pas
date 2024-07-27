unit Controller.Entity.Cliente;

interface

uses
  Factory.Entity.Cliente,
  System.SysUtils;

type
  TControllerCliente = class
  private
    fFactoryCliente : TFactoryCliente;
  public
    constructor Create;
    destructor Destroy; override;

    property FactoryCliente : TFactoryCliente read fFactoryCliente;
  end;

implementation

constructor TControllerCliente.Create;
begin
  fFactoryCliente := TFactoryCliente.Create;
end;

destructor TControllerCliente.Destroy;
begin
  FreeAndNil(fFactoryCliente);
end;

end.
