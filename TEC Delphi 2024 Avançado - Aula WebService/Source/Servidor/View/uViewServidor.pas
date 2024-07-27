unit uViewServidor;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp,
  Vcl.WinXCtrls, Vcl.ExtCtrls;

type
  TViewServidor = class(TForm)
    edtPorta: TEdit;
    lblPorta: TLabel;
    ApplicationEvents: TApplicationEvents;
    ToggleSwitch: TToggleSwitch;
    pnlStatus: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure ToggleSwitchClick(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure setAtivar;
    procedure setDesativar;
  end;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession;

procedure TViewServidor.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  edtPorta.Enabled := not FServer.Active;
end;

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TViewServidor.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
  ToggleSwitchClick(ToggleSwitch);
end;

procedure TViewServidor.setAtivar;
begin
  if not FServer.Active then
  begin
    FServer.Bindings.Clear;
    FServer.DefaultPort := StrToInt(edtPorta.Text);
    FServer.Active := True;
  end;
end;

procedure TViewServidor.setDesativar;
begin
  FServer.Active := False;
  TerminateThreads;
  FServer.Bindings.Clear;
end;

procedure TViewServidor.ToggleSwitchClick(Sender: TObject);
begin
  if TToggleSwitch(Sender).State = tssOff then
  begin
    pnlStatus.Caption := 'Servidor Offline';
    TToggleSwitch(Sender).ThumbColor := clRed;
    setDesativar;
  end
  else
  begin
    setAtivar;
    TToggleSwitch(Sender).ThumbColor := clGreen;
    pnlStatus.Caption := 'Servidor Online';
  end;

  pnlStatus.Font.Color := TToggleSwitch(Sender).ThumbColor;
end;

end.
