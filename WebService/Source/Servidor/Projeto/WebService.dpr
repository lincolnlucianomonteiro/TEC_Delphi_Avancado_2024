program WebService;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uViewServidor in '..\View\uViewServidor.pas' {ViewServidor},
  uServerMethods in '..\Class\uServerMethods.pas' {ServerMethods: TDataModule},
  uWebModule in '..\Class\uWebModule.pas' {WebModule1: TWebModule},
  uDMDados in '..\DataModule\uDMDados.pas' {DMConexao: TDataModule},
  DataSet.Serialize in '..\Class\DataSet.Serialize.pas',
  DataSet.Serialize.Language in '..\Class\DataSet.Serialize.Language.pas',
  DataSet.Serialize.Config in '..\Class\DataSet.Serialize.Config.pas',
  DataSet.Serialize.Export in '..\Class\DataSet.Serialize.Export.pas',
  DataSet.Serialize.Utils in '..\Class\DataSet.Serialize.Utils.pas',
  DataSet.Serialize.Consts in '..\Class\DataSet.Serialize.Consts.pas',
  DataSet.Serialize.UpdatedStatus in '..\Class\DataSet.Serialize.UpdatedStatus.pas',
  DataSet.Serialize.Import in '..\Class\DataSet.Serialize.Import.pas';

{$R *.res}

var
  ViewServidor : TViewServidor;
begin
  ReportMemoryLeaksOnShutdown := True;
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TViewServidor, ViewServidor);
  Application.Run;
end.
