import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/Products/product_filter.dart';
import 'package:untitled/models/category.dart';
import 'package:untitled/models/pagination.dart';
import 'package:untitled/provider/providers.dart';

import '../components/product_card.dart';
import '../models/product.dart';

class HomeProductsWidget extends ConsumerWidget {
  const HomeProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> list = List<Product>.empty(growable: true);
    list.add(Product(
        productName: "lungi",
         category:  Category(
           categoryName: "pants",
           categoryImage: "",
           categoryId: "123654"
         ),

         productShortDescription: "the great lungi",
        productPrice: 500,
         productSalePrice : 500,
      productImage: "",
        productSKU: "6A-001",
        productType : "single",
         stockStatus : "IN",
        productId: "123456987"
    ));
    return Container(
      color:Colors.white38,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Top Products",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
              ),

            ],

          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: _productsList(ref),
          )
        ],
      ),
    );
  }

  Widget _productsList(WidgetRef ref) {
    final products = ref.watch(homeProductProvider(
      ProductFilterModel(paginationModel: PaginationModel(page:1 , pageSize:10))
    ));
   return products.when(data: (list) {return Widget_buildProductList(list!);},
       error: (_,__) {
    return const Center(child: const Text("ERROR"));
   },
       loading: () => CircularProgressIndicator());
  }

  Widget_buildProductList(List<Product>products) {
    return Container(
      height:200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:products.length,
        itemBuilder: ( context , index) {
          var data = products[index];
          return GestureDetector(
            onTap: () {},
                child: ProductCard(
              model:data,
          )
          );
        },

      )
    );

  }
}
