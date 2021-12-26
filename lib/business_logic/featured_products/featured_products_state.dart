part of 'featured_products_cubit.dart';

@immutable
abstract class FeaturedProductsState {}

class FeaturedProductsInitial extends FeaturedProductsState {}
class FeaturedProductsIsLoaded extends FeaturedProductsState {
  final FeaturedProducts? featuredProducts;
  FeaturedProductsIsLoaded(this.featuredProducts);
}