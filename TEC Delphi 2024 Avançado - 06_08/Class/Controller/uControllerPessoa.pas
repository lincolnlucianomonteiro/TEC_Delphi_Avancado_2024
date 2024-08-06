unit uControllerPessoa;

interface

uses
  uFactoryPessoa, System.SysUtils;

type
  TCtrlPessoa = class
  private
    fFactoryPessoa : TFactoryPessoa;

    class var fInstancia : TCtrlPessoa;
    function getFactoryPessoa: TFactoryPessoa;

    constructor CreateNew(const pNew : Boolean = True);
  public
    destructor Destroy; override;
    constructor Create;
    property FactoryPessoa : TFactoryPessoa read getFactoryPessoa;

    class function getInstancia : TCtrlPessoa;
    class procedure setFreeInstancia;
  end;

implementation

{ TControllerPessoa }

class function TCtrlPessoa.getInstancia: TCtrlPessoa;
begin
  if fInstancia = nil then
    fInstancia := TCtrlPessoa.CreateNew;

  Result := fInstancia;
end;

class procedure TCtrlPessoa.setFreeInstancia;
begin
  FreeAndNil(fInstancia);
end;

constructor TCtrlPessoa.Create;
begin
  raise Exception.Create('Para instanciar esta classe utilize TControllerPessoa.getInstancia!');
end;

constructor TCtrlPessoa.CreateNew(const pNew : Boolean);
begin
  inherited Create;
end;

destructor TCtrlPessoa.Destroy;
begin
  fFactoryPessoa.Free;
end;

function TCtrlPessoa.getFactoryPessoa: TFactoryPessoa;
begin
  if fFactoryPessoa = nil  then
    fFactoryPessoa := TFactoryPessoa.Create;

  Result := fFactoryPessoa;
end;

end.
