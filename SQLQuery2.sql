use Rodoslov49
-- prikazi podatke o mami osobe sa ID=1
SELECT ime, prezime, pol 
FROM Osoba
WHERE ID= 
(SELECT ID_mama FROM Osoba WHERE ID=1)
