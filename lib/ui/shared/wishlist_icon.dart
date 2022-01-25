import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/wishlist/wishlist_cubit.dart';
import 'package:coffepedia/data/repository/wishlist_repository.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                widget.isFavorite = !widget.isFavorite;
                BlocProvider.of<WishlistCubit>(context)
                    .getToggleProductsInWishlist(widget.productId);
              });
            },
            child: Icon(
              Icons.favorite,
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
