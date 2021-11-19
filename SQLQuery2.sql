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

