unit uSeresVivos;

interface

type
  TMamiferos = class
    function getDescricao : string; virtual; abstract;
    function getOutraDescricao : string; virtual; abstract;
  end;

  TAnimais = class(TMamiferos)

  end;

  TCachorro = class(TMamiferos)
    function getDescricao : string; override;
  end;

  THumanos = class(TMamiferos)
    function getDescricao : string; override;
  end;

  TMulheres = class(THumanos)
    function getDescricao : string; override;
  end;

  THomens = class(THumanos)
    function getDescricao : string; override;
  end;

  TDinossauro = class { sealed } (TAnimais)
    function getDescricao : string; override; { final; }

    // sealed - restringe para que a classe não possa ser utilizada como herança nas classes dependentes
    // final  - restringe para que o método não possa ser sobrescrito nas classes dependentes
  end;

  TTiranossauro = class(TDinossauro)
    function getOutraDescricao : string; override;
  end;

implementation

{ TCachorro }

function TCachorro.getDescricao: string;
begin
  Result := 'Cachorro';
end;

{ THumanos }

function THumanos.getDescricao: string;
begin
  Result := 'Humanos';
end;

{ TMulheres }

function TMulheres.getDescricao: string;
begin
  Result := 'Mulheres';
end;

{ THomens }

function THomens.getDescricao: string;
begin
  Result := 'Homens';
end;

{ TDinossauro }

function TDinossauro.getDescricao: string;
begin
  Result := 'Dinossauro';
end;


function TTiranossauro.getOutraDescricao: string;
begin
  Result := 'Tiranossauro 2';
end;

end.
