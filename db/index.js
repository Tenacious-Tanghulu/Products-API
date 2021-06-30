const { Pool, Client } = require('pg')
const pool = new Pool({
  user: 'sean-macbook',
  host: 'localhost',
  database: 'product'
})

pool.on('error', (err, client) => {
  console.error('Unexpected error on idle client', err)
  process.exit(-1)
})

;(async () => {
  const client = await pool.connect()
  try {
    const res = await client.query('SELECT * FROM product WHERE id = $1', [22])
    console.log(res.rows[0])
  } finally {
    client.release()
  }
})().catch(err => console.log(err.stack))





module.exports = {
  query: (text, params) => pool.query(text, params),
}