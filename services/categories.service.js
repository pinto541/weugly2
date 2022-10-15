const  { category } = require("../model/category.model");

async function createCategory(params, callback) {

   if(!params.categoryName) {
         return callback({
               message: "category Name Required"

              }, ""  );
}


const model = new category(params);
model
      .save()
      .then((response) => {
                  return callback(null,response);

                 })
              .catch((error) => {
                     return callback(error);

});
}


async function getCategories(params, callback) {
    const categories = params.categoryName;
    var condition = categoryName
    ? {
          categoryName: { $regex: new RegExp(categoryName), $options: "i" },
      }
     : {};

         let perPage = Math.abs(params.perSize)  || MONGO_DB_CONFIG.pageSize;
          let Page = (Math.abs(params.page)  ||  1) -1;

             category
                  .find(condition , " categoryName categoryImage")
                  .limit(perPage)
                  .skip(perPage * page)
                   .then((response) => {
                  return callback(null,response);

                 })
              .catch((error) => {
                     return callback(error);

});
}





async function getCategoryById(params, callback) {
    const categoryId = params.categoryId;

             category
                  .findById(condition , " categoryName categoryImage")

                   .then((response) => {
                  if(!response) callback("Not Found Category with Id" + categoryId);
                  else callback(null,response);

                 })
              .catch((error) => {
                     return callback(error);

});
}


async function updateCategory(params, callback) {
    const categoryId = params.categoryId;



             category
                  .findByIdAndUpdate(categoryId,params, { useFindModify: false})
                   .then((response) => {
                   if(!response) callback("Not Found Category with Id" + categoryId);
                  else callback(null,response);

                 })
              .catch((error) => {
                     return callback(error);

});
}


async function deleteCategory(params, callback) {
    const categoryId = params.categoryId;



             category
                  .findByIdAndDelete(categoryId,params, { useFindModify: false})
                   .then((response) => {
                   if(!response) callback("Not Found Category with Id" + categoryId);
                  else callback(null,response);

                 })
              .catch((error) => {
                     return callback(error);

});
}

module.exports = {
 createCategory,
 getCategories,
 getCategoryById,
 updateCategory,
 deleteCategory
};


