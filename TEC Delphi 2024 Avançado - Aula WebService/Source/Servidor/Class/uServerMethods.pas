unit uServerMethods;

interface

uses System.SysUtils, System.Classes, System.Json, Data.DB,
    Datasnap.DSServer, uDMDados, DataSet.Serialize, Data.DBXPlatform,
  uWebModule, Datasnap.DSHTTPWebBroker, Web.HTTPApp;

type
{$METHODINFO ON}
  TServerMethods = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    fDMConexao : TDMConexao;
  public
    // GET - SELECT
    function Cliente(const pNomeCliente : string = '') : TJSONArray;

    // PUT - UPDATE
    function AcceptCliente(const pidcliente : Integer; const pNomeCliente, pEnderecoCliente: string) : TJSONArray;

    // POST - INSERT
    function UpdateCliente(const pNomeCliente, pEnderecoCliente: string): TJSONArray;

    // DELETE
    function CancelCliente(const pidcliente : Integer) : TJSONArray;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TServerMethods.DataModuleCreate(Sender: TObject);
begin
  fDMConexao := TDMConexao.Create(Self);
end;

// POST - INSERT
function TServerMethods.UpdateCliente(const pNomeCliente, pEnderecoCliente: string): TJSONArray;
begin
  fDMConexao.Query.ExecSQL('INSERT INTO cliente (Nome, Endereco) ' +
                           'VALUES (:Nome, :Endereco)',
                           [pNomeCliente, pEnderecoCliente]
                          );

  Result := TJSONArray.Create ('Clientes', 'Cliente cadastrado com sucesso!');
end;

// PUT - UPDATE
function TServerMethods.AcceptCliente(const pidcliente : Integer; const pNomeCliente, pEnderecoCliente: string) : TJSONArray;
begin
  fDMConexao.Query.ExecSQL('UPDATE cliente SET nome =:pNome, endereco =:pEndereco ' +
                           ' WHERE idcliente =:pidcliente',
                           [pNomeCliente, pEnderecoCliente, pidcliente]
                          );

  Result := TJSONArray.Create ('Clientes', 'Cliente atualizado com sucesso!');
end;

function TServerMethods.CancelCliente(const pidcliente : Integer) : TJSONArray;
begin
  fDMConexao.Query.ExecSQL('DELETE FROM cliente ' +
                           ' WHERE idcliente =:pidcliente', [pidcliente]);

  Result := TJSONArray.Create ('Clientes', 'Cliente excluido com sucesso!');
end;

function TServerMethods.Cliente(const pNomeCliente : string) : TJSONArray;
begin
  fDMConexao.Query.Open('SELECT * FROM cliente WHERE nome like ''%' + pNomeCliente + '%''' );

  if fDMConexao.Query.IsEmpty then
    Result := TJSONArray.Create ('Clientes', 'Nenhum registro encontrado!')
  else
    Result := fDMConexao.Query.ToJSONArray();
end;

end.
