const { relatedProduct }= require("../model/related-products.model");
const { product } = require("../model/products.model");

async function addRelatedProducts(params,callback) {
 if(!params.product) {
   return callback({
   message:"product is required"
   });
 }
 if(!params.relatedProducts) {
 return callback({
 message:"Related products is required"
 });
 }

 const relatedProductsModel = new relatedProduct(params);
 relatedProductsModel
 .save()
 .then(async (response) => {
 await product.findOneAndUpdate(
  {
  _id: params.product
  },
  {
  $addToSet: {
  "relatedProducts": relatedProductsModel
  }
  }
  );

  return callback(null,response);
 })
 .catch((error) => {
  return callback(error);
 });

}

async function removeRelatedProduct(params,callback) {
const id = params.id;

relatedProduct.findByIdAndRemove(id)
.then((response) => {
if(!response) {
   callback("product id not found");
}
else{
   callback(nll,response);
}
}

)
.catch((error) => {
 return callback(error)
})
}


module.exports ={
addRelatedProducts,
removeRelatedProduct

}





