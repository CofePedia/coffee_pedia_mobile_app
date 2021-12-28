import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:meta/meta.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  final BasketRepository basketRepository;
  BasketCubit(this.basketRepository) : super(BasketInitial());

  void getBasket() {
    basketRepository.getBasket().then(
      (value) {
        emit(BasketLoaded(value));
      },
    );
  }
}
