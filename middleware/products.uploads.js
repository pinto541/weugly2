const multer = require("multer");
const path = require("path");

const storage = multer.diskStorage(

{

destination: function(res,file,cb) {
cb(null,"./uploads/products");
},

fileName:function(res,file,cb) {
cb(null,Date.now() +"-"+file.originalname);

}

}
);



const fileFilter = (req,file,callback) => {
   const validExts = [".png",".jpg",".jpeg"];
   if(!validExts.includes(Path.extname(file.originalname))) {
       return callback(new Error("only .png, .jpg and .jpeg format only allowed"));
   }
   const fileSize = parseInt(req.headers["content-length"]);

   if(fileSize > 1048576) {

      return callback(new Error("File Size Big"));
      }

      callback(null,true);
}


let upload = multer({
  storage: storage,
   fileFilter: fileFilter,
   fileSize:1048576
});


module.exports = upload.single("productImage");