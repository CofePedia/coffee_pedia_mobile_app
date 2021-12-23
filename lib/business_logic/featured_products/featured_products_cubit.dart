import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/featured_products.dart';
import 'package:coffepedia/data/repository/featured_products_repository.dart';
import 'package:meta/meta.dart';

part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  final FeaturedProductsRepository featuredProductsRepository;

  FeaturedProductsCubit(this.featuredProductsRepository) : super(FeaturedProductsInitial());

  void getFeaturedProducts() {
    featuredProductsRepository.getFeaturedProducts().then(
          (value) {
        emit(FeaturedProductsIsLoaded(value));
      },
    );
  }
}
