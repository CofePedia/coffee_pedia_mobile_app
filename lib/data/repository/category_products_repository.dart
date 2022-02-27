import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/web_services/category_products_web_services.dart';

class CategoryProductsRepository {
  final CategoryProductsWebServices categoryProductsWebServices;

  CategoryProductsRepository(this.categoryProductsWebServices);

  Future<CategoryProducts> getCategoryProducts({
    int? vendorId,
    int? limit,
    int? page,
    int? subCategoryId,
    int? categoryId,
    Map<String, List<String?>>? multiMap,
    Map<String, String?>? rangeMap,
    Map<String, String?>? singleMap,
  }) async {
    final categoryProduct = categoryProductsWebServices.getCategoryProducts(
      vendorId: vendorId,
      limit: limit,
      page: page,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      multiMap: multiMap,
      rangeMap: rangeMap,
      singleMap: singleMap,
    );
    return categoryProduct;
  }

  // Future<VendorDetails> getVendorDetails(int vendorId) async {
  //   final basket = categoryProductsWebServices.getVendorDetails(vendorId);
  //   return basket;
  // }
}
