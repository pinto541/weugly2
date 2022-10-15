import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Products/product_filter.dart';
import '../api/api_service.dart';
import '../application/state/product_state.dart';
import '../models/category.dart';
import '../models/pagination.dart';
import '../models/product.dart';
import '../notifier/product_filter_notifier.dart';
import '../notifier/product_notifier.dart';


final cateoriesProvider =
FutureProvider.family<List<Category>?,PaginationModel>(
      (ref,paginationModel) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getCategories(
      paginationModel.page,
      paginationModel.pageSize,
    );
  },
);
final homeProductProvider =
FutureProvider.family<List<Product>?,ProductFilterModel>(
      (ref,productFilterModel){
    final apiRespository = ref.watch(apiService);

    return apiRespository.getProducts(productFilterModel);
  },
);
final productsFilterProvider =
StateNotifierProvider<ProductsFilterNotifier,ProductFilterModel>(
      (ref) => ProductsFilterNotifier(),
);


final productNotifierProvider =
StateNotifierProvider<ProductsNotifier,ProductsState>(
      (ref) => ProductsNotifier(
    ref.watch(apiService),
        ref.watch(productsNotifierProvider),
  ),
);

