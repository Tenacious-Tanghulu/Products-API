const express = require('express')
const app = express()
const port = 3000


app.get('/products'){
  res.send('Products');
}

app.get('/products/:product_id') {
  res.send('Product ID');
}

app.get('/products/:product_id/styles') {
  res.send('Styles');
}

app.get('/products/:products_id/related') {
  res.send('Related');
}




app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})