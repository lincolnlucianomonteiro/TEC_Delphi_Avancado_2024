unit uViewPOO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uModel.Registro,
  Vcl.ExtCtrls,

  uModel.Metodos,
  uModel.Class_Methods,uModel.Pessoa;

type
  TViewPOO = class(TForm)
    btnCadastrarConfiguracao: TButton;
    mmoResultado: TMemo;
    edtDocumento: TLabeledEdit;
    btnValidar: TButton;
    btnCliente: TButton;
    edtNome: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtTelefone: TLabeledEdit;
    edtNomePessoa: TLabeledEdit;
    edtEmail: TLabeledEdit;
    btnPessoa: TButton;
    procedure btnCadastrarConfiguracaoClick(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
  private
    procedure CadastrarConfiguracao(const pConfiguracao : TConfiguracao);
    procedure ExibirResultado(vConfiguracao: TConfiguracao);
  end;

var
  ViewPOO: TViewPOO;

implementation

uses
  uModel.Cliente;

{$R *.dfm}

{ TViewPrincipal }

procedure TViewPOO.btnCadastrarConfiguracaoClick(Sender: TObject);
var
  vConfiguracao : TConfiguracao;
begin
  vConfiguracao.Host         := '10.0.0.20';
  vConfiguracao.Usuario      := 'escriba';
  vConfiguracao.Senha        := '123';
  vConfiguracao.Database     := 'sp_00776';
  vConfiguracao.LoginWindows := 'Sim';
  vConfiguracao.Criptografia := 'N�o';

  CadastrarConfiguracao(vConfiguracao);
  ExibirResultado(vConfiguracao);
end;

procedure TViewPOO.CadastrarConfiguracao(const pConfiguracao : TConfiguracao);
var
  vStringList : TStrings;
begin
  vStringList := TStringList.Create;

  try
    vStringList.Append('Host: '         + pConfiguracao.Host);
    vStringList.Append('Usuario: '      + pConfiguracao.Usuario);
    vStringList.Append('Senha: '        + pConfiguracao.Senha);
    vStringList.Append('Database: '     + pConfiguracao.Database);
    vStringList.Append('LoginWindows: ' + pConfiguracao.LoginWindows);
    vStringList.Append('Criptografia: ' + pConfiguracao.Criptografia);

    vStringList.SaveToFile('Configuracao.txt');
  finally
    vStringList.Free;
  end;
end;

procedure TViewPOO.ExibirResultado(vConfiguracao: TConfiguracao);
begin
  mmoResultado.Clear;
  mmoResultado.Lines.Append(vConfiguracao.Host);
  mmoResultado.Lines.Append(vConfiguracao.Usuario);
  mmoResultado.Lines.Append(vConfiguracao.Senha);
  mmoResultado.Lines.Append(vConfiguracao.Database);
  mmoResultado.Lines.Append(vConfiguracao.LoginWindows);
  mmoResultado.Lines.Append(vConfiguracao.Criptografia);
end;

procedure TViewPOO.btnValidarClick(Sender: TObject);
begin
  //ValidarCPF(edtDocumento.Text); // biblioteca de fun��es / m�todos
  //ValidarCNPJ(edtDocumento.Text);// biblioteca de fun��es / m�todos

  TValidarDocumento.ValidarCPF(edtDocumento.Text); // class methods
  //TValidarDocumento.ValidarCNPJ(edtDocumento.Text); // class methods
end;

procedure TViewPOO.btnClienteClick(Sender: TObject);
var
  vCliente : TCliente;
begin
  vCliente          := TCliente.Create;
  vCliente.Nome     := edtNome.Text;
  vCliente.Endereco := edtEndereco.Text;
  vCliente.Telefone := edtTelefone.Text;

  try
    ShowMessage(vCliente.DadosCompletos );
  finally
    vCliente.Free;
  end;
end;

procedure TViewPOO.btnPessoaClick(Sender: TObject);
var
  vPessoaFisica   : TPessoaFisica;
  vPessoaJuridica : TPessoaJuridica;
begin
  vPessoaFisica   := TPessoaFisica.Create;
  vPessoaJuridica := TPessoaJuridica.Create;

  try
{
    vPessoaFisica.Nome  := edtNomePessoa.Text;
    vPessoaFisica.Email := edtEmail.Text;
    vPessoaFisica.CPF   := edtDocumento.Text;
}

    vPessoaJuridica.Nome  := edtNomePessoa.Text;
    vPessoaJuridica.Email := edtEmail.Text;
    vPessoaJuridica.CNPJ  := edtDocumento.Text;

    ShowMessage(vPessoaJuridica.Nome + sLineBreak +
                vPessoaJuridica.Email + sLineBreak +
                vPessoaJuridica.CNPJ);
  finally
    vPessoaFisica.Free;
    vPessoaJuridica.Free;
  end;
end;

end.
