import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/repository/category_products_repository.dart';
import 'package:meta/meta.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final CategoryProductsRepository categoryProductsRepository;
  CategoryProductsCubit(this.categoryProductsRepository)
      : super(CategoryProductsInitial());

  void getCategoryProducts({
    int? subCategoryId,
    int? categoryId,
    Map<String, List<String?>>? multiMap,
    Map<String, String?>? rangeMap,
    Map<String, String?>? singleMap,
  }) {
    categoryProductsRepository
        .getCategoryProducts(
      subCategoryId: subCategoryId,
      categoryId: categoryId,
      multiMap: multiMap,
      rangeMap: rangeMap,
      singleMap: singleMap,
    )
        .then(
      (value) {
        emit(CategoryProductsIsLoaded(value));
      },
    );
  }
}
