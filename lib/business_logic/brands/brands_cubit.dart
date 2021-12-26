import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/brands.dart';
import 'package:coffepedia/data/repository/brands_repository.dart';
import 'package:meta/meta.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final BrandsRepository brandsRepository;
  BrandsCubit(this.brandsRepository) : super(BrandsInitial());

  void getBrands() {
    brandsRepository.getBrands().then(
      (value) {
        emit(BrandsLoaded(value));
      },
    );
  }
}
