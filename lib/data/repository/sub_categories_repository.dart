import 'package:coffepedia/data/models/sub_categories.dart';
import 'package:coffepedia/data/web_services/sub_categories_web_services.dart';

class SubCategoriesRepository {
  final SubCategoriesWebServices subCategoriesWebServices;

  SubCategoriesRepository(this.subCategoriesWebServices);

  Future<SubCategories> getSubCategories() async {
    final subCategories = subCategoriesWebServices.getSubCategories();
    return subCategories;
  }
}
