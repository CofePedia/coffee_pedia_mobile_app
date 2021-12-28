import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/categories.dart';
import 'package:coffepedia/data/repository/categories_repository.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository categoriesRepository;
  CategoriesCubit(this.categoriesRepository) : super(CategoriesInitial());

  void getCategories() {
    categoriesRepository.getCategories().then(
      (value) {
        emit(CategoriesLoaded(value));
      },
    );
  }
}
