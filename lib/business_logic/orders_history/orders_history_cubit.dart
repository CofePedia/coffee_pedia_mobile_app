import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/order_history.dart';
import 'package:coffepedia/data/repository/orders_history_repository.dart';
import 'package:meta/meta.dart';

part 'orders_history_state.dart';

class OrdersHistoryCubit extends Cubit<OrdersHistoryState> {
  final OrdersHistoryRepository ordersHistoryRepository;
  OrdersHistoryCubit(this.ordersHistoryRepository)
      : super(OrdersHistoryInitial());

  void getOrdersHistory() {
    ordersHistoryRepository.getOrderHistory().then(
      (value) {
        emit(OrdersHistoryLoaded(value));
      },
    );
  }
}
