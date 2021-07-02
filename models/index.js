const db = require('../db');
const help = require('../helpers/helperindex.js')

const getProducts = (req, res) => {


if (req.query.product_id) {
  db.query(`SELECT product.id, product.name, product.slogan, product.description, product.category, product.default_price, features.feature, features.value from product INNER JOIN features ON product.id = features.products_id WHERE product.id = ${req.query.product_id};`)
  .then(({rows})=> {
    const feats = help.getFeatures(rows);
    let data = {
      id: rows[0].id,
      name: rows[0].name,
      slogan: rows[0].slogan,
      description: rows[0].description,
      category: rows[0].category,
      default_price: rows[0].default_price,
      features: feats
    }
    res.status(200).send(data);
    })
  .catch((err) => console.log(err));
} else {
const count = req.query.count || 5;
  let page = req.query.page || 1;
  if (page > 0) {
    page--;
  }
  db.query(`Select * from product LIMIT ${count} OFFSET ${page * count};`)
    .then(({rows}) => res.send(rows))
    .catch((err) => console.log(err))
  }
}

const getStyles = (req, res) => {

  db.query(`SELECT * FROM styles LEFT JOIN photos ON styles.id = photos.styles_id LEFT JOIN skus ON styles.id = skus.styleId WHERE styles.products_id = ${req.params.product_id};`)
    .then(({rows})=> {
      let result = {
        product_id: req.params.product_id,
        results: help.getStyles(rows)
      }
      res.status(200).send(result)
      return rows})
    .catch((err)=> console.log(err));
}


const getRelated = (req, res) => {
  res.status(200).send('Related');
}


module.exports = {
  getProducts: getProducts,
  getStyles: getStyles,
  getRelated: getRelated
}