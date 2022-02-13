import 'package:coffepedia/data/models/recommended_products.dart';
import 'package:coffepedia/data/web_services/recommended_products_web_services.dart';

class RecommendedProductsRepository {
  final RecommendedProductsWebServices recommendedProductsWebServices;

  RecommendedProductsRepository(this.recommendedProductsWebServices);

  Future<RecommendedProducts> getRecommendedProducts() async {
    final recommendedProducts =
        recommendedProductsWebServices.getRecommendedProducts();
    return recommendedProducts;
  }
}
