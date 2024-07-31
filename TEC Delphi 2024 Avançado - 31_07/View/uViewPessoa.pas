unit uViewPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, uModel.Constantes,

  uAbstractFactoryPessoa;

type
  TViewPessoa = class(TForm)
    rdgOperacoes: TRadioGroup;
    edtNome: TLabeledEdit;
    edtDocumento: TLabeledEdit;
    btnNomeCompleto: TSpeedButton;
    btnFormatarDocumento: TSpeedButton;
    procedure rdgOperacoesClick(Sender: TObject);
    procedure btnNomeCompletoClick(Sender: TObject);
    procedure btnFormatarDocumentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fAbstractFactoryPessoa : TAbstractFactoryPessoa;
    procedure setDadosPessoaFisica;
    procedure setDadosPessoaJuridica;
  end;

implementation

{$R *.dfm}

procedure TViewPessoa.FormCreate(Sender: TObject);
begin
  fAbstractFactoryPessoa := TAbstractFactoryPessoa.Create;
end;

procedure TViewPessoa.FormDestroy(Sender: TObject);
begin
  fAbstractFactoryPessoa.Free;
end;

procedure TViewPessoa.setDadosPessoaFisica;
begin
  fAbstractFactoryPessoa.FactoryPessoaFisica.PessoaFisica.Nome := edtNome.Text;
  fAbstractFactoryPessoa.FactoryPessoaFisica.PessoaFisica.CPF := edtDocumento.Text;
end;

procedure TViewPessoa.setDadosPessoaJuridica;
begin
  fAbstractFactoryPessoa.FactoryPessoaJuridica.PessoaJuridica.Nome := edtNome.Text;
  fAbstractFactoryPessoa.FactoryPessoaJuridica.PessoaJuridica.CNPJ := edtDocumento.Text;
end;

procedure TViewPessoa.rdgOperacoesClick(Sender: TObject);
begin
  edtDocumento.EditLabel.Caption := C_Documentos[TRadioGroup(Sender).ItemIndex];
end;

procedure TViewPessoa.btnNomeCompletoClick(Sender: TObject);
begin
  case rdgOperacoes.ItemIndex of
    0 :
    begin
      setDadosPessoaFisica;

      ShowMessage(fAbstractFactoryPessoa.FactoryPessoaFisica.PessoaFisica.DadosCompletos);
    end;
    1 :
    begin
      setDadosPessoaJuridica;

      ShowMessage(fAbstractFactoryPessoa.FactoryPessoaJuridica.PessoaJuridica.DadosCompletos);
    end;
  end;
end;

procedure TViewPessoa.btnFormatarDocumentoClick(Sender: TObject);
begin
  case rdgOperacoes.ItemIndex of
    0 :
    begin
      setDadosPessoaFisica;

      edtDocumento.Text := fAbstractFactoryPessoa.FactoryPessoaFisica.PessoaFisica.FormatarDocumento;
    end;
    1 :
    begin
      setDadosPessoaJuridica;

      edtDocumento.Text := fAbstractFactoryPessoa.FactoryPessoaJuridica.PessoaJuridica.FormatarDocumento;
    end;
  end;
end;

initialization
  RegisterClasses([TViewPessoa]);

finalization
  UnRegisterClasses([TViewPessoa]);


end.
