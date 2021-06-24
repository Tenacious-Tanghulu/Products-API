const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:3000', {useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false})

const db = mongoose.connection;

//sub schema for Product Info features
const featureSchema = mongoose.Schema({
  feature: String,
  value: String
})
const Feature = mongoose.model('Feature', featureSchema);



//sub for ProductInfo
const skuSchema = mongoose.Schema({
  [Number]: {
    quantity: Number
    size: String
  }
})
const SKU = mongoose.model('SKU', skuSchema);

//sub for ProductInfo
const styleSchema = mongoose.Schema({
  style_id: Number,
  name: String,
  original_price: String,
  sale_price: String,
  default?: Boolean,
  photos:[],
  skus:{SKU}
})
const Style = mongoose.model('Style', styleSchema);

//Detailed product info
const productSchema = mongoose.Schema({
  id: Number,
  name: {required: true, type: String}, //validation 
  slogan: String,
  description: String,
  category: String,
  default_price: String,
  features: [Feature], //sub to Feature
  styles: {Style}, //sub to style
})

const Product = mongoose.model('Product', productSchema);







/*




Get PRODUCT INFO

{
    "id": 11,
    "name": "Air Minis 250",
    "slogan": "Full court support",
    "description": "This optimized air cushion pocket reduces impact but keeps a perfect balance underfoot.",
    "category": "Basketball Shoes",
    "default_price": "0",
    "features": [
  	{
            "feature": "Sole",
            "value": "Rubber"
        },
  	{
            "feature": "Material",
            "value": "FullControlSkin"
        }
    ]
}


Get /products -

[
  {
        "id": 1,
        "name": "Camo Onesie",
        "slogan": "Blend in to your crowd",
        "description": "The So Fatigues will wake you up and fit you in. This high energy camo will have you blending in to even the wildest surroundings.",
        "category": "Jackets",
        "default_price": "140"
    }
]
*/

//SKU

//