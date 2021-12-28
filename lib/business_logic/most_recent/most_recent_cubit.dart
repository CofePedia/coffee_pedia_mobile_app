import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/most_recent_products.dart';
import 'package:coffepedia/data/repository/most_recent_repository.dart';
import 'package:meta/meta.dart';

part 'most_recent_state.dart';

class MostRecentCubit extends Cubit<MostRecentState> {
  final MostRecentRepository mostRecentRepository;
  MostRecentCubit(this.mostRecentRepository) : super(MostRecentInitial());

  void getMostRecent() {
    mostRecentRepository.getMostRecent().then(
      (value) {
        emit(MostRecentLoaded(value));
      },
    );
  }
}
