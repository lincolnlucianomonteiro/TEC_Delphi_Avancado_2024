unit uModel.Registro;

interface

type
  TConfiguracao = record  // Abstração
    Host         : string;
    Usuario      : string;
    Senha        : string;
    Database     : string;
    LoginWindows : string;
    Criptografia : string;
  end;

implementation

end.
