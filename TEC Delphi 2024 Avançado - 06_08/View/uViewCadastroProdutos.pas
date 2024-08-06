unit uViewCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus;

type
  TFormCadastroProdutos = class(TForm)
    lblNomeProduto: TLabel;
    edtNomeProduto: TEdit;
    lblMarca: TLabel;
    edtMarca: TEdit;
    lblModelo: TLabel;
    edtModelo: TEdit;
    grpOperacoes: TGroupBox;
    btnOperacoes: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    ppmOperacoes: TPopupMenu;
    mnuCadastrarProduto: TMenuItem;
    mnuRemoverProduto: TMenuItem;
    mnuAtualizarProduto: TMenuItem;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
  private
  end;

implementation

{$R *.dfm}

end.
