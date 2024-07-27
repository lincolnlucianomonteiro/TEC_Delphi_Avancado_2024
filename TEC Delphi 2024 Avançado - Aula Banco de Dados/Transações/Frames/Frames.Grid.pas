unit Frames.Grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frames.Base, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrameGrid = class(TFrameBase)
    DBGrid: TDBGrid;
  private

  end;

var
  FrameGrid: TFrameGrid;

implementation

{$R *.dfm}

end.
