use Rodoslov49
-- prikazi podatke o mami osobe sa ID=1
SELECT ime, prezime, pol 
FROM Osoba
WHERE ID= 
(SELECT ID_mama FROM Osoba WHERE ID=1)

-- podaci o babi po tati osobe sa id=1
SELECT ime, prezime
FROM Osoba WHERE ID=(
SELECT ID_mama FROM Osoba WHERE ID=
(SELECT ID_tata FROM Osoba WHERE ID=1)
)
-- deca date osobe
SELECT * FROM Osoba WHERE
ID_tata = 8 OR ID_mama = 8

-- braca i sestre date osobe
SELECT * FROM Osoba WHERE ID_tata = 
(SELECT ID_tata FROM Osoba WHERE ID=8)
AND NOT ID=8

CREATE FUNCTION Roditelj (@ID INT, @pol CHAR)
RETURNS INT
AS
BEGIN
DECLARE @Rezultat INT
  IF @pol='m' SET @Rezultat= (
  SELECT ID_tata FROM Osoba 
  WHERE ID=@ID)
  ELSE
  SET @Rezultat=
  (SELECT ID_mama FROM Osoba 
  WHERE ID=@ID) 
  RETURN @Rezultat
END

SELECT * FROM Osoba WHERE ID=dbo.Roditelj(1, 'z')
SELECT * FROM Osoba WHERE 
ID=dbo.Roditelj(dbo.roditelj(1,'z'),'m')

CREATE FUNCTION Deca(@ID INT)
RETURNS TABLE
AS
RETURN SELECT ID FROM Osoba
WHERE ID_tata = @ID OR ID_mama = @ID

SELECT * FROM Osoba WHERE ID IN 
(SELECT * FROM dbo.Deca(8))

-- domaci: unuci date osobe - Panjevac
SELECT ID FROM Osoba WHERE ID_tata IN
(SELECT ID FROM dbo.Deca(13)) 
OR
ID_mama IN
(SELECT ID FROM dbo.Deca(13)) 


UPDATE Osoba 
SET Pol='m' WHERE ID IN 
(SELECT DISTINCT id_tata FROM Osoba) 
 
CREATE PROCEDURE sredi
AS
BEGIN
UPDATE Osoba 
SET Pol='m' WHERE ID IN 
(SELECT DISTINCT id_tata FROM Osoba) 
UPDATE Osoba 
SET Pol='z' WHERE ID IN 
(SELECT DISTINCT id_mama FROM Osoba) 
END

EXEC sredi

-- anini ujaci
-- baba = roditelj(roditelj(1, z), z)
-- deca(baba) and pol=m
SELECT * FROM Osoba WHERE ID IN 
(SELECT * FROM dbo.Deca(dbo.roditelj(dbo.roditelj(1, 'z'), 'z')))
AND pol='m'
