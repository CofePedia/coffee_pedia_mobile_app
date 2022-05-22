part of 'brand_products_cubit.dart';

@immutable
abstract class BrandProductsState {}

class BrandProductsInitial extends BrandProductsState {}

class BrandProductsLoaded extends BrandProductsState {
  final BrandProducts? brandProducts;
  BrandProductsLoaded(this.brandProducts);
}
