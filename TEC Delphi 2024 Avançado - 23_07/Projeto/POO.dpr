program POO;

uses
  Vcl.Forms,
  uViewPOO in '..\View\uViewPOO.pas' {ViewPOO},
  uModel.Registro in '..\Class\uModel.Registro.pas',
  uModel.Metodos in '..\Class\uModel.Metodos.pas',
  uModel.Class_Methods in '..\Class\uModel.Class_Methods.pas',
  uModel.Cliente in '..\Class\uModel.Cliente.pas',
  uModel.Pessoa in '..\Class\uModel.Pessoa.pas',
  uModel.Validacoes in '..\Class\uModel.Validacoes.pas',
  uModel.ItensVenda in '..\Class\uModel.ItensVenda.pas',
  uModel.Calculadora in '..\Class\uModel.Calculadora.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPOO, ViewPOO);
  Application.Run;
end.
