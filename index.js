const express = require('express');
const app = express();
const port = 3000;
const model = require('./models');

app.use(express.json());

app.get('/products', model.getProducts)


app.get('/products/:product_id/styles', (req, res) => {
  res.status(200).send('Styles')
})

app.get('/products/:products_id/related', (req, res) => {
  res.status(200).send('Related')
})




app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
});