var http = require("http");
var port = 8080;
var now = new Date();
http
    .createServer(function (req, res) {
        res.writeHead(200, { "Content-Type": "text/plain" });
        res.write("Hola Mundo DevOps - Saluda Jhostyn Benalcázar\n");
        res.write("Fecha del servidor: " + now.toGMTString());
    })
    .listen(port, "");
console.log("Server running at port: " + port);