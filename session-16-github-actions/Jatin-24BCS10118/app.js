const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/api/health', (req, res) => {
  res.status(200).json({ status: 'UP', timestamp: new Date().toISOString() });
});

app.get('/api/info', (req, res) => {
  res.status(200).json({
    app: 'DevOps CI/CD Demo App',
    student: 'Jatin',
    enrollment: '24BCS10118',
    environment: process.env.NODE_ENV || 'production'
  });
});

if (require.main === module) {
  app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
}

module.exports = app;
