import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_service.dart';
import '../application/state/product_state.dart';
import '../models/pagination.dart';
import '../products/product_filter.dart';
import '../products/product_filter.dart';
class ProductsNotifier extends StateNotifier<ProductsState>{
  final APIService _apiservice;
  final ProductFilterModel _filterModel;


  ProductsNotifier(  this._apiservice, this._filterModel)
      :super(const ProductsState());
  int page=1;
  Future<void>getProducts() async{
    if(state.isLoading || !state.hasNext) {
      return;
    }
    state = state.copyWith(isLoading:true);
    var filterModel = _filterModel.copyWith(
      paginationModel: PaginationModel(
        page:page,
        pageSize:10,
      ),
    );
    final products = await _apiservice.getProducts(filterModel);
    final newProducts = [...state.products,...products!];
    if(products.length % 10!=0||products.isEmpty){
      state = state.copyWith(hasNext:false);
    }


    state = state.copyWith(products:newProducts);

    page++;
    state = state.copyWith(isLoading:false);
  }


  Future<void> refreshProducts() async {
    state = state.copyWith(products:[],hasNext:false);
    page = 1;
    await getProducts();
  }
}



