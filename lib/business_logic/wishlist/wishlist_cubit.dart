import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/toggle_products_in_wishlist.dart';
import 'package:coffepedia/data/models/wishlist.dart';
import 'package:coffepedia/data/repository/wishlist_repository.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final WishlistRepository wishlistRepository;
  WishlistCubit(this.wishlistRepository) : super(WishlistInitial());

  void getWishlist() {
    wishlistRepository.getWishlist().then(
      (value) {
        emit(WishlistIsLoaded(value));
      },
    );
  }

  void getToggleProductsInWishlist(String productId) {
    wishlistRepository.getToggleProductsInWishlist(productId).then(
      (value) {
        emit(ToggleProductsInWishlistIsLoaded(value));
      },
    );
  }
}
