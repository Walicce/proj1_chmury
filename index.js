const http = require('http'); 
const moment = require('moment-timezone'); 
 
// Informacje o autorze serwera 
const authorName = "Nadzeya Simakovich"; 
 
// Tworzenie serwera HTTP 
const server = http.createServer((req, res) => { 
// Wyświetlanie adresu IP klienta 
const ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress; 
res.writeHead(200, {'Content-Type': 'text/html'}); 
res.write(`<h1>Adres IP klienta: ${ip}</h1>`); 
 
// Pobieranie daty i godziny w strefie czasowej klienta 
const date = new Date(); 
const timezone = moment.tz.guess(); 
const localTime = moment.tz(date, timezone).format('YYYY-MM-DD HH:mm:ss'); 
 
res.write(`<h2>Data i godzina w twojej strefie czasowej: ${localTime}</h2>`); 
res.end(); 
}); 
 
// Pobieranie numeru portu z argumentów wiersza poleceń lub ustawianie domyślnego portu 3000 
const port = process.argv[2] || 3000; 
 
 
// Uruchomienie serwera 
server.listen(port, () => { 
// Wyświetlenie informacji o uruchomieniu serwera w logach 
console.log(`Serwer został uruchomiony przez ${authorName} na porcie ${port}.`); 
}); 
