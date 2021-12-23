
import 'package:coffepedia/data/models/product.dart';
import 'package:coffepedia/data/web_services/product_web_services.dart';

class ProductRepository {
  final ProductWebServices productWebServices;

  ProductRepository(this.productWebServices);

  Future<Product> getProduct() async {
    final product = productWebServices.getProduct();
    return product;
  }


}