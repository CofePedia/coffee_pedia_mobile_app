import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/repository/category_products_repository.dart';
import 'package:meta/meta.dart';

part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final CategoryProductsRepository categoryProductsRepository;
  CategoryProductsCubit(this.categoryProductsRepository)
      : super(CategoryProductsInitial());

  void getCategoryProducts(int subCategoryId, int categoryId) {
    categoryProductsRepository
        .getCategoryProducts(subCategoryId, categoryId)
        .then(
      (value) {
        emit(CategoryProductsIsLoaded(value));
      },
    );
  }
}
