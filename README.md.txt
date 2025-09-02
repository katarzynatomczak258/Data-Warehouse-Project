# Projekt Hurtowni Danych i Kostki Analitycznej OLAP

Celem projektu było stworzenie kompletnego rozwiązania, od surowych danych po działającą kostkę analityczną umożliwiającą analizę danych dotyczących ruchu granicznego.

### Użyte narzędzia
*Visual Studio, SQL Server Management Studio (SSMS)

### Struktura Kostki Analitycznej
Kostka OLAP została zbudowana w oparciu o tabelę faktów oraz cztery wymiary:
*`CZAS`- pozwala na analizę w zależności od jednostki czasu ( miesiąc, kwartał, rok)
*`MIEJSCE`pozwala na analizę po miejscu (przejście graniczne, odcinek granicy, region)
*`ZMIENNA`pozwala na filtrowanie analizowanych wskaźników
*`JEDNOSTKA MIARY` pozwala na analizę według jednostek miary

### Jak uruchomić projekt?
1.  Uruchom skrypt `Hurtowania_kodSQL.sql` z folderu `/SQL script/` na serwerze SQL, aby stworzyć i załadować hurtownię danych.
2.  Otwórz rozwiązanie `Hurtownia_Danych_AD.sln` z folderu `/Visual Studio/` w programie Visual Studio.
3.  Zaktualizuj połączenie ze źródłem danych, aby wskazywało na Twój lokalny serwer SQL.
4.  Zbuduj (Build) i wdróż (Deploy) projekt na serwerze Analysis Services.

