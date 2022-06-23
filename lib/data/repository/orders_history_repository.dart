import 'package:coffepedia/data/models/order_history.dart';
import 'package:coffepedia/data/models/reorder.dart';
import 'package:coffepedia/data/web_services/order_history_web_services.dart';

class OrdersHistoryRepository {
  final OrderHistoryWebServices orderHistoryWebServices;

  OrdersHistoryRepository(this.orderHistoryWebServices);

  Future<OrderHistory> getOrderHistory() async {
    final orderHistory = orderHistoryWebServices.getOrderHistory();
    return orderHistory;
  }

  Future<Reorder> postReorder(int orderNumber) async {
    final reorderResult = orderHistoryWebServices.postReorder(orderNumber);
    return reorderResult;
  }
}
