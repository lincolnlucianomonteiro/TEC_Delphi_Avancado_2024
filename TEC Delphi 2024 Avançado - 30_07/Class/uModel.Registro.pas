unit uModel.Registro;

interface

type
  TConfiguracao = record  // Abstra��o
    Host         : string;
    Usuario      : string;
    Senha        : string;
    Database     : string;
    LoginWindows : string;
    Criptografia : string;
  end;

implementation

end.
