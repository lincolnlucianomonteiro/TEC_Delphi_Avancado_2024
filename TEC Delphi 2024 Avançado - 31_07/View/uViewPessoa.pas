unit uViewPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, uModel.Constantes, uModel.Pessoa,
  uModel.PessoaFisica, uModel.PessoaJuridica;

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
  private
    fPessoaFisica   : TPessoaFisica;
    fPessoaJuridica : TPessoaJuridica;
  end;

implementation

{$R *.dfm}

procedure TViewPessoa.rdgOperacoesClick(Sender: TObject);
begin
  edtDocumento.EditLabel.Caption := C_Documentos[TRadioGroup(Sender).ItemIndex];
end;

procedure TViewPessoa.btnNomeCompletoClick(Sender: TObject);
begin
  case rdgOperacoes.ItemIndex of
    0 :
    begin
      fPessoaFisica      := TPessoaFisica.Create;

      try
        fPessoaFisica.Nome := edtNome.Text;
        fPessoaFisica.CPF  := edtDocumento.Text;

        ShowMessage(fPessoaFisica.DadosCompletos);
      finally
        fPessoaFisica.Free;
      end;
    end;
    1 :
    begin
      fPessoaJuridica       := TPessoaJuridica.Create;

      try
        fPessoaJuridica.Nome  := edtNome.Text;
        fPessoaJuridica.CNPJ  := edtDocumento.Text;

        ShowMessage(fPessoaJuridica.DadosCompletos);
      finally
        fPessoaJuridica.Free;
      end;
    end;
  end;
end;

procedure TViewPessoa.btnFormatarDocumentoClick(Sender: TObject);
begin
  case rdgOperacoes.ItemIndex of
    0 :
    begin
      fPessoaFisica      := TPessoaFisica.Create;

      try
        fPessoaFisica.Nome := edtNome.Text;
        fPessoaFisica.CPF  := edtDocumento.Text;

        edtDocumento.Text := fPessoaFisica.FormatarDocumento;
      finally
        fPessoaFisica.Free;
      end;
    end;
    1 :
    begin
      fPessoaJuridica       := TPessoaJuridica.Create;

      try
        fPessoaJuridica.Nome  := edtNome.Text;
        fPessoaJuridica.CNPJ  := edtDocumento.Text;

        edtDocumento.Text := fPessoaJuridica.FormatarDocumento;
      finally
        fPessoaJuridica.Free;
      end;
    end;
  end;
end;

initialization
  RegisterClasses([TViewPessoa]);

finalization
  UnRegisterClasses([TViewPessoa]);


end.
