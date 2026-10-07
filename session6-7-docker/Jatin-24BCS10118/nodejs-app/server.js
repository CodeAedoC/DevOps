const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send(`
    <!DOCTYPE html>
    <html>
      <head><title>Node.js Docker Demo</title></head>
      <body style="font-family: Arial, sans-serif; background: #0f172a; color: #f8fafc; text-align: center; padding: 50px;">
        <h1 style="color: #38bdf8;">Hello World from Node.js Docker App!</h1>
        <p>Student: Jatin (24BCS10118)</p>
        <p>Container Status: Running smoothly 🚀</p>
      </body>
    </html>
  `);
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server is running on http://0.0.0.0:${PORT}`);
});
