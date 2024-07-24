unit uManagerForm;

interface

uses
  System.Classes, Vcl.Forms;

type
  TManagerForm = class
    class procedure setShowForm(const pNomeClasse : string);
  end;

implementation

class procedure TManagerForm.setShowForm(const pNomeClasse : string);
var
  vPersistentClass : TPersistentClass;
  vForm            : TForm;
begin
  vPersistentClass := FindClass(pNomeClasse);

  if Assigned(vPersistentClass) then
  begin
    vForm := TFormClass(vPersistentClass).Create(nil);

    try
      vForm.ShowModal;
    finally
      vForm.Free;
    end;
  end;
end;

end.
