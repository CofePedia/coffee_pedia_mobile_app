import 'package:coffepedia/data/models/featured_products.dart';
import 'package:coffepedia/data/web_services/featured_products_web_services.dart';

class FeaturedProductsRepository {
  final FeaturedProductsWebServices featuredProductsWebServices;

  FeaturedProductsRepository(this.featuredProductsWebServices);

  Future<FeaturedProducts> getFeaturedProducts() async {
    final featuredProducts = featuredProductsWebServices.getFeaturedProducts();
    return featuredProducts;
  }
}
