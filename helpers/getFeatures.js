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
module.exports = {getFeatures: getFeatures}
