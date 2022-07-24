import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/wishlist/wishlist_cubit.dart';
import 'package:coffepedia/data/repository/wishlist_repository.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';
import 'package:coffepedia/services/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/intro/login_register_screen.dart';

class WishlistIconWidget extends StatelessWidget {
  final String productId;
  final bool isFavorite;

  const WishlistIconWidget(
      {required this.productId, required this.isFavorite, Key? key})
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
        isFavorite: isFavorite,
      ),
    );
  }
}

class WishlistIcon extends StatefulWidget {
  final String productId;
  bool isFavorite;

  WishlistIcon({required this.productId, required this.isFavorite, Key? key})
      : super(key: key);

  @override
  _WishlistIconState createState() => _WishlistIconState();
}

class _WishlistIconState extends State<WishlistIcon> {
  // bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is ToggleProductsInWishlistIsLoaded) {
          BotToast.showText(
            text: state.toggleProductsInWishlist!.data!.msg!,
          );
        }
      },
      child: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          // if (state is ToggleProductsInWishlistIsLoaded) {
          return InkWell(
            onTap: () {
              setState(() {
                if (Prefs.getBool("logged") == true &&
                    Prefs.getBool("logged") != null) {
                  widget.isFavorite = !widget.isFavorite;

                  BlocProvider.of<WishlistCubit>(context)
                      .getToggleProductsInWishlist(widget.productId);
                } else {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                }
                BlocProvider.of<WishlistCubit>(context)
                    .getToggleProductsInWishlist(widget.productId);
              });
            },
            child: Icon(
              widget.isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 28.h,
              color: widget.isFavorite ? Color(0xffE02020) : Colors.grey,
            ),
          );
          // } else {
          //   return Icon(
          //     Icons.favorite,
          //     size: 28.h,
          //     color: _isFavorite ? Color(0xffE02020) : Colors.grey,
          //   );
          // }
        },
      ),
    );
  }
}
