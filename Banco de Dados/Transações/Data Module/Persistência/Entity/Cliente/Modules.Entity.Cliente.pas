unit Modules.Entity.Cliente;

interface

uses
  System.Classes, System.SysUtils, Data.DB, Modules.Entity.Base;

type
  TDataModuleCliente = class(TDataModuleBase)
  private
    fIdCliente: Integer;

    function getSqlInsertCliente : string;
    function getSqlDeleteCliente : string;
    function getSqlSelectCliente: string;
    function getSqlContatosCliente: string;
    function getSalvarContatosCliente(const pContatos : TDataSet) : Boolean;
    function getExcluirContatosCliente(const pIdCliente : Integer) : Boolean;
    function getSqlInsertContatosCliente: string;
    function getIdCliente : Integer;
    function getExistemContatosCliente(const pIdCliente : Integer) : Boolean;
    function getSqlExistemContatosCliente: string;
    function getSqlExcluirContatosCliente: string;
  public
    function getSalvarCliente(const pContatos : TDataSet; const pNome, pEndereco : string; const pIDCliente : Integer = 0) : Boolean;
    function getListarClientes : TObject;
    function getExcluirCliente(const pIdCliente : Integer) : Boolean;
    function getListarContatosCliente(const pIdCliente : Integer) : TDataSet;
    procedure setCloseContatosCliente;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{$region 'getSql'}
function TDataModuleCliente.getSqlExistemContatosCliente : string;
begin
  Result := 'SELECT 1 FROM cliente_contato WHERE idcliente = :pid_cliente';
end;

function TDataModuleCliente.getSqlInsertContatosCliente : string;
begin
  Result := 'INSERT INTO CLIENTE_CONTATO' +
            ' (IDCLIENTE, TIPO_CONTATO, CONTATO) ' +
            ' VALUES ' +
            ' (:IDCLIENTE, :TIPO_CONTATO, :CONTATO)';
end;

function TDataModuleCliente.getSqlExcluirContatosCliente : string;
begin
  Result := 'DELETE FROM cliente_contato where idcliente = :id_cliente';
end;

function TDataModuleCliente.getSqlDeleteCliente: string;
begin
  Result := 'DELETE FROM cliente WHERE idcliente = ';
end;

function TDataModuleCliente.getSqlInsertCliente: string;
begin
  Result := 'INSERT INTO cliente (Nome, Endereco) VALUES (:Nome, :Endereco)';
end;

function getSqlUpdateCliente: string;
begin
  Result := 'UPDATE cliente SET nome = :Nome, Endereco = :Endereco WHERE idcliente = :id_Cliente';
end;

function TDataModuleCliente.getSqlSelectCliente : string;
begin
  Result := 'SELECT idCliente AS "Código", ' +
            '       nome      AS "Nome Cliente", ' +
            '       endereco  AS "Endereço Cliente"' +
            '  FROM cliente';
end;

procedure TDataModuleCliente.setCloseContatosCliente;
begin
  MemTable.Active := False;
end;

function TDataModuleCliente.getSqlContatosCliente : string;
begin
  Result := 'SELECT idcliente_contato AS "Código", ' +
            '       tipo_contato AS "Tipo Contato", ' +
            '       Contato      AS "Contato" ' +
            '  FROM cliente_contato ' +
            ' WHERE idcliente = :id_cliente';
end;
{$endregion}

{$REGION 'CONTATOS_CLIENTE'}
{$region 'getExistemContatosCliente'}
function TDataModuleCliente.getExistemContatosCliente(const pIdCliente : Integer) : Boolean;
var
  vResult : Boolean;
begin
  try
    Qry2.Open(getSqlExistemContatosCliente, [pIdCliente]);
    vResult := Qry2.Fields[0].AsInteger = 1;
  except on E: Exception do
    raise Exception.Create('Erro ao listar os contatos do cliente: ' + E.Message);
  end;

  Result := vResult;
end;
{$endregion}

{$region 'getSalvarContatosCliente'}
function TDataModuleCliente.getSalvarContatosCliente(const pContatos : TDataSet) : Boolean;
var
  vResult : Boolean;
