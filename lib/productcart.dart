import 'package:flutter/material.dart';

import 'constants.dart';



// ignore: camel_case_types
class productcart extends StatelessWidget {
  const productcart({
    Key? key,
    required this.image,
    required this.title,
    required this.bgColor,
    required this.price,
    required this.press,

  }) : super(key: key);
  final String image,title;
  final Color bgColor;
  final int price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,


            child: Container(
              width: 154,
              padding:   const EdgeInsets.all(defaultPadding/2),
              decoration: const BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius))),
              child: Column(
                children: [
                  Container(

                    decoration: BoxDecoration(color: bgColor,
                        borderRadius:const BorderRadius.all(Radius.circular(defaultBorderRadius))),
                    child: Image.network(image,
                        height: 232),
                  ),
                  const SizedBox(height: defaultPadding/2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(color:Colors.black),
                        ),
                      ),
                      const SizedBox(width: defaultPadding/4),
                      Text(
                          "\$$price",

                          style:Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                ],
              ),

            ),



      ),

      );






  }
}




