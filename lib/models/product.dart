import 'package:freezed_annotation/freezed_annotation.dart';
import 'category.dart';
import 'package:untitled/sizeconfig.dart';
part 'product.freezed.dart';
part 'product.g.dart';



List<Product>productFromJson(dynamic str) =>
    List<Product>.from((str).map((x) => Product.fromJson(x)));

@freezed
abstract class Product with _$Product {

  factory Product({
    required String productName,
    required Category category,
    required String productShortDescription,
    required double productPrice,
    required double productSalePrice,
    required String productImage,
    required String productSKU,
    required String productType,
    required String stockStatus,
    required String productId,

  }) = _Product;


  factory Product.fromJson(Map<String, dynamic >json) =>
  _$ProductFromJson(json);


}

extension ProductExt on Product {

  String get fullImagePath => sizeconfig.imageURL + productImage;


  int get calculatedDiscount {

    double disPercent =0;

    if(!productPrice.isNaN) {
      double regularPrice = productPrice;
      double salePrice = productSalePrice >0 ? productSalePrice :regularPrice;

      double discount = productSalePrice-regularPrice;
      disPercent = (discount / regularPrice) *100;
    }
    return disPercent.round();
  }

}


