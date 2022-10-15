const categoryController = require("../controller/categories.controller");
const productController = require("../controller/products.controller");
const relatedProductController = require("../controller/related-products.controller");


const express = require("express");
const router = express.Router();


router.post("/category",categoryController.create);
router.get("/category",categoryController.findAll);
router.get("/category/:id",categoryController.findOne);
router.put("/category/:id",categoryController.update);
router.delete("/category/:id",categoryController.delete);

router.post("/product",productController.create);
router.get("/products",productController.findAll);
router.get("/product/:id",productController.findOne);
router.put("/product/:id",productController.update);
router.delete("/product/:id",productController.delete);



router.post("/relatedProduct",relatedProductController.create);
router.delete("/relatedProduct/:id",relatedProductController.delete);
module.exports = router;