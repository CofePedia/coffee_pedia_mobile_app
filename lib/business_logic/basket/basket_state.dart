part of 'basket_cubit.dart';

@immutable
abstract class BasketState {}

class BasketInitial extends BasketState {}

class BasketLoaded extends BasketState {
  final Basket? basket;
  BasketLoaded(this.basket);
}

class AddToBasketIsPressed extends BasketState {
  final AddToBasket? addToBasket;
  AddToBasketIsPressed(this.addToBasket);
}

class RemoveFromBasketIsPressed extends BasketState {
  final RemoveFromBasket? removeFromBasket;
  RemoveFromBasketIsPressed(this.removeFromBasket);
}

///// LOCAL FROM SQfLITE
class AddToCartPressed extends BasketState {
  List<BasketLocal>  basketLocalList;
  AddToCartPressed(this.basketLocalList);
}
class LocalBasketLoaded extends BasketState {
  List<BasketLocal>  basketLocalList;
  LocalBasketLoaded(this.basketLocalList);
}
class LocalBasketError extends BasketState {
  String error;
  LocalBasketError(this.error);
}
class RemoveFromLocalBasketIsPressed extends BasketState {
  RemoveFromLocalBasketIsPressed();
}
class AddToLocalBasketIsPressed extends BasketState {
  AddToLocalBasketIsPressed();
}


class AddedLocalBasket extends BasketState {
  // final AddedLocalBasket? addedLocalBasket;
  AddedLocalBasket(/*this.addedLocalBasket*/);
}

class AddedLocalBasketError extends BasketState {
  String error;
  AddedLocalBasketError(this.error);
}

class UpdateLocalBasket extends BasketState {
  // final UpdateLocalBasket? updateLocalBasket;
  UpdateLocalBasket(/*this.updateLocalBasket*/);
}

class UpdateLocalBasketError extends BasketState {
  String error;
  UpdateLocalBasketError(this.error);
}

class DeleteLocalBasket extends BasketState {
  // final DeleteLocalBasket? deleteLocalBasket;
  DeleteLocalBasket(/*this.deleteLocalBasket*/);
}

class DeleteLocalBasketError extends BasketState {
  String error;
  DeleteLocalBasketError(this.error);
}

class CouponIsPressed extends BasketState {
  final Coupon? coupon;
  CouponIsPressed(this.coupon);
}

class CouponUnvalid extends BasketState {
  final Exception? error;
  CouponUnvalid(this.error);
}
