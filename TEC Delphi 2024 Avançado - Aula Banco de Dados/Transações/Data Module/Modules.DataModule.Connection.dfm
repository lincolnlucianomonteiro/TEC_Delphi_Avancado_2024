object DataModuleConnection: TDataModuleConnection
  OldCreateOrder = True
  Height = 480
  Width = 640
  object fdConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Administrador\Desktop\Banco de Dados\Cliente\C' +
        'LIENTE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=ISO8859_1'
      'DriverID=FB')
    LoginPrompt = False
    Left = 224
    Top = 184
  end
end
