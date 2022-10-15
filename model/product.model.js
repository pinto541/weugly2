const mongoose = require("mongoose");

 const product = mongoose.model(
      "Product",
       mongoose.Schema(
       {
                productName: {
              type:String,
              required:true,
             unique: true,
              },

         category:{
            type: mongoose.Schema.Types.objectId,
               ref: "category",
           productShortDescription:{
             type: string,
              required: true
},

   productDescription: {
    type: string,
   required: false

},
    productPrice: {
      type:Numbe,
    /////

    productImage: {
  type:string

},
  productSKU:  {

    type:string,
     required: false
},
    productType:{
        type: string,
        required: true,
         default: "simple"




},


 stockStatus: {
    type: string,
    default:"IN"

},

relatedProducts: [
{
     type: mongoose.Schema.Types.ObjectId,
     ref: "Related Product"
}
]

},
{ toJSON

{
 tranform: function(doc,ret) {
  ret.productId = ret_id.tostring();
   delete ret._id;
  delete ret._v;
}

}
})
