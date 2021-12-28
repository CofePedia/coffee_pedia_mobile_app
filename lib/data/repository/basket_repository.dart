import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';

class BasketRepository {
  final BasketWebServices basketWebServices;

  BasketRepository(this.basketWebServices);

  Future<Basket> getBasket() async {
    final basket = basketWebServices.getBasket();
    return basket;
  }
}
