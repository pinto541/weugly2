import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/Products/product_filter.dart';

import 'package:untitled/sizeconfig.dart';

import 'package:http/http.dart' as http;


import '../Products/product_page.dart';
import '../models/category.dart';
import '../models/product.dart';
final apiService = Provider((ref) => APIService());
class APIService {
  static var client = http.Client();

  Future<List<Category>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/JSON'};

    Map<String,String> queryString = {
      'page':page.toString(),
      'pageSize' : pageSize.toString()
    };



    var url = Uri.http(sizeconfig.apiURL,sizeconfig.categoryAPI,queryString);
    var response = await client.get(url,headers: requestHeaders);

     if(response.statusCode == 200) {
       var data = jsonDecode(response.body);
       return categoriesFromJson(data["data"]);
     }
     else {
       return null;
     }
  }

  Future<List<Product>?> getProducts(ProductFilterModel productFilterModel,
      )
  async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/JSON'};


    Map<String,String> queryString = {
      'page':productFilterModel.paginationModel.page.toString(),
      'pageSize' : productFilterModel.paginationModel.pageSize.toString()
    };
    if(productFilterModel.categeryId!=null) {
      queryString["categoryId"]= productFilterModel.categeryId!;
    }
    if(productFilterModel.sortBy!= null) {
      queryString["sort"] = productFilterModel.sortBy!;
    }


    var url = Uri.http(sizeconfig.apiURL,sizeconfig.productAPI,queryString);
    var response = await client.get(url,headers: requestHeaders);

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return productFromJson(data["data"]);
    }
    else {
      return null;
    }
  }


}