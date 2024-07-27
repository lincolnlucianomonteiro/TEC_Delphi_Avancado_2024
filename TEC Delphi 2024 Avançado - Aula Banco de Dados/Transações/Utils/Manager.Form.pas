unit Manager.Form;

interface

uses
  System.Classes, Vcl.Forms, System.SysUtils;

type
  TManagerForm = class
    class procedure setShowForm(const pClassName : string);
  end;

implementation

class procedure TManagerForm.setShowForm(const pClassName : string);
var
	vPersistentClass : TPersistentClass;
	vForm            : TForm;
begin
  vPersistentClass := FindClass(pClassName);

  if Assigned(vPersistentClass) then
  begin
    vForm := TFormClass(vPersistentClass).Create(nil);

    try
      vForm.ShowModal;
    finally
      FreeAndNil(vForm);
    end;
  end;
end;

end.
