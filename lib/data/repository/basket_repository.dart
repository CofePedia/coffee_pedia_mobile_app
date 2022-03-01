import 'package:coffepedia/data/models/add_to_basket.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/coupon.dart';
import 'package:coffepedia/data/models/remove_from_basket.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/database/database_provider.dart';

class BasketRepository {
  final BasketWebServices basketWebServices;
  final userDao = UserDao();
  BasketRepository(this.basketWebServices);

  Future<Basket> getBasket() async {
    final basket = basketWebServices.getBasket();
    return basket;
  }

  Future<AddToBasket> getAddToBasket(List<Map<String, int>> productsMap) async {
    final addToBasket = basketWebServices.getAddToBasket(productsMap);
    return addToBasket;
  }

  Future<RemoveFromBasket> getRemoveFromBasket(String productId) async {
    final removeFromBasket = basketWebServices.getRemoveFromBasket(productId);
    return removeFromBasket;
  }

  // Future createBasket(BasketDataItems basket) => userDao.createBasket(basket);
  // Future updateBasket(BasketDataItems basket) => userDao.updateBasket(basket);
  // Future deleteBasketById(int id) => userDao.deleteBasket(id);

  Future<Coupon> postCoupon(String coupon) async {
    final result = basketWebServices.postCoupon(coupon);
    return result;
  }

  Future addProductInLocalBasket(BasketLocal basketLocal) =>
      userDao.addProductInLocalBasket(basketLocal);
  Future deleteFromLocalBasket(int productId) =>
      userDao.deleteFromLocalBasket(productId);
  Future truncateLocalBasket() => userDao.truncateLocalBasket();
  Future updateQuantityInLocalBasket(int productId, int quantity) =>
      userDao.updateQuantityInLocalBasket(productId, quantity);
  Future incrementQuantityInLocalBasket(int productId) =>
      userDao.incrementQuantityInLocalBasket(productId);
  Future decrementQuantityInLocalBasket(int productId) =>
      userDao.decrementQuantityInLocalBasket(productId);
  Future<List<BasketLocal>> getAllLocalProductsFromBasket() =>
      userDao.getAllLocalProductsFromBasket();
}
