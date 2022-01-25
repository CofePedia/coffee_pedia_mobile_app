import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/product.dart';
import 'package:coffepedia/data/repository/product_repository.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit(this.productRepository) : super(ProductInitial());
  void getProduct(int id) {
    productRepository.getProduct(id).then(
      (value) {
        emit(ProductLoaded(value));
      },
    );
  }
}
