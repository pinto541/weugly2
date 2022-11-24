

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/Products/product_filter.dart';
import 'package:untitled/Products/product_sort.dart';
import 'package:untitled/components/product_card.dart';
import 'package:untitled/notifier/product_notifier.dart';
import 'package:untitled/models/product.dart';

import '../models/pagination.dart';
import '../provider/providers.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key?key}) : super(key:key);
  @override
  _ProductsPageState createState() => _ProductsPageState();
}
class _ProductsPageState extends State<ProductsPage> {
  String? categoryId;
  String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("products"),
      ),
      body: Container(
        color: Colors.white38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_ProductFilters(categoryId: categoryId ,categoryName:categoryName),
            Flexible(child: _ProductList(),flex: 1)


          ],
        ),
      ),

    );
  }
 @override
  void didChangeDependecies() {
    final Map? arguments = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;

    if (arguments != null) {
      categoryName = arguments['categoryName'];

      categoryName = arguments['categoryId'];
    }
    super.didChangeDependencies();
  }
}


class _ProductFilters extends ConsumerWidget{
  final _sortByOptions = [
    ProductSortModel(value: "createdAt",label: "Latest"),
    ProductSortModel(value: "-productPrice",label: "Price:High to Low"),
    ProductSortModel(value: "productPrice",label: "Price: Low to High"),

  ];
  _ProductFilters({
    Key? key,
    this.categoryName,
    this.categoryId,
});

  final String? categoryName;
  final String? categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(productsFilterProvider);
    return Container(
      height: 51,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween ,
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(categoryName!,
           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
         ),
         Container(
           decoration: BoxDecoration(
             color: Colors.grey[300]
           ),
           child: PopupMenuButton(
             onSelected: (sortBy) {
               ProductFilterModel filterModel =ProductFilterModel(paginationModel:
               PaginationModel(page: 0,pageSize: 10),
               categeryId: filterProvider.categeryId,
                 sortBy: sortBy.toString()

               );

               ref
                 .read(productsFilterProvider.notifier)
               .setProductFilter(filterModel);

             },
             initialValue: filterProvider.sortBy,
             itemBuilder: (BuildContext context) {
               return _sortByOptions.map((item) { return PopupMenuItem(value: item.value, child: InkWell(
                 child: Text(item.label!),
               ),
               );
                 },
               ).toList();
             },
             icon: const Icon(Icons.filter_list_alt),
           ),

         )
       ]
     ),
    );
  }

}

class _ProductList extends ConsumerWidget{

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final productsState = ref.watch(productNotifierProvider);
    if(productsState.products.isEmpty) {
      if(!productsState.hasNext && !productsState.isLoading) {
        return const Center(
          child: Text("No Products"),
        );
      }
      return const LinearProgressIndicator();
    }
    return Column(
      children: [
        Flexible(flex: 1,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            productsState.products.length,
              (index) {
              return ProductCard(
                model: productsState.products[index],
              );
              }
          ),
        ),

        )
      ],
    );
  }
}