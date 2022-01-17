import 'package:coffepedia/data/models/toggle_products_in_wishlist.dart';
import 'package:coffepedia/data/models/wishlist.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';

class WishlistRepository {
  final WishlistWebServices wishlistWebServices;

  WishlistRepository(this.wishlistWebServices);

  Future<Wishlist> getWishlist() async {
    final wishlist = wishlistWebServices.getWishlist();
    return wishlist;
  }

  Future<ToggleProductsInWishlist> getToggleProductsInWishlist(
      String productId) async {
    final toggleProductsInWishlist =
        wishlistWebServices.getToggleProductsInWishlist(productId);
    return toggleProductsInWishlist;
  }
}