begin
  try
    try
      if pContatos.State in dsEditModes then
        pContatos.Post;

      pContatos.DisableControls;
      pContatos.First;

      while not pContatos.Eof do
      begin
        Qry.ExecSQL(getSqlInsertContatosCliente, [fIdCliente,
                                                  pContatos.FieldByName('Tipo Contato').AsString,
                                                  pContatos.FieldByName('Contato').AsString]
                                                  );
        pContatos.Next;
      end;

      vResult := True;
    except on E: Exception do
      raise Exception.Create('Erro ao salvar contatos do cliente: ' + E.Message);
    end;
  finally
    pContatos.First;
    pContatos.EnableControls;
  end;

  Result := vResult;
end;
{$endregion}

{$region 'getExcluirContatosCliente'}
function TDataModuleCliente.getExcluirContatosCliente(const pIdCliente : Integer): Boolean;
var
  vResult : Boolean;
begin
  try
    Qry.ExecSQL(getSqlExcluirContatosCliente, [pIdCliente]);
    vResult := True;
  except on E: Exception do
    raise Exception.Create('Erro ao listar os contatos do cliente: ' + E.Message);
  end;

  Result := vResult;
end;
{$endregion}

{$region 'getListarContatosCliente'}
function TDataModuleCliente.getListarContatosCliente(const pIdCliente : Integer) : TDataSet;
var
  vResult : TDataSet;
begin
  try
    Qry2.Open(getSqlContatosCliente, [pIdCliente]);
    MemTable.Active := False;
    MemTable.AppendData(Qry2);
    vResult := MemTable;
  except on E: Exception do
    raise Exception.Create('Erro ao listar os contatos do cliente: ' + E.Message);
  end;

  Result := vResult;
end;
{$endregion}
{$ENDREGION}

{$REGION 'CLIENTE'}
{$region 'getIdCliente'}
function TDataModuleCliente.getIdCliente: Integer;
begin
  Result := Qry.Connection.ExecSQLScalar('SELECT gen_id(gen_cliente_id, 0) FROM RDB$DATABASE');
end;
{$endregion}

{$region 'getSalvarCliente'}
function TDataModuleCliente.getSalvarCliente(const pContatos : TDataSet; const pNome, pEndereco : string; const pIDCliente : Integer) : Boolean;
var
  vResult : Boolean;
begin
  if pContatos.RecordCount = 0 then
    raise Exception.Create('Não foi informado nenhum contato para este cliente.');

  fIdCliente := pIDCliente;

  DataModuleConnection.setStartTransaction;

  try
    if fIdCliente = 0 then
    begin
      Qry.ExecSQL(getSqlInsertCliente, [pNome, pEndereco]);
      fIdCliente := getIdCliente;
    end
    else
      Qry.ExecSQL(getSqlUpdateCliente, [pNome, pEndereco, fIdCliente]);

    vResult := True and getExcluirContatosCliente(fIdCliente) and getSalvarContatosCliente(pContatos);
    DataModuleConnection.setCommitTransaction;
  except on E: Exception do
    begin
      DataModuleConnection.setRoollbackTransaction;
      raise Exception.Create('Erro ao inserir cliente: ' + E.Message);
    end;
  end;

  Result := vResult;
end;
{$endregion}

{$region 'getListarClientes'}
function TDataModuleCliente.getListarClientes : TObject;
var
  vResult : TObject;
begin
  try
    Qry.Open(getSqlSelectCliente);
    vResult := Qry;
  except on E: Exception do
    raise Exception.Create('Erro ao listar clientes: ' + E.Message);
  end;
  Result := vResult;
end;
{$endregion}

{$region 'getExcluirCliente'}
function TDataModuleCliente.getExcluirCliente(const pIdCliente : Integer) : Boolean;
begin
  if getExistemContatosCliente(pIdCliente) then
    raise Exception.Create('Existem contatos cadastrados para este cliente.');

  try
    Qry.ExecSQL(getSqlDeleteCliente + pIdCliente.ToString);
    Result := True;
  except on E: Exception do
    raise Exception.Create('Erro ao excluir cliente: ' + E.Message);
  end;
end;
{$endregion}

{$ENDREGION}

end.
