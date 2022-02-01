part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistIsLoaded extends WishlistState {
  final Wishlist? wishlist;
  WishlistIsLoaded(this.wishlist);
}

class ToggleProductsInWishlistIsLoaded extends WishlistState {
  final ToggleProductsInWishlist? toggleProductsInWishlist;
  ToggleProductsInWishlistIsLoaded(this.toggleProductsInWishlist);
}
