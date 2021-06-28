const express = require('express')
const app = express()
const port = 3000

app.use(express.json());

app.get('/products', (req, res) =>{
  res.status(200).send('Products');
})

app.get('/products/:product_id', (req, res) => {
  res.status(200).send('Product ID');
})

app.get('/products/:product_id/styles', (req, res) => {
  res.status(200).send('Styles');
})

app.get('/products/:products_id/related', (req, res) => {
  res.status(200).send('Related');
})




app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})