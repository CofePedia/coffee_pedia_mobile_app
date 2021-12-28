import 'package:coffepedia/data/models/categories.dart';
import 'package:coffepedia/data/web_services/categories_web_services.dart';

class CategoriesRepository {
  final CategoriesWebServices categoriesWebServices;

  CategoriesRepository(this.categoriesWebServices);

  Future<Categories> getCategories() async {
    final categories = categoriesWebServices.getCategories();
    return categories;
  }
}
