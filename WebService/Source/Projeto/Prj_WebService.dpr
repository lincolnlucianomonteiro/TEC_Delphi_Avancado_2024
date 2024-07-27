program Prj_WebService;

uses
  Vcl.Forms,
  uViewCEP in '..\View\uViewCEP.pas' {ViewCEP},
  uDMWebService in '..\Data Module\uDMWebService.pas' {DMWebService: TDataModule};

{$R *.res}

var
  ViewCEP: TViewCEP;
begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewCEP, ViewCEP);
  Application.Run;
end.
