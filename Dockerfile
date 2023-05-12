# Etap 1 - Budowanie aplikacji 
FROM node:14-alpine AS builder 
 
# Informacje o autorze Dockerfile 
LABEL maintainer="Nadzeya Simakovich" 
 
# Ustawienie katalogu roboczego 
WORKDIR /app 
 
# Kopiowanie plików aplikacji 
COPY package*.json ./ 
 
# Instalacja zależności 
#RUN npm install 
# Instalacja zależności z wykorzystaniem cache 
RUN --mount=type=cache,target=/proj1_chmury/node_modules npm install 
 
# Kopiowanie reszty plików aplikacji 
COPY index.js ./ 
 
# Etap 2 - Uruchomienie aplikacji na architekturze arm/v7 
FROM --platform=linux/arm/v7 node:14-alpine AS armv7 
 
# Informacje o autorze Dockerfile 
LABEL maintainer="Nadzeya Simakovich" 
 
# Ustawienie katalogu roboczego 
WORKDIR /app 
 
# Skopiowanie plików aplikacji z etapu 1 
COPY --from=builder /app . 
 
# Pobieranie i instalacja moment-timezone 
RUN npm install moment-timezone 
 
# Ustawienie zmiennej środowiskowej 
ENV NODE_ENV=production 
 
# Uruchomienie serwera 
CMD ["node", "index.js"] 
 
# Zdefiniowanie portu 
EXPOSE 3000 
 
# Healthcheck 
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD wget --quiet --tries=1 --spider http://localhost:3000/ || exit 1 
 
# Etap 3 - Uruchomienie aplikacji na architekturze arm64/v8 
FROM --platform=linux/arm64/v8 node:14-alpine AS arm64v8 
 
# Informacje o autorze Dockerfile 
LABEL maintainer="Nadzeya Simakovich" 
 
# Ustawienie katalogu roboczego 
WORKDIR /app 
 
# Skopiowanie plików aplikacji z etapu 1 
COPY --from=builder /app . 
 
# Pobieranie i instalacja moment-timezone 
RUN npm install moment-timezone 
 
# Ustawienie zmiennej środowiskowej 
ENV NODE_ENV=production 
 
# Uruchomienie serwera 
CMD ["node", "index.js"] 
 
# Zdefiniowanie portu 
EXPOSE 3000 
 
# Healthcheck 
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD wget --quiet --tries=1 --spider http://localhost:3000/ || exit 1 
 
# Etap 4 - Uruchomienie aplikacji na architekturze amd64 
FROM --platform=linux/amd64 node:14-alpine AS amd64 
 
# Informacje o autorze Dockerfile 
LABEL maintainer="Nadzeya Simakovich" 
 
# Ustawienie katalogu roboczego 
WORKDIR /app 
 
# Skopiowanie plików aplikacji z etapu 1 
COPY --from=builder /app . 
 
# Pobieranie i instalacja moment-timezone 
RUN npm install moment-timezone 
 
# Ustawienie zmiennej środowiskowej 
ENV NODE_ENV=production 
 
# Uruchomienie serwera 
CMD ["node", "index.js"] 
 
# Zdefiniowanie portu 
EXPOSE 3000 
 
# Healthcheck 
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD wget --quiet --tries=1 --spider http://localhost:3000/ || exit 1 