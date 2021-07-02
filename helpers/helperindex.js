const getFeatures = (arr) =>{

  let result = [];

  arr.forEach(({feature, value}) => {
    result.push({
      feature: feature,
      value: value
    })
  })
  return result;
}






let getStyles = (arr) => {
  let result = [];
  let hold = {};
  let last = arr[0].styleid;
  let photohold = {};

  arr.forEach((obj) => {
      //if its a new style, populate the style
      if (hold[obj.styleid] === undefined) {
        result.push(hold[last]);
        last = obj.styleid;

        hold[obj.styleid] = {
          style_id: obj.styleid,
          name: obj.style_name,
          original_price: obj.original_price,
          sale_price: obj.sale_price,
          "default?": obj.isdefault,
          photos: [],
          skus: {
            [obj.id]: {
              quantity: obj.quantity,
              size: obj.size}}
            }
        }
        if (hold[obj.styleid].skus[obj.id] === undefined) {
            hold[obj.styleid].skus[obj.id] = {
              quantity: obj.quantity,
              size: obj.size
            }
          }
    })


    arr.forEach(({thumbnail, styleid, url}) => {
      let photoObj = [styleid, {
        thumbnail_url: thumbnail,
        url: url
      }]

      let uniquePhoto = JSON.stringify(photoObj);
      if (photohold[uniquePhoto] === undefined) {
        photohold[uniquePhoto] = photoObj;
      }
    })
    result.shift()
    const photobomb = Object.values(photohold);
    photobomb.forEach((val) => {
      result.forEach((style) => {
        if(style.style_id === val[0]) {
          style.photos.push(val[1])
        }
      })
    })
return result;
}




module.exports = {
  getStyles: getStyles,
  getFeatures: getFeatures}
