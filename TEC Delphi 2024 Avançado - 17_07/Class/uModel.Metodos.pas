unit uModel.Metodos;

interface

// lib de funções

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
  Result := ValidarDocumento(Length(Trim(pCPF)) = 11, 'CPF inválido');
end;

function ValidarCNPJ(const pCNPJ : string) : Boolean;
begin
  Result := ValidarDocumento(Length(Trim(pCNPJ)) = 14, 'CNPJ inválido');
end;

end.
