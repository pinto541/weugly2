import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/constants.dart';

import 'package:untitled/productcart.dart';

import 'cart/cart_screen.dart';
import 'components/categories.dart';
import 'models/category.dart';
import 'components/components.search.dart';
import 'components/sectiontitles.dart';
import 'constants.dart';

import 'package:untitled/drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                      .copyWith(fontWeight: FontWeight.w800, color: Colors.black),
                ),

                const Padding(
                  padding: EdgeInsets.all( defaultPadding),
                  child: searchform(),
                ),

              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-YaGfGqZWYmjVcubKSqPPEYuPbMtHIuSzNw&usqp=CAU"),
                const SizedBox(height: defaultPadding),
                const categories(),
               const SizedBox(height: defaultPadding),

               sectiontitle(title: 'new arrival',
                             pressSeeAll: () {}
               ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                        List.generate(demo_categories.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(left: defaultPadding)
                                  ,
                                  child: productcart(

                                    image:demo_categories[index].image,

                                    title:demo_categories[index].title,
                                    price:demo_categories[index].price,
                                    bgColor:demo_categories[index].bgColor,
                                      press:(){},


                                  ),
                                )
                        )

                    ),
                  ),





                                ]
                            ),


        ),
      ),
      drawer: Drawer(
       child: ListView(
      children:    <Widget>[
   const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),









          child: Text(
            'pinto kumar',
            style: TextStyle(fontSize: 15,color: Colors.white),
          ),

      ),







            Padding(
              padding: const EdgeInsets.all(24),
              child: Wrap(
                runSpacing: 16,
                  children: [
                  ListTile(

      title: const Text('order history'),
                    onTap: () {},
      ),



     ListTile(

      title: const Text('settings'),
            onTap: () {},
      ),
      ListTile(

      title: const Text('terms and conditions'),
            onTap: () {},


      ),
    ],
    ),

            )
          ]
            )



      ),


      );














  }


}

