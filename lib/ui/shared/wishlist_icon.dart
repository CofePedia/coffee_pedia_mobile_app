import 'package:coffepedia/business_logic/wishlist/wishlist_cubit.dart';
import 'package:coffepedia/data/repository/wishlist_repository.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistIconWidget extends StatelessWidget {
  final String productId;
  const WishlistIconWidget({required this.productId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit(
        WishlistRepository(
          WishlistWebServices(),
        ),
      ),
      child: WishlistIcon(
        productId: productId,
      ),
    );
  }
}

class WishlistIcon extends StatefulWidget {
  final String productId;
  const WishlistIcon({required this.productId, Key? key}) : super(key: key);

  @override
  _WishlistIconState createState() => _WishlistIconState();
}

class _WishlistIconState extends State<WishlistIcon> {
  final bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        return FavoriteButton(
          isFavorite: _isFavorite,
          iconSize: 35.h,
          iconColor: Color(0xffE02020),
          valueChanged: (value) {
            BlocProvider.of<WishlistCubit>(context)
                .getToggleProductsInWishlist(widget.productId);
          },
        );
      },
    );
  }
}
