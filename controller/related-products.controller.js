const relatedProductsServices = require("../services/related-products.services");


exports.create = (req,res,next) => {

   if(error) {
     return next(error);
     }

     return res.status(200).send({
      message: "success",
      data: results
     })

}

exports.delete = (req,res,next) => {
      var model = {
      id:req.params.id,
      };

      relatedProductsServices.removeRelatedProduct(model , (error,results)  =>{

         if(error)
         {
         return next(error);
         }

         else{

           return res.status(200).send({
           message: "success",
           data:results

           })
         }



})
};