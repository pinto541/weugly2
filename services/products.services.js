const { product}= require("../model/products.model");
const { category}= require("../model/category.model");
const { MONGO_DB_CONFIG }= require("../model/products.model");

async function createProduct(params, callback) {
       if(!params.productName){
       return callback(
        {
          message:"Product Name required",
         },
       );
       }

       if(!params.productName){
              return callback(
               {
                 message:"Product Name required",
                },
              );
              }

              const productModel = new product(params);
              productModel.save()
                         .then((response) => {
                         return callback(null,response);
                         })
                         .catch((error) => {
                          return callback(error);
                         }
                         );
}


async function getProducts(params,callback) {
 const productName = params.productName;
 const categoryID = params.categoryID;
 var condition= {};

 if(productName) {
   condition["productName"] = {
     $regex: new RegExp(productName), $options: "i"

   }

 };

if(categoryID){
 condition["categoryID"] = categoryID;
}

if(params.productIds) {
 condition ["-id"] = {
 $in: params.productIds.split(",")
 };

}
   let perPage = Math.abs(params.pageSize)  || MONGO_DB_CONFIG.PAGE_SIZE;
   let page = (Math.abs(params.page) || 1) -1;

   product
   .find(condition, " productID productName productShortDescription productDescription productPrice productSalePrice productImage productImage productSKU productType stockStatus createdAt updatedAt")
   .sort(params.sort)
   .populate("category", "categoryName categoryImage")
    .populate("relatedProducts" , "relatedProduct")
   .limit(perPage)
   .skip(perPage = page)
   .then((response) => {

   var res = response.map(r => {
         if(r.related.products.length>0) {
         r.relatedProducts =r.relatedProducts.map(x=>r.relatedProduct);
         }
         return r;
         });
   return callback(null, response);
   })
   .catch((error) => {


      return callback(error);
   }
   );
}

async function getProducts(params,callback) {
 const productName = params.productName;
 const categoryID = params.categoryID;
 var condition= {};

 if(productName) {
   condition["productName"] = {
     $regex: new RegExp(productName), $options: "i"

   }

 };

if(categoryID){
 condition["categoryID"] = categoryID;
}
   let perPage = Math.abs(params.pageSize)  || MONGO_DB_CONFIG.PAGE_SIZE;
   let page = (Math.abs(params.page) || 1) -1;

   product
   .find(condition, " productID productName productShortDescription productDescription productPrice productSalePrice productImage productImage productSKU productType stockStatus")
   .populate("category", "categoryName categoryImage")
    .populate("relatedProducts" , "relatedProduct")
   .limit(perPage)
   .skip(perPage = page)
   .then((response) => {



            response.relatedProducts =response.relatedProducts.map(x=>{return r.relatedProduct});

   return callback(null, response);
   })
   .catch((error) => {
      return callback(error);
   }
   );
}

async function getProducts(params,callback) {
 const productName = params.productName;
 const categoryID = params.categoryID;
 var condition= {};

 if(productName) {
   condition["productName"] = {
     $regex: new RegExp(productName), $options: "i"

   }

 };

if(categoryID){
 condition["categoryID"] = categoryID;
}
   let perPage = Math.abs(params.pageSize)  || MONGO_DB_CONFIG.PAGE_SIZE;
   let page = (Math.abs(params.page) || 1) -1;

   product
   .find(condition, " productID productName productShortDescription productDescription productPrice productSalePrice productImage productImage productSKU productType stockStatus")
   .populate("category", "categoryName categoryImage")
   .limit(perPage)
   .skip(perPage = page)
   .then((response) => {
   return callback(null, response);
   })
   .catch((error) => {
      return callback(error);
   }
   );
}

async function getProducts(params,callback) {
 const productName = params.productName;
 const categoryID = params.categoryID;
 var condition= {};

 if(productName) {
   condition["productName"] = {
     $regex: new RegExp(productName), $options: "i"

   }

 };

if(categoryID){
 condition["categoryID"] = categoryID;
}
   let perPage = Math.abs(params.pageSize)  || MONGO_DB_CONFIG.PAGE_SIZE;
   let page = (Math.abs(params.page) || 1) -1;

   product
   .find(condition, " productID productName productShortDescription productDescription productPrice productSalePrice productImage productImage productSKU productType stockStatus createdAT updatedAt")
   .populate("category", "categoryName categoryImage")
   .sort(params.sort)
   .limit(perPage)
   .skip(perPage = page)
   .then((response) => {
   return callback(null, response);
   })
   .catch((error) => {
      return callback(error);
   }
   );
}

async function getProductName(params,callback) {
 const productName = params.productName;
 const categoryID = params.categoryID;
  var condition= {};

  if(productName) {
    condition["productName"] = {
      $regex: new RegExp(productName), $options: "i"

    }

  };

 if(categoryID){
  condition["categoryID"] = categoryID;
 }
    let perPage = Math.abs(params.pageSize)  || MONGO_DB_CONFIG.PAGE_SIZE;
    let page = (Math.abs(params.page) || 1) -1;



   product


   .find(condition, " productID productName productShortDescription productDescription productPrice productSalePrice productImage productImage productSKU productType stockStatus")
   .populate("category", "categoryName categoryImage")
   .limit(perPage)
   .skip(perPage = page)

   .then((response) => {
   return callback(null, response);
   })
   .catch((error) => {
      return callback(error);
   }
   );
}

async function getProductById(params,callback) {
 const productId = params.productName;


   product
   .findById(productId )
   .populate("category", "categoryName categoryImage")
   .then((response) => {
   return callback(null, response);
   })
   .catch((error) => {
      return callback(error);
   }
   );

}


async function updateProduct(params,callback) {
 const productId = params.productName;

   product
   .findByIdAndUpdate(productId,params,{useFindAndModify: false})

   .then((response) => {
   if(!response) {
     callback('cannot update Product with id ${productId}')
   }

   else callback(null, response);
   })
   .catch((error) => {
      return callback(error);
   }
   );
}

async function deleteProduct(params,callback) {
 const productId = params.productName;

   product
   .findByIdAndUpdate(productId,params,{useFindAndModify: false})

   .then((response) => {
   if(!response) {
     callback('cannot update Product with id ${productId}')
   }

   else callback(null, response);
   })
   .catch((error) => {
      return callback(error);
   }
   );
}

  module.exports= {
     createProduct,
     getProducts,
     getProductById,
     updateProduct,
     deleteProduct
  }
