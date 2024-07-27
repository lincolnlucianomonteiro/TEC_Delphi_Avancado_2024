unit uViewCadastroBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, u.View.Base, System.ImageList,
  Vcl.ImgList, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Frames.Grid, Vcl.ComCtrls, Frames.Base;

type
  TViewCadastroBase = class(TViewBase)
    ImageList: TImageList;
    pnlBotoes: TPanel;
    btnCancelar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnIncluir: TSpeedButton;
    pgcPrincipal: TPageControl;
    tabListagem: TTabSheet;
    FrameGridCliente: TFrameGrid;
    tabCadastro: TTabSheet;
    BalloonHint: TBalloonHint;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure setTabCadastro(const pSender: TObject);
    procedure setTabListagem(const pSender: TObject);
    procedure setControlarBotoes(const pSender: TObject);
  end;

implementation

{$R *.dfm}

procedure TViewCadastroBase.FormShow(Sender: TObject);
begin
  setTabListagem(Sender);
end;

procedure TViewCadastroBase.btnIncluirClick(Sender: TObject);
begin
  setTabCadastro(Sender);
end;

procedure TViewCadastroBase.btnSalvarClick(Sender: TObject);
begin
  setTabListagem(Sender);
end;

procedure TViewCadastroBase.setControlarBotoes(const pSender : TObject);
begin
  if pSender is TSpeedButton then
  begin
    btnIncluir.Enabled  := not btnIncluir.Enabled;
    btnEditar.Enabled   := not btnEditar.Enabled;
    btnSalvar.Enabled   := not btnSalvar.Enabled;
    btnCancelar.Enabled := not btnCancelar.Enabled;
    btnExcluir.Enabled  := not btnSalvar.Enabled;
  end;
end;

procedure TViewCadastroBase.setTabListagem(const pSender: TObject);
begin
  tabCadastro.TabVisible  := False;
  tabListagem.TabVisible  := True;
  pgcPrincipal.ActivePage := tabListagem;
  setControlarBotoes(pSender);
end;

procedure TViewCadastroBase.setTabCadastro(const pSender: TObject);
begin
  tabListagem.TabVisible  := False;
  tabCadastro.TabVisible  := True;
  pgcPrincipal.ActivePage := tabCadastro;
  setControlarBotoes(pSender);
end;

end.
