part of 'make_order_cubit.dart';

@immutable
abstract class MakeOrderState {}

class MakeOrderInitial extends MakeOrderState {}

class MakeOrderIsLoaded extends MakeOrderState {
  final MakeOrder? makeOrder;
  MakeOrderIsLoaded(this.makeOrder);
}
