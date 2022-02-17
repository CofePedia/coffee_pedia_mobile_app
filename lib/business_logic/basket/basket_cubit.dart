import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/add_to_basket.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/coupon.dart';
import 'package:coffepedia/data/models/remove_from_basket.dart';
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

  void getAddToBasket(List<Map<String, int>> productsMap) {
    basketRepository.getAddToBasket(productsMap).then(
          (value) {
        emit(AddToBasketIsPressed(value));
      },
    );
  }

  void getRemoveFromBasket(String productId) {
    basketRepository.getRemoveFromBasket(productId).then(
          (value) {
        emit(RemoveFromBasketIsPressed(value));
      },
    );
  }

  void createBasket(BasketDataItems basket) async {
    await basketRepository
        .createBasket(basket)
        .then(
          (value) => emit(
        CreateLocalBasket(),
      ),
    )
        .catchError((error) {
      print("local basket error $error");
      emit(CreateLocalBasketError());
    });
  }

  void updateBasket(BasketDataItems basket) async {
    await basketRepository
        .updateBasket(basket)
        .then(
          (value) => emit(
        UpdateLocalBasket(),
      ),
    )
        .catchError((error) {
      print("update local basket error $error");
      emit(UpdateLocalBasketError());
    });
  }

  void deleteBasketById(int id) async {
    basketRepository
        .deleteBasketById(id)
        .then(
          (value) => emit(
        DeleteLocalBasket(),
      ),
    )
        .catchError((error) {
      print("delete local basket error $error");
      emit(DeleteLocalBasketError());
    });
  }

  void getCoupon(String coupon) {
    basketRepository
        .postCoupon(coupon)
        .then((value) => emit(
      CouponIsPressed(value),
    ))
        .catchError(
          (error) => emit(
        CouponUnvalid(error),
      ),
    );
  }
}
