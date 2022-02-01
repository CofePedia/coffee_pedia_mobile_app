part of 'category_products_cubit.dart';

@immutable
abstract class CategoryProductsState {}

class CategoryProductsInitial extends CategoryProductsState {}

class CategoryProductsIsLoaded extends CategoryProductsState {
  final CategoryProducts? categoryProducts;
  CategoryProductsIsLoaded(this.categoryProducts);
}
