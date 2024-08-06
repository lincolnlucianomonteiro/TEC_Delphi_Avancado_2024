unit uViewPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, uModel.Constantes,

  uControllerPessoa;

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
    procedure FormDestroy(Sender: TObject);
  private
    procedure setDadosPessoaFisica;
    procedure setDadosPessoaJuridica;

    function getPessoa : TCtrlPessoa;
  end;

implementation

{$R *.dfm}

procedure TViewPessoa.FormDestroy(Sender: TObject);
begin
  getPessoa.setFreeInstancia;
end;

function TViewPessoa.getPessoa: TCtrlPessoa;
begin
  Result := TCtrlPessoa.getInstancia;
end;

procedure TViewPessoa.setDadosPessoaFisica;
begin
  getPessoa.FactoryPessoa
           .FactoryPessoaFisica
           .PessoaFisica
           .Nome := edtNome.Text;

  getPessoa.FactoryPessoa
           .FactoryPessoaFisica
           .PessoaFisica
           .CPF := edtDocumento.Text;
end;

procedure TViewPessoa.setDadosPessoaJuridica;
begin
  getPessoa.FactoryPessoa
           .FactoryPessoaJuridica
           .PessoaJuridica
           .Nome := edtNome.Text;

  getPessoa.FactoryPessoa
           .FactoryPessoaJuridica
           .PessoaJuridica
           .CNPJ := edtDocumento.Text;
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

      ShowMessage(getPessoa.FactoryPessoa
                           .FactoryPessoaFisica
                           .PessoaFisica
                           .DadosCompletos);
    end;
    1 :
    begin
      setDadosPessoaJuridica;

      ShowMessage(getPessoa.FactoryPessoa
                           .FactoryPessoaJuridica
                           .PessoaJuridica
                           .DadosCompletos);
    end;
  end;
end;

procedure TViewPessoa.btnFormatarDocumentoClick(Sender: TObject);
begin
  case rdgOperacoes.ItemIndex of
    0 :
    begin
      setDadosPessoaFisica;

      edtDocumento.Text := getPessoa.FactoryPessoa
                                    .FactoryPessoaFisica
                                    .PessoaFisica
                                    .FormatarDocumento;
    end;
    1 :
    begin
      setDadosPessoaJuridica;

      edtDocumento.Text := getPessoa.FactoryPessoa
                                    .FactoryPessoaJuridica
                                    .PessoaJuridica
                                    .FormatarDocumento;
    end;
  end;
end;

initialization
  RegisterClasses([TViewPessoa]);

finalization
  UnRegisterClasses([TViewPessoa]);


end.
