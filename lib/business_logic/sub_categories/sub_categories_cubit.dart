import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/sub_categories.dart';
import 'package:coffepedia/data/repository/sub_categories_repository.dart';
import 'package:meta/meta.dart';

part 'sub_categories_state.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  final SubCategoriesRepository subCategoriesRepository;

  SubCategoriesCubit(this.subCategoriesRepository)
      : super(SubCategoriesInitial());

  void getSubCategories(int categoriesId) {
    subCategoriesRepository.getSubCategories(categoriesId).then(
      (value) {
        emit(SubCategoriesLoaded(value));
      },
    );
  }
}
