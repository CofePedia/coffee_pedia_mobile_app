import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/search.dart';
import 'package:coffepedia/data/repository/search_repository.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;
  SearchCubit(this.searchRepository) : super(SearchInitial());

  void getSearch(String query) {
    searchRepository.getSearch(query).then(
      (value) {
        emit(SearchIsPressed(value));
      },
    );
  }
}
