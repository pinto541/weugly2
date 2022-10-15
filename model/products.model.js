const mongoose = require("mongoose");

const product = mongoose.model(
"product",
      mongoose.Schema(

{
productName:  {
  type: String,
  required: true,
  unique: true,
},
   category: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Category",
    },
    productShortDescription: {
      type: String,
      required:true
    },
    productDescription: {
    type: String,
    required: false
    },
    productPrice: {
     type: Number,
     required: true,

    },
    productSalePrice: {
          type: Number,
         required: true,
         default: 0,
    },
    productImage: {
     type:String
    },
    productSKU: {
    type: String,
    required: false
    },

    productType: {
    type: String,
    required: true,
    default:"simple"
    },
    stockStatus: {
    type: String,
    default:"IN"
    }
},  {
     toJSON:{
     transform: function (doc, ret){
     ret.productID=ret.ID.toString();
     delete ret_id;
     delete ret__v;
     }}
     }

)

);

module.exports ={
product
}