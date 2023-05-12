# proj1_chmury

Zadanie dodatkowe numer 2,5


1. Polecenie do budowania obrazów kontenera z aplikacją, które pracują na architekturach:
linux/arm/v7, linux/arm64/v8 oraz linux/amd64 wykorzystując sterownik docker- container.
Sterownik docker-container jest automatycznie używany, jeśli Docker Engine jest w wersji 20.10 lub nowszej.

<b>docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64/v8 -t nadzeyas/projekt1 . </b>

Zeby uruchomic kontener należy użyć polecenia:

<b>docker run -p 3000:3000 nadzeyas/projekt1</b>

2.Umożliwienie wykorzystania danych cache w procesie budowania obrazu (deklaracje wewnątrz Dockerfile).

Etap 1 - Dockerfile

<img width="50" height="50" alt="Zrzut ekranu 2023-05-12 o 21 18 09" src="https://github.com/Walicce/proj1_chmury/assets/60614660/98a7b762-858c-4ae6-9fb8-54e5d0780c83">





































![4k0w7k3a0t461](https://github.com/Walicce/proj1_chmury/assets/60614660/55dba286-a76e-47b0-b381-9dc544908470)
