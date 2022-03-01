part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchIsPressed extends SearchState {
  final Search? search;
  SearchIsPressed(this.search);
}
