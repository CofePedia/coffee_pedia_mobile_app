import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/flavors.dart';
import 'package:coffepedia/data/models/regions.dart';
import 'package:coffepedia/data/models/roasts.dart';
import 'package:coffepedia/data/repository/filters_repository.dart';
import 'package:meta/meta.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> {
  final FiltersRepository filtersRepository;
  FiltersCubit(this.filtersRepository) : super(FiltersInitial());

  void getRegions() {
    filtersRepository.getRegions().then(
      (value) {
        emit(RegionsLoaded(value));
      },
    );
  }

  void getRoasts() {
    filtersRepository.getRoasts().then(
      (value) {
        emit(RoastsLoaded(value));
      },
    );
  }

  void getFlavors() {
    filtersRepository.getFlavors().then(
      (value) {
        emit(FlavorsLoaded(value));
      },
    );
  }
}
