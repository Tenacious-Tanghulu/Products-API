const { Pool, Client } = require('pg')
const pool = new Pool({
  host: 'localhost',
  user: 'sean-macbook',
  
})

pool.on('error', (err, client) => {
  console.error('Unexpected error on idle client', err)
  process.exit(-1)
})

(async () => {
  const client = await pool.connect()
  try {
    const res = await client.query('SELECT * FROM users WHERE id = $1', [1])
    console.log(res.rows[0])
  } finally {
    // Make sure to release the client before any error handling,
    // just in case the error handling itself throws an error.
    client.release()
  }
})().catch(err => console.log(err.stack))