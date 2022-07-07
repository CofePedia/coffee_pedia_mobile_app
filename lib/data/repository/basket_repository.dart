import 'package:coffepedia/data/models/add_to_basket.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/coupon.dart';
import 'package:coffepedia/data/models/order_summary.dart';
import 'package:coffepedia/data/models/remove_from_basket.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/database/database_provider.dart';

class BasketRepository {
  final BasketWebServices basketWebServices;
  final userDao = UserDao();
  BasketRepository(this.basketWebServices);

  Future<Basket> getBasket() => basketWebServices.getBasket();

  Future<AddToBasket> getAddToBasket(List<Map<String, int>> productsMap) =>
      basketWebServices.getAddToBasket(productsMap);
  Future<AddToBasket> getAddToCartByItem(int productId, int quantity) =>
      basketWebServices.getAddToCartByItem(productId, quantity);

  Future<RemoveFromBasket> getRemoveFromBasket(String productId) =>
      basketWebServices.getRemoveFromBasket(productId);

  Future<Coupon> postCoupon(String coupon, String addressId) =>
      basketWebServices.postCoupon(coupon, addressId);

  Future<OrderSummary> postOrderSummary(String addressId) =>
      basketWebServices.postOrderSummary(addressId);

  Future<int> addProductInLocalBasket(BasketLocal basketLocal) =>
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
