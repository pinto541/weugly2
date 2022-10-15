

import 'package:freezed_annotation/freezed_annotation.dart';



import '../models/pagination.dart';

part 'product_filter.freezed.dart';
@freezed
abstract class ProductFilterModel with _$ProductFilterModel {
  factory ProductFilterModel({
    required PaginationModel paginationModel,
    String? categeryId,
    String? sortBy,
  }) = _ProductFilterModel;

}