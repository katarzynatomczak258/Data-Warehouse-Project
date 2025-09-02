-- Plik przedstawia proces tworzenia struktury hurtowni danych.

-- Krok 1. Stworzenie tabel wymiarów. Dane s¹ pobierane z arkusza Arkusz1$.
-- Stworzenie czterech oddzielnych tabeli dla wymiarów: Czas, Miejsce, Jednostka Miary i Zmienna.
-- U¿ycie SELECT DISTINCT zapewnia, ¿e w tabelach wymiarów nie bêdzie duplikatów.

-- CZAS --
SELECT DISTINCT 
[id_czas_pk],
[rok],
[kwartal],
[kwartal_nazwa],
[miesiac],
[miesiac_nazwa]
INTO CZAS 
FROM [BazaOperacyjna_HD].[dbo].[Arkusz1$]

-- MIEJSCE --
SELECT DISTINCT 
[id_miejsce_pk],
[region],
[odcinek_granicy],
[przejœcie_graniczne]
INTO MIEJSCE 
FROM [BazaOperacyjna_HD].[dbo].[Arkusz1$]

--JEDNOSTKA MIARY--
SELECT DISTINCT 
[id_jednostka_miary_pk],
[nazwa_jednostki_miary],
[symbol_jednostki_miary],
[opis_jednostki_miary],
[mnoznik_jednostki_miary]
INTO JEDNOSTKA_MIARY 
FROM [BazaOperacyjna_HD].[dbo].[Arkusz1$]

-- ZMIENNA
SELECT DISTINCT 
[id_zmienna_pk],
[nazwa_zmiennej],
[rodzaj_zmiennej],
[opis]
INTO ZMIENNA
FROM [BazaOperacyjna_HD].[dbo].[Arkusz1$]
Go


-- Krok 2. Definiowanie kluczy g³ównych (PRIMARY KEY) na kolumnach (id_*_pk) w ka¿dej z czterach tabeli wymiarów stworzonych w poprzednim kroku.
-- Jest to niezbêdna czêœæ do zapewnienia integralnoœci danych.

ALTER TABLE CZAS ALTER COLUMN id_czas_pk FLOAT NOT NULL

GO
ALTER TABLE CZAS ADD PRIMARY KEY (id_czas_pk)

GO
ALTER TABLE JEDNOSTKA_MIARY ALTER COLUMN id_jednostka_miary_pk FLOAT NOT NULL

GO 
ALTER TABLE JEDNOSTKA_MIARY ADD PRIMARY KEY (id_jednostka_miary_pk)

GO
ALTER TABLE MIEJSCE ALTER COLUMN id_miejsce_pk FLOAT NOT NULL

GO
ALTER TABLE MIEJSCE ADD PRIMARY KEY (id_miejsce_pk)

GO
ALTER TABLE ZMIENNA ALTER COLUMN id_zmienna_pk FLOAT NOT NULL

GO 
ALTER TABLE ZMIENNA ADD PRIMARY KEY (id_zmienna_pk)

GO


-- Krok 3. Stworzenie pustej tabeli faktów (TFAKT). Zdefiniowanie w niej kluczy obcych (FOREIGN KEY), które ³¹cz¹ j¹ z kluczami g³ównymi tabel wymiarów.

CREATE TABLE TFAKT (
[ID_CZAS] FLOAT FOREIGN KEY (ID_CZAS) REFERENCES CZAS(ID_CZAS_PK),
[ID_MIEJSCE] FLOAT FOREIGN KEY (ID_MIEJSCE) REFERENCES MIEJSCE(ID_MIEJSCE_PK),
[ID_ZMIENNA] FLOAT FOREIGN KEY (ID_ZMIENNA) REFERENCES ZMIENNA(ID_ZMIENNA_PK),
[ID_JEDNOSTKA_MIARY] FLOAT FOREIGN KEY (ID_JEDNOSTKA_MIARY) REFERENCES JEDNOSTKA_MIARY(ID_JEDNOSTKA_MIARY_PK),
[WARTOSC] FLOAT
)
GO


-- Krok 4. Wstawienie danych do tabeli faktów, pobieraj¹c odpowiednie kolumny z oryginalnego arkusza.
-- Weryfikacja poprawnoœci za³adowania danych za pomoc¹ zapytania salact count(*).

INSERT INTO [BazaOperacyjna_HD].[dbo].[TFAKT]
SELECT
[ID_CZAS],
[ID_MIEJSCE],
[ID_ZMIENNA],
[ID_JEDNOSTKA_MIARY],
[WARTOSC]
FROM [BazaOperacyjna_HD].[dbo].[Arkusz1$]
select count(*) from [BazaOperacyjna_HD].[dbo].[TFAKT]
