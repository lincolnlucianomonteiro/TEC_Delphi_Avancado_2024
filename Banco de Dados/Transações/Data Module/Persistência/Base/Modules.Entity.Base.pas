unit Modules.Entity.Base;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.DApt,
  Modules.DataModule.Connection;

type
  TDataModuleBase = class(TDataModule)
  private
    fQry                  : TFDQuery;
    fQry2                 : TFDQuery;
    fMemTable             : TFDMemTable;
    fDataModuleConnection : TDataModuleConnection;

    function getQry       : TFDQuery;
    function getMemTable  : TFDMemTable;
    function getQry2      : TFDQuery;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property Qry      : TFDQuery    read getQry;
    property Qry2     : TFDQuery    read getQry2;
    property MemTable : TFDMemTable read getMemTable;

    property DataModuleConnection : TDataModuleConnection read fDataModuleConnection;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TDataModuleBase.Create;
begin
  fDataModuleConnection := TDataModuleConnection.Create(nil);
end;

destructor TDataModuleBase.Destroy;
begin
  FreeAndNil(fQry);
  FreeAndNil(fQry2);
  FreeAndNil(fMemTable);
  FreeAndNil(fDataModuleConnection);
end;

function TDataModuleBase.getMemTable : TFDMemTable;
begin
  if fMemTable = nil then
    fMemTable := TFDMemTable.Create(nil);

  Result := fMemTable;
end;

function TDataModuleBase.getQry : TFDQuery;
begin
  if fQry = nil then
  begin
    fQry            := TFDQuery.Create(nil);
    fQry.Connection := fDataModuleConnection.fdConnection;
  end;

  Result := fQry;
end;

function TDataModuleBase.getQry2: TFDQuery;
begin
  if fQry2 = nil then
  begin
    fQry2            := TFDQuery.Create(nil);
    fQry2.Connection := fDataModuleConnection.fdConnection;
  end;

  Result := fQry2;
end;

end.
