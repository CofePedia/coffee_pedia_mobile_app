part of 'orders_history_cubit.dart';

@immutable
abstract class OrdersHistoryState {}

class OrdersHistoryInitial extends OrdersHistoryState {}

class OrdersHistoryLoaded extends OrdersHistoryState {
  final OrderHistory? orderHistory;
  OrdersHistoryLoaded(this.orderHistory);
}

class ReorderLoaded extends OrdersHistoryState {
  final Reorder? reorder;
  ReorderLoaded(this.reorder);
}
