part of 'recommended_products_cubit.dart';

@immutable
abstract class RecommendedProductsState {}

class RecommendedProductsInitial extends RecommendedProductsState {}

class RecommendedProductsLoaded extends RecommendedProductsState {
  final RecommendedProducts? recommendedProducts;
  RecommendedProductsLoaded(this.recommendedProducts);
}
