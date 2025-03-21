import * as express from "express";
import * as path from "path";
import * as http from "http";
import * as fs from "fs";

const app = express();
const socketPath = '/tmp/frontend.sock';

app.set('views', path.join(__dirname, '/'));
app.set('view engine', 'jade');

// const port: number = 3000;
const backendUrl = "http://backend:3001";

app.get('/', async (req, res) => {
    const cat_data = await fetch(`${backendUrl}/cat_get`);
    const data = await cat_data.text();

    res.render('index.jade', { title: "KIT Frontend", cat_url: data });
});

if (fs.existsSync(socketPath)) {
    fs.unlinkSync(socketPath);
  }
  
const server = http.createServer(app);

server.listen(socketPath, () => {
console.log(`Server listening on socket ${socketPath}`);
// Set permissions as required
fs.chmodSync(socketPath, '777');
});

// Handle server errors
server.on('error', (error) => {
console.error('Server error:', error);
});