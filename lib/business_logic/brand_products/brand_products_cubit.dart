import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/brand_products.dart';
import 'package:coffepedia/data/repository/brand_products_repository.dart';
import 'package:meta/meta.dart';

part 'brand_products_state.dart';

class BrandProductsCubit extends Cubit<BrandProductsState> {
  final BrandProductsRepository brandProductsRepository;
  BrandProductsCubit(this.brandProductsRepository)
      : super(BrandProductsInitial());

  void getBrandProducts(int brandId) {
    brandProductsRepository.getBrandProducts(brandId).then(
      (value) {
        emit(BrandProductsLoaded(value));
      },
    );
  }
}
