unit Factory.Entity.Cliente;

interface

uses
  Modules.Entity.Cliente, System.SysUtils;

type
  TFactoryCliente = class
  private
    fDataModuleCliente : TDataModuleCliente;
  public
    constructor Create;
    destructor Destroy; override;

    property DataModuleCliente : TDataModuleCliente read fDataModuleCliente;
  end;

implementation

constructor TFactoryCliente.Create;
begin
  fDataModuleCliente := TDataModuleCliente.Create;
end;

destructor TFactoryCliente.Destroy;
begin
  FreeAndNil(fDataModuleCliente);
end;

end.
