import 'package:coffepedia/data/models/brand_products.dart';
import 'package:coffepedia/data/web_services/brand_products_web_services.dart';

class BrandProductsRepository {
  final BrandProductsWebServices brandProductsWebServices;

  BrandProductsRepository(this.brandProductsWebServices);

  Future<BrandProducts> getBrandProducts(int brandId) async {
    final brandProducts = brandProductsWebServices.getBrandProducts(brandId);
    return brandProducts;
  }
}
