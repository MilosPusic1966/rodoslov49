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
