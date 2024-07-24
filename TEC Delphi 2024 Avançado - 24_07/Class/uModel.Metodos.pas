unit uModel.Metodos;

interface

// lib de fun��es

uses
  System.SysUtils;

  function ValidarDocumento(const pCondicao : Boolean; const pMensagem : string) : Boolean;
  function ValidarCPF(const pCPF : string) : Boolean;
  function ValidarCNPJ(const pCNPJ : string) : Boolean;

implementation

function ValidarDocumento(const pCondicao : Boolean; const pMensagem : string) : Boolean;
begin
  if not pCondicao then
    raise Exception.Create(pMensagem);

  Result := True;
end;

function ValidarCPF(const pCPF : string) : Boolean;
begin
  Result := ValidarDocumento(Length(Trim(pCPF)) = 11, 'CPF inv�lido');
end;

function ValidarCNPJ(const pCNPJ : string) : Boolean;
begin
  Result := ValidarDocumento(Length(Trim(pCNPJ)) = 14, 'CNPJ inv�lido');
end;

end.
