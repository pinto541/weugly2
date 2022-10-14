import 'package:untitled/components/categories.dart';

import 'category.dart';
import 'package:flutter/material.dart';

class cart {

      final Category product;
      final int NoOfItems;

      cart({ required this.product, required this.NoOfItems});
}
      List<cart> democarts = [
            cart(product: demo_categories[0],NoOfItems:2),
            cart(product:demo_categories[1],NoOfItems: 3),
            cart(product: demo_categories[5], NoOfItems: 4),
      ];










