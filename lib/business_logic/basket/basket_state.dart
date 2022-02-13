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

class CreateLocalBasket extends BasketState {}

class CreateLocalBasketError extends BasketState {}

class UpdateLocalBasket extends BasketState {}

class UpdateLocalBasketError extends BasketState {}

class DeleteLocalBasket extends BasketState {}

class DeleteLocalBasketError extends BasketState {}
