import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/Products/product_filter.dart';

import 'package:untitled/models/pagination.dart';
import 'package:untitled/provider/providers.dart';
import 'Products/product_page.dart';
import 'models/category.dart';

class HomeCategoriesWidget extends ConsumerWidget {
  const HomeCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children:  [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("All Categories",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _categoriesList(ref),
          )        ],
      ),
    );
  }
  Widget _categoriesList(WidgetRef ref) {
    final categories = ref.watch(
        categories(
            PaginationModel(page: 1, pageSize: 10)));
    return categories.when(
      data: (list) {
        return _buildCategoryList(list!);
      },
      error:(_,__)  => const Center(child: Text("ERR"),),
      loading:() => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildCategoryList(List<Category> categories, WidgetRef ref ) {
      return Container(
        height: 100,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
          shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
           scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            var data = categories[index];
            return
                GestureDetector(
                  onTap: (){
                    ProductFilterModel filterModel = ProductFilterModel(
                      paginationModel: PaginationModel(page: 1, pageSize: 10),
                      categeryId: data.categoryId
                    );
                    ref.read(productsFilterProvider.notifier)
                    .setProductFilter(filterModel);
                    ref.read(productsNotifierProvider.notifier).getProducts();
                    Navigator.of(context).pushNamed(
                      "/products",
                            arguments: {
                         'categoryId': data.categoryId,
                              'categoryName': data.categoryName,
                            },
                    );


                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 50,
                          height:  50,
                          alignment: Alignment.center,



                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data.categoryName,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            const Icon(Icons.keyboard_arrow_right,size:13),


                          ],

                        )
                      ],
                    ),

                  )
                );
          }

        )
      );

  }

}
