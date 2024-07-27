unit uViewCEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON,
  uDMWebService;

type
  TDados = record
      Logradouro  : string;
      Bairro      : string;
      UF          : string;
      Localidade  : string;
      Complemento : string;
      cep         : string;
      ibge        : string;
      gia         : string;
      ddd         : string;
  end;

  TViewCEP = class(TForm)
    gbxConsultar: TGroupBox;
    edtConsultarCEP: TEdit;
    btnConsultar: TButton;
    gbxDados: TGroupBox;
    edtCEP: TEdit;
    lblCEP: TLabel;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    lblIBGE: TLabel;
    edtIBGE: TEdit;
    lblGIA: TLabel;
    edtGIA: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    lblBairro: TLabel;
    edtLocalidade: TEdit;
    lblLocalidade: TLabel;
    lblUF: TLabel;
    edtUF: TEdit;
    edtDDD: TEdit;
    lblDDD: TLabel;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    fDMWebService : TDMWebService;
    function getBuscarCEPNoViaCEP(const pCEP : string) : TDados;
  end;

implementation

{$R *.dfm}

procedure TViewCEP.FormCreate(Sender: TObject);
begin
  fDMWebService := TDMWebService.Create(Self);
end;

procedure TViewCEP.btnConsultarClick(Sender: TObject);
var
  vDados : TDados;
begin
  vDados := getBuscarCEPNoViaCEP(edtConsultarCEP.Text);

  if not vDados.cep.IsEmpty then
  begin
    edtCEP.Text         := vDados.cep;
    edtLogradouro.Text  := vDados.Logradouro;
    edtIBGE.Text        := vDados.ibge;
    edtGIA.Text         := vDados.gia;
    edtComplemento.Text := vDados.Complemento;
    edtBairro.Text      := vDados.Bairro;
    edtLogradouro.Text  := vDados.Logradouro;
    edtLocalidade.Text  := vDados.Localidade;
    edtUF.Text          := vDados.UF;
    edtDDD.Text         := vDados.ddd;
  end;
end;

function TViewCEP.getBuscarCEPNoViaCEP(const pCEP : string) : TDados;
var
  vObjJson  : TJSONObject;

  vResult   : TDados;
  vJsonErro : TJSONValue;
begin
  fDMWebService.RESTClient.BaseURL := 'viacep.com.br/ws/' + pCEP + '/json';
  fDMWebService.RESTRequest.Execute;

  vObjJson  := fDMWebService.RESTResponse.JSONValue as TJSONObject;
  vJsonErro := vObjJson.GetValue('erro');

  if (Assigned(vJsonErro)) and (StrToBool(vJsonErro.Value)) then
    Exit;

  vResult.Logradouro  := vObjJson.Values['logradouro'].Value;
  vResult.Bairro      := vObjJson.Values['bairro'].Value;
  vResult.UF          := vObjJson.Values['uf'].Value;
  vResult.Localidade  := vObjJson.Values['localidade'].Value;
  vResult.Complemento := vObjJson.Values['complemento'].Value;
  vResult.cep         := vObjJson.Values['cep'].Value;
  vResult.ibge        := vObjJson.Values['ibge'].Value;
  vResult.gia         := vObjJson.Values['gia'].Value;
  vResult.ddd         := vObjJson.Values['ddd'].Value;

  Result := vResult;
end;

end.
