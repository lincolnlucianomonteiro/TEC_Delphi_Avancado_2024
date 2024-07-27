unit Modules.DataModule.Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TDataModuleConnection = class(TDataModule)
    fdConnection: TFDConnection;
  public
    procedure setStartTransaction;
    procedure setCommitTransaction;
    procedure setRoollbackTransaction;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModuleConnection.setStartTransaction;
begin
  fdConnection.TxOptions.Isolation := xiReadCommitted;
  fdConnection.StartTransaction;
end;

procedure TDataModuleConnection.setCommitTransaction;
begin
  fdConnection.Commit;
end;

procedure TDataModuleConnection.setRoollbackTransaction;
begin
  fdConnection.Rollback;
end;


end.
