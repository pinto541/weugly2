import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/models/product.dart';
import 'package:untitled/widgets/widget_home_products.dart';

import 'package:untitled/widgets_home_categories.dart';
import 'components/product_card.dart';
import 'models/category.dart';
import 'components/components.search.dart';
import 'components/sectiontitles.dart';
import 'constants.dart';

import 'package:untitled/drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product model =Product(
        productName: "lungi",
        category:  Category(
            categoryName: "pants",
            categoryImage: "",
            categoryId: "123654"
        ),

        productShortDescription: "the great lungi",
        productPrice: 500,
        productSalePrice : 400,
        productImage: "",
        productSKU: "6A-001",
        productType : "single",
        stockStatus : "IN",
        productId: "123456987"
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,


        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text(

              "WeUgly",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),


          ],
        ),
        actions: [


          IconButton(onPressed: () {},
            icon: SvgPicture.network(""

            ),
          ),

        ],

      ),


      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Explore",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4!
                      .copyWith(
                      fontWeight: FontWeight.w800, color: Colors.black),
                ),

                const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: searchform(),
                ),

                Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-YaGfGqZWYmjVcubKSqPPEYuPbMtHIuSzNw&usqp=CAU"),
                const SizedBox(height: defaultPadding),
                const HomeCategoriesWidget(),
                const SizedBox(height: defaultPadding),

                sectiontitle(title: 'new arrival',
                    pressSeeAll: () {}
                ),
                 const HomeProductsWidget(),
                 const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                ),
              ]
          ),
        ),
      ),
      drawer:const home_drawer(),



    );
  }


}



