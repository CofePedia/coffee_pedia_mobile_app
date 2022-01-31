import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/web_services/category_products_web_services.dart';

class CategoryProductsRepository {
  final CategoryProductsWebServices categoryProductsWebServices;

  CategoryProductsRepository(this.categoryProductsWebServices);

  Future<CategoryProducts> getCategoryProducts(int subCategoryId,
      int categoryId, Map<String, List<String?>> multiMap) async {
    final categoryProduct = categoryProductsWebServices.getCategoryProducts(
        subCategoryId, categoryId, multiMap);
    return categoryProduct;
  }
}
