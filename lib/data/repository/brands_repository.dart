import 'package:coffepedia/data/models/brands.dart';
import 'package:coffepedia/data/web_services/brands_web_services.dart';

class BrandsRepository {
  final BrandsWebServices brandsWebServices;

  BrandsRepository(this.brandsWebServices);

  Future<Brands> getBrands() async {
    final brands = brandsWebServices.getBrands();
    return brands;
  }
}
