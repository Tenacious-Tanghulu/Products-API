const express = require('express');
const app = express();
const port = 3000;
const model = require('./models');

app.use(express.json());
app.get('/products', model.getProducts);
app.get('/products/:product_id/styles', model.getStyles);
app.get('/products/:product_id/related', model.getRelated);


app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
});