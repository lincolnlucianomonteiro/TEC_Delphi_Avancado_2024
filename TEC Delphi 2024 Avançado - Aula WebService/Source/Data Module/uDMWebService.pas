unit uDMWebService;

interface

uses
  System.SysUtils, System.Classes, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client;

type
{$METHODINFO ON}
  TDMWebService = class(TDataModule)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
  private

  end;
{$METHODINFO OFF}

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
