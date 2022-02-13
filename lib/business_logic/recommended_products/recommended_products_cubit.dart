import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/recommended_products.dart';
import 'package:coffepedia/data/repository/recommended_products_repository.dart';
import 'package:meta/meta.dart';

part 'recommended_products_state.dart';

class RecommendedProductsCubit extends Cubit<RecommendedProductsState> {
  final RecommendedProductsRepository recommendedProductsRepository;
  RecommendedProductsCubit(this.recommendedProductsRepository)
      : super(RecommendedProductsInitial());

  void getRecommendedProducts() {
    recommendedProductsRepository.getRecommendedProducts().then(
      (recommendedProducts) {
        emit(RecommendedProductsLoaded(recommendedProducts));
      },
    );
  }
}
