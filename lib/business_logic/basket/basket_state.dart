part of 'basket_cubit.dart';

@immutable
abstract class BasketState {}

class BasketInitial extends BasketState {}

class BasketLoaded extends BasketState {
  final Basket? basket;
  BasketLoaded(this.basket);
}
