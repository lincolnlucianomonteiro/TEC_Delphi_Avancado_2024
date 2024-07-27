unit uView.Cliente;

interface

uses
  Vcl.Forms, u.View.Base, System.Classes, Vcl.Controls,
  Frames.Base, uViewCadastroBase, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.ExtCtrls, Frames.Grid, Vcl.ComCtrls,
  Vcl.StdCtrls, Data.DB, Controller.Entity.Cliente, System.SysUtils,
  Winapi.Windows, System.Math;

type
  TViewCliente = class(TViewCadastroBase)
    edtNome          : TEdit;
    edtEndereco      : TEdit;
    edtContato       : TEdit;
    lblNome          : TLabel;
    lblEndereco      : TLabel;
    lblTipoContato   : TLabel;
    lblContato       : TLabel;
    gbxContatos      : TGroupBox;
    cmbTipoContato   : TComboBox;
    dsCliente        : TDataSource;
    dsContatoCliente : TDataSource;
    btnAdicionarContato: TSpeedButton;
    FrameGridContatos: TFrameGrid;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarContatoClick(Sender: TObject);
    procedure dsContatoClienteDataChange(Sender: TObject; Field: TField);
  private
    fControllerCliente : TControllerCliente;

    procedure setLimparComponentes;
    procedure setHabilitarComponentes;
    procedure setListarCliente;
    procedure setValidarRegistroSelecionado;
    procedure setListarContatosCliente;

    function getIDCliente : Integer;
  end;

implementation

{$R *.dfm}

procedure TViewCliente.FormCreate(Sender: TObject);
begin
  fControllerCliente := TControllerCliente.Create;
  setListarCliente;
end;

procedure TViewCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fControllerCliente);
end;

function TViewCliente.getIDCliente : Integer;
begin
  Result := 0;

  if dsCliente.DataSet.Active then
    Result := dsCliente.DataSet.FieldByName('Código').AsInteger;
end;

procedure TViewCliente.btnCancelarClick(Sender: TObject);
begin
  setHabilitarComponentes;
  inherited btnSalvarClick(Sender);
end;

procedure TViewCliente.btnExcluirClick(Sender: TObject);
begin
  setValidarRegistroSelecionado;

  if Application.MessageBox('Tem certeza que deseja excluir este registro?', PChar(Application.Title), MB_YESNO) = IDNO then
    Exit;

  if fControllerCliente.FactoryCliente
                         .DataModuleCliente
                           .getExcluirCliente(getIDCliente) then

  begin
    setLimparComponentes;
    setListarCliente;
  end;
end;

procedure TViewCliente.btnIncluirClick(Sender: TObject);
begin
  dsCliente.DataSet.Close;
  setListarContatosCliente;
  setLimparComponentes;
  setHabilitarComponentes;
  inherited;
  edtNome.SetFocus;
end;

procedure TViewCliente.btnEditarClick(Sender: TObject);
begin
  setValidarRegistroSelecionado;

  edtNome.Text     := dsCliente.DataSet.FieldByName('Nome Cliente').AsString;
  edtEndereco.Text := dsCliente.DataSet.FieldByName('Endereço Cliente').AsString;
  setListarContatosCliente;

  setHabilitarComponentes;
  inherited btnIncluirClick(Sender);
  edtNome.SetFocus;
end;

procedure TViewCliente.btnSalvarClick(Sender: TObject);
begin
  if string(edtNome.Text).Trim.IsEmpty then
    raise Exception.Create('É necessário informar o nome do cliente.');

  if string(edtEndereco.Text).Trim.IsEmpty then
    raise Exception.Create('É necessário informar o endereço do cliente.');

  if fControllerCliente.FactoryCliente
                         .DataModuleCliente
                           .getSalvarCliente(dsContatoCliente.DataSet, Trim(edtNome.Text), Trim(edtEndereco.Text), getIDCliente) then
  begin
    setListarCliente;
    setHabilitarComponentes;
    inherited;
  end;
end;

procedure TViewCliente.dsContatoClienteDataChange(Sender: TObject; Field: TField);
begin
  if dsContatoCliente.State = dsBrowse then
  begin
    cmbTipoContato.ItemIndex := cmbTipoContato.Items.IndexOf(dsContatoCliente.DataSet.FieldByName('Tipo Contato').AsString);
    edtContato.Text          := dsContatoCliente.DataSet.FieldByName('Contato').AsString;
  end;
end;

procedure TViewCliente.setHabilitarComponentes;
begin
  edtNome.Enabled        := not edtNome.Enabled;
  edtEndereco.Enabled    := not edtEndereco.Enabled;
  edtContato.Enabled     := not edtContato.Enabled;
  cmbTipoContato.Enabled := not cmbTipoContato.Enabled;
end;

procedure TViewCliente.setListarCliente;
begin
  dsCliente.DataSet := TDataSet(fControllerCliente.FactoryCliente.DataModuleCliente.getListarClientes);
  setListarContatosCliente;
end;

procedure TViewCliente.setValidarRegistroSelecionado;
begin
  if (dsCliente.DataSet = nil) or (dsCliente.DataSet.IsEmpty) then
    raise Exception.Create('Necessário selecionar um registro válido.');
end;

procedure TViewCliente.btnAdicionarContatoClick(Sender: TObject);
begin
  if cmbTipoContato.ItemIndex = -1 then
    raise Exception.Create('É necessário informar o tipo do contato.');

  if string(edtContato.Text).Trim.IsEmpty then
    raise Exception.Create('É necessário informar o contato.');

  dsContatoCliente.DataSet.AppendRecord([0, cmbTipoContato.Text, Trim(edtContato.Text)]);
end;

procedure TViewCliente.setListarContatosCliente;
begin
  dsContatoCliente.DataSet := fControllerCliente.FactoryCliente
                                                  .DataModuleCliente
                                                    .getListarContatosCliente(getIDCliente);
end;

procedure TViewCliente.setLimparComponentes;
begin
  edtNome.Clear;
  edtEndereco.Clear;
  edtContato.Clear;
  cmbTipoContato.ItemIndex := -1;
end;

initialization
  RegisterClasses([TViewCliente]);
finalization
  UnRegisterClasses([TViewCliente]);

end.
