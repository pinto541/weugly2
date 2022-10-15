const mongoose = require("mongoose");

const relatedProduct = mongoose.model(
     "Relatedproduct",
       mongoose.Schema(
           {
            product: {
                   type: mongoose.Schema.Types.ObjectId,
            ref:"Product"

   },
      relatedProduct: {
            type: mongoose.Schema.Types.ObjectId,
             ref: "Product"

}
},
{
    toJSON:{
            transform:function(doc, ret) {
        delete ret.id;
        delete ret._v;
   },
},
    timestamps: true
    }
    )
);


module.exports ={

    relatedProduct,


}
