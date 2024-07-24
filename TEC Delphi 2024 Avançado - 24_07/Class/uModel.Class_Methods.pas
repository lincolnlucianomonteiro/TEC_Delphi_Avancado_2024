unit uModel.Class_Methods;

interface

uses
  System.SysUtils;

type
  TValidarDocumento = class
  private
    class function ValidarDocumento(const pCondicao : Boolean; const pMensagem : string) : Boolean;
  public
    class function ValidarCPF(const pCPF : string) : Boolean;
    class function ValidarCNPJ(const pCNPJ : string) : Boolean;
  end;

implementation

class function TValidarDocumento.ValidarCNPJ(const pCNPJ: string): Boolean;
begin
  Result := ValidarDocumento(Length(Trim(pCNPJ)) = 14, 'CNPJ inválido');
end;

class function TValidarDocumento.ValidarCPF(const pCPF: string): Boolean;
begin
  Result := ValidarDocumento(Length(Trim(pCPF)) = 11, 'CPF inválido');
end;

class function TValidarDocumento.ValidarDocumento(const pCondicao: Boolean; const pMensagem: string): Boolean;
begin
  if not pCondicao then
    raise Exception.Create(pMensagem);

  Result := True;
end;

end.
