const db = require('../db');
const help = require('../helpers/getFeatures.js')

const getProducts = (req, res) => {
console.log(req.query);
//figure out page/count params

if (req.query.product_id) {
  db.query(`SELECT product.id, product.name, product.slogan, product.description, product.category, product.default_price, features.feature, features.value from product INNER JOIN features ON product.id = features.products_id WHERE product.id = ${req.query.product_id};`)
  .then(({rows})=> {console.log(rows)
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
const count = req.query.count;
  let page = req.query.page;
  if (page > 0) {
    page--;
  }
  db.query(`Select * from product LIMIT ${count} OFFSET ${page * count};`)
    .then(({rows}) => res.send(rows))
    .catch((err) => console.log(err))
}
}

const getProductDetail = (req, res) => {


}

const getStyles = (req, res) => {

}

const getRelated = (req, res) => {

}


module.exports = {
  getProducts: getProducts,
  getProductDetail: getProductDetail,
  getStyles: getStyles,
  getRelated: getRelated
}