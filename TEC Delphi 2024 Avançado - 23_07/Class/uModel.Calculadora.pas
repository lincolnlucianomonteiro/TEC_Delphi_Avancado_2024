unit uModel.Calculadora;

interface

uses
  System.SysUtils, System.Classes;

type
  TCalculadora = class(TObject)
  protected
    function getMostrarResultado(const pValor1, pValor2 : Integer) : string; virtual; abstract;
  end;

  TSomar = class(TCalculadora)
  private
    fValor1 : Integer;
    fValor2 : Integer;
    fValor3 : Integer;
  public
    constructor Create(const pValor1, pValor2 : Integer); overload;
    constructor Create(const pValor1, pValor2, pValor3 : Integer); overload;

    function getMostrarResultado(const pValor1, pValor2 : Integer) : string; override;
  end;

  TSubtrair = class(TCalculadora)
    function getMostrarResultado(const pValor1, pValor2 : Integer) : string; override;
  end;

  TMultiplicar = class(TCalculadora)
    function getMostrarResultado(const pValor1, pValor2 : Integer) : string; override;
  end;

  TDividir = class(TCalculadora)
    function getMostrarResultado(const pValor1, pValor2 : Integer) : string; override;
  end;

implementation

{ TSomar }

constructor TSomar.Create(const pValor1, pValor2 : Integer);
begin
  fValor1 := pValor1;
  fValor2 := pValor2;
end;

constructor TSomar.Create(const pValor1, pValor2, pValor3: Integer);
begin
  Create(pValor1, pValor2);

  fValor3 := pValor3;
end;

function TSomar.getMostrarResultado(const pValor1, pValor2: Integer): string;
begin
  Result := IntToStr(pValor1 + pValor2 + fValor1 + fValor2 + fValor3);
end;

{ TSubtrair }

function TSubtrair.getMostrarResultado(const pValor1, pValor2: Integer): string;
begin
  Result := IntToStr(pValor1 - pValor2);
end;

{ TMultiplicar }

function TMultiplicar.getMostrarResultado(const pValor1, pValor2: Integer): string;
begin
  Result := IntToStr(pValor1 * pValor2);
end;

{ TDividir }

function TDividir.getMostrarResultado(const pValor1, pValor2: Integer): string;
begin
  Result := IntToStr(pValor1 div pValor2);
end;

{ TCalculadora }

{function TCalculadora.getMostrarResultado(const pValor1, pValor2: Integer) : string;
begin
  Result := 'O resultado da operação do número ' + IntToStr(pValor1)  + ' e do número ' + IntToStr(pValor2) + ' é: ';
end;}

end.
