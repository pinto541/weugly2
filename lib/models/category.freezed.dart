// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get categoryName => throw _privateConstructorUsedError;
  String get categoryImage => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({String categoryName, String categoryImage, String categoryId});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? categoryImage = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImage: null == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_categoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_categoryCopyWith(
          _$_category value, $Res Function(_$_category) then) =
      __$$_categoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryName, String categoryImage, String categoryId});
}

/// @nodoc
class __$$_categoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_category>
    implements _$$_categoryCopyWith<$Res> {
  __$$_categoryCopyWithImpl(
      _$_category _value, $Res Function(_$_category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? categoryImage = null,
    Object? categoryId = null,
  }) {
    return _then(_$_category(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImage: null == categoryImage
          ? _value.categoryImage
          : categoryImage // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_category implements _category {
  _$_category(
      {required this.categoryName,
      required this.categoryImage,
      required this.categoryId});

  factory _$_category.fromJson(Map<String, dynamic> json) =>
      _$$_categoryFromJson(json);

  @override
  final String categoryName;
  @override
  final String categoryImage;
  @override
  final String categoryId;

  @override
  String toString() {
    return 'Category(categoryName: $categoryName, categoryImage: $categoryImage, categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_category &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryImage, categoryImage) ||
                other.categoryImage == categoryImage) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryName, categoryImage, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_categoryCopyWith<_$_category> get copyWith =>
      __$$_categoryCopyWithImpl<_$_category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_categoryToJson(
      this,
    );
  }
}

abstract class _category implements Category {
  factory _category(
      {required final String categoryName,
      required final String categoryImage,
      required final String categoryId}) = _$_category;

  factory _category.fromJson(Map<String, dynamic> json) = _$_category.fromJson;

  @override
  String get categoryName;
  @override
  String get categoryImage;
  @override
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$_categoryCopyWith<_$_category> get copyWith =>
      throw _privateConstructorUsedError;
}
