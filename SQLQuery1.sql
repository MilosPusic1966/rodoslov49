CREATE DATABASE Rodoslov49
USE Rodoslov49
CREATE TABLE Osoba(
ID INT IDENTITY(1,1),
Ime NVARCHAR(20),
Prezime NVARCHAR(30),
ID_mama INT,
ID_tata INT,
Pol CHAR
)

