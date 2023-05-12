# Zadanie1_Chmury
1.
Po uruchomieniu kodu z pliku "index.js", serwer będzie nasłuchiwał na podanym porcie (domyślnie 3000) i wyświetli na stronie informację o adresie IP klienta oraz datę i godzinę w jego strefie czasowej. W logach zostanie również wyświetlona informacja o uruchomieniu serwera wraz z datą i nazwiskiem autora serwera. 

<img width="946" alt="Zrzut ekranu 2023-05-10 o 12 09 35" src="https://github.com/Walicce/proj1_chmury/assets/60614660/876b6ec9-f265-4af0-aa7a-eb8a1447decc">


2.
Plik Dockerfile, służy do zbudowania kontenera Docker.

Kod zawiera cztery etapy, w których zbudowana zostaje aplikacja w oparciu o system operacyjny Linux w trzech różnych architekturach: arm/v7, arm64/v8 i amd64.

Pierwszy etap jest odpowiedzialny za skopiowanie plików aplikacji, instalację zależności i ustawienie katalogu roboczego.

W drugim, trzecim i czwartym etapie aplikacja jest uruchamiana na odpowiednich architekturach i są instalowane dodatkowe zależności.

W każdym etapie ustawiany jest katalog roboczy, zdefiniowany port oraz dokonywany jest test poprawności działania aplikacji (healthcheck).

Dzięki temu Dockerfile pozwala na wygenerowanie kontenera, który może być uruchomiony na wielu różnych platformach.

3.
a.  Aby zbudować obraz kontenera, należy wykonać polecenie:
Docker build -t proj1_chmury .

<img width="649" alt="Zrzut ekranu 2023-05-10 o 12 06 57" src="https://github.com/Walicce/proj1_chmury/assets/60614660/7eb9f74f-517a-4b4c-8edb-c51bbf7c7c15">

b. Aby uruchomić kontener na podstawie zbudowanego obrazu, należy wykonać polecenie:
Docker run -p 3000:3000 proj1_chmury

<img width="644" alt="Zrzut ekranu 2023-05-10 o 12 08 52" src="https://github.com/Walicce/proj1_chmury/assets/60614660/7a64e050-350f-4a8c-9149-64699ee0f883">

c. Aby uzyskać informacje, które wygenerował serwer w trakcie uruchamiania kontenera, należy wykonać polecenie:
docker logs <nazwa kontenera>
  
<img width="642" alt="Zrzut ekranu 2023-05-10 o 12 11 41" src="https://github.com/Walicce/proj1_chmury/assets/60614660/92c9fc3e-c3d1-4aa5-ab92-3f68dbc45b6c">

d. Aby sprawdzić, ile warstw posiada zbudowany obraz, należy wykonać polecenie:
docker history proj1_chmury
  
<img width="1006" alt="Zrzut ekranu 2023-05-10 o 12 14 22" src="https://github.com/Walicce/proj1_chmury/assets/60614660/2b2c5a97-305f-48af-b6e3-5c92496503ba">





