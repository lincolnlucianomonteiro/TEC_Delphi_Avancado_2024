unit uModel.Validacoes;

interface

uses
  System.SysUtils;

type
  TValidacoes = class
  protected
    procedure ValidarCampo(const pCondicao : Boolean; const pMensagem : string);
  end;

implementation

procedure TValidacoes.ValidarCampo(const pCondicao: Boolean; const pMensagem: string);
begin
  if not pCondicao then
    raise Exception.Create(pMensagem);
end;

end.
