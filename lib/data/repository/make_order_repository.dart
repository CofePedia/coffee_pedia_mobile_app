import 'package:coffepedia/data/models/make_order.dart';
import 'package:coffepedia/data/web_services/make_order_web_services.dart';

class MakeOrderRepository {
  final MakeOrderWebServices makeOrderWebServices;

  MakeOrderRepository(this.makeOrderWebServices);

  Future<MakeOrder> getMakeOrder(
      String addressId, String paymentId, String coupon) async {
    final makeOrder =
        makeOrderWebServices.getMakeOrder(addressId, paymentId, coupon);
    return makeOrder;
  }
}
