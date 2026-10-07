const request = require('supertest');
const app = require('./app');

describe('CI Automated Test Suite', () => {
  it('GET /api/health should return 200 and status UP', async () => {
    const res = await request(app).get('/api/health');
    expect(res.statusCode).toEqual(200);
    expect(res.body.status).toEqual('UP');
  });

  it('GET /api/info should return student details', async () => {
    const res = await request(app).get('/api/info');
    expect(res.statusCode).toEqual(200);
    expect(res.body.student).toEqual('Jatin');
    expect(res.body.enrollment).toEqual('24BCS10118');
  });
});
