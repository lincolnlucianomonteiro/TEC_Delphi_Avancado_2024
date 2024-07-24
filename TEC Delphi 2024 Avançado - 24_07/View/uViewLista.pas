unit uViewLista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uViewBase, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.Types,

  uModel.Cliente;

type
  TViewLista = class(TViewBase)
    rdgOperacoes: TGroupBox;
    gbxDados: TGroupBox;
    mmoDados: TMemo;
    edtQtdItens: TEdit;
    edtLocalizar: TEdit;
    btnAdicionarItem: TButton;
    btnLimparLista: TButton;
    btnRemoverItem: TButton;
    btnExtrairItem: TButton;
    btnPercorrerItens: TButton;
    btnOrdenarItens: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPercorrerItensClick(Sender: TObject);
    procedure btnLimparListaClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
    procedure btnExtrairItemClick(Sender: TObject);
    procedure btnOrdenarItensClick(Sender: TObject);
  private
    fLista : TList;

    fCliente : TCliente;

    function getCliente : TCliente;
    procedure setLimparLista;
    procedure setRemoverItem(const pIndexItem: Integer);
    function getClienteLista(const pIndexItem: Integer): TCliente;
    procedure setHabilitarBotoes(const pCondicao : Boolean);
    procedure setListarDados(const pCliente : TCliente);
  end;

implementation

{$R *.dfm}

procedure TViewLista.FormCreate(Sender: TObject);
begin
  fLista := TList.Create;
end;

procedure TViewLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  setLimparLista;
  fLista.Free;
end;

procedure TViewLista.btnAdicionarItemClick(Sender: TObject);
var
  vTotal : Integer;
  vCount: Integer;
begin
  setLimparLista;
  vTotal := StrToIntDef(edtQtdItens.Text, 2);

  for vCount := 1 to vTotal do
    fLista.Add(getCliente);

  setHabilitarBotoes(True);
end;

procedure TViewLista.btnPercorrerItensClick(Sender: TObject);
var
  vTotal : Integer;
  vCount: Integer;
begin
  mmoDados.Lines.BeginUpdate;
  mmoDados.Lines.Clear;

  vTotal := Pred(fLista.Count);

  try
    for vCount := 0 to vTotal do
      setListarDados(getClienteLista(vCount));
  finally
    mmoDados.Lines.EndUpdate;
  end;
end;

procedure TViewLista.btnExtrairItemClick(Sender: TObject);
var
  vIndex : Integer;
begin
  vIndex := StrToIntDef(edtLocalizar.Text, 1) - 1;

  if vIndex < fLista.Count then
  begin
    fCliente := fLista.Extract( getClienteLista(vIndex));

    mmoDados.Lines.Clear;
    setListarDados(fCliente);

    fCliente.Free;
  end;

  setHabilitarBotoes(fLista.Count > 0);
end;

procedure TViewLista.btnLimparListaClick(Sender: TObject);
begin
  setLimparLista;

  setHabilitarBotoes(False);
end;

procedure TViewLista.btnRemoverItemClick(Sender: TObject);
begin
  setRemoverItem(StrToIntDef(edtLocalizar.Text, 1) -1);

  setHabilitarBotoes(fLista.Count > 0);
end;

procedure TViewLista.setListarDados(const pCliente : TCliente);
begin
  mmoDados.Lines.Append('Cliente: ' + pCliente.Nome);
  mmoDados.Lines.Append('Telefone: ' + pCliente.Telefone);

  if mmoDados.Lines.Count >= 2 then
    mmoDados.Lines.Append('---------------------------------------------');
end;

function TViewLista.getCliente: TCliente;
begin
  fCliente          := TCliente.Create;
  fCliente.Nome     := IntToStr(Random(1234567890));
  fCliente.Telefone := IntToStr(Random(987654321));

  Result            := fCliente;
end;

procedure TViewLista.setHabilitarBotoes(const pCondicao: Boolean);
begin
  btnRemoverItem.Enabled    := pCondicao;
  btnExtrairItem.Enabled    := pCondicao;
  btnLimparLista.Enabled    := pCondicao;
  btnPercorrerItens.Enabled := pCondicao;
  btnOrdenarItens.Enabled   := pCondicao;
end;

procedure TViewLista.setLimparLista;
begin
  while fLista.Count > 0 do
    setRemoverItem(0);
end;

procedure TViewLista.setRemoverItem(const pIndexItem : Integer);
begin
  fCliente := getClienteLista(pIndexItem);

  if fCliente <> nil then
  begin
    fLista.Remove(fCliente);
    fCliente.Free;

    if fLista.Count = 0 then
      fLista.Clear;
  end;
end;

function TViewLista.getClienteLista(const pIndexItem : Integer) : TCliente;
begin
  Result := nil;

  if (pIndexItem >= 0) and (pIndexItem < fLista.Count) then
    Result := TCliente(fLista[pIndexItem]);
end;

function getOrdenarLista(const pObjeto1, pObjeto2 : TCliente) : Integer;
begin
  Result := CompareText(pObjeto1.Nome, pObjeto2.Nome);
end;

procedure TViewLista.btnOrdenarItensClick(Sender: TObject);
begin
  fLista.Sort(@getOrdenarLista);
end;

initialization
  RegisterClasses([TViewLista]);

finalization
  UnRegisterClasses([TViewLista]);

end.
