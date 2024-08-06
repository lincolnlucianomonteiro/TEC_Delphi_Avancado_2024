program POO;

uses
  //FastMM4,
  Vcl.Forms,
  uViewPOO in '..\View\uViewPOO.pas' {ViewPOO},
  uModel.Registro in '..\Class\uModel.Registro.pas',
  uModel.Metodos in '..\Class\uModel.Metodos.pas',
  uModel.Class_Methods in '..\Class\uModel.Class_Methods.pas',
  uModel.Cliente in '..\Class\uModel.Cliente.pas',
  uModel.Pessoa in '..\Class\uModel.Pessoa.pas',
  uModel.Validacoes in '..\Class\uModel.Validacoes.pas',
  uModel.ItensVenda in '..\Class\uModel.ItensVenda.pas',
  uModel.Calculadora in '..\Class\uModel.Calculadora.pas',
  uViewPessoa in '..\View\uViewPessoa.pas' {ViewPessoa},
  uModel.Constantes in '..\Class\uModel.Constantes.pas',
  uViewPrincipal in '..\View\uViewPrincipal.pas' {ViewPrincipal},
  uViewBase in '..\View\uViewBase.pas' {ViewBase},
  uManagerForm in '..\Class\uManagerForm.pas',
  uViewLista in '..\View\uViewLista.pas' {ViewLista},
  uModel.PessoaFisica in '..\Class\uModel.PessoaFisica.pas',
  uModel.PessoaJuridica in '..\Class\uModel.PessoaJuridica.pas',
  uModel.Fornecedor in '..\Class\uModel.Fornecedor.pas',
  uSeresVivos in '..\Class\uSeresVivos.pas',
  uViewCadastroProdutos in '..\View\uViewCadastroProdutos.pas' {FormCadastroProdutos},
  uViewLogin in '..\View\uViewLogin.pas' {ViewLogin},
  uUsuario in '..\Class\uUsuario.pas',
  uFactoryPessoaFisica in '..\Class\Factory\uFactoryPessoaFisica.pas',
  uFactoryPessoaJuridica in '..\Class\Factory\uFactoryPessoaJuridica.pas',
  uFactoryPessoa in '..\Class\Factory\uFactoryPessoa.pas',
  uFornecedor in '..\Class\uFornecedor.pas',
  uFactoryFonecedor in '..\Class\Factory\uFactoryFonecedor.pas',
  uControllerPessoa in '..\Class\Controller\uControllerPessoa.pas';

{$R *.res}
begin
//  {$IFDEF DEBUG} // DIRETIVA DE COMPILAÇÃO - MODO DEBUG
  ReportMemoryLeaksOnShutdown := True;
//  {$ENDIF}

  // Login do usuário

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
