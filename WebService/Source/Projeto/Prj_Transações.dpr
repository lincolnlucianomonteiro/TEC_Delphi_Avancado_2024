program Prj_Transações;

uses
  Vcl.Forms,
  u.View.Base in '..\View\Base\u.View.Base.pas' {ViewBase},
  Frames.Base in '..\Frames\Base\Frames.Base.pas' {FrameBase: TFrame},
  Frames.Grid in '..\Frames\Frames.Grid.pas' {FrameGrid: TFrame},
  uViewCadastroBase in '..\View\uViewCadastroBase.pas' {ViewCadastroBase},
  uView.Cliente in '..\View\uView.Cliente.pas' {ViewCliente},
  Modules.Entity.Base in '..\Data Module\Persistência\Base\Modules.Entity.Base.pas' {DataModuleBase: TDataModule},
  Modules.DataModule.Connection in '..\Data Module\Modules.DataModule.Connection.pas' {DataModuleConnection: TDataModule},
  Controller.Entity.Cliente in '..\Controller\Cliente\Controller.Entity.Cliente.pas',
  Factory.Entity.Cliente in '..\Factory\Cliente\Factory.Entity.Cliente.pas',
  Modules.Entity.Cliente in '..\Data Module\Persistência\Entity\Cliente\Modules.Entity.Cliente.pas' {DataModuleCliente: TDataModule},
  Manager.Form in '..\Utils\Manager.Form.pas',
  uView.Principal in '..\View\uView.Principal.pas' {ViewPrincipal};

{$R *.res}
var
  ViewPrincipal: TViewPrincipal;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown   := True;
  Application.Title := 'Transações com Banco de Dados';
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
