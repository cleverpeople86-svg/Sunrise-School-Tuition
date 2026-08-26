import pg from 'pg';
const client = new pg.Client({ connectionString: process.env.DATABASE_URL, ssl: { rejectUnauthorized: false } });
await client.connect();
const result = await client.query('SELECT NOW() AS database_time');
console.log(result.rows[0]);
await client.end();
