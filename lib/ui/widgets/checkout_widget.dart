import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../business_logic/basket/basket_cubit.dart';
import '../../business_logic/wishlist/wishlist_cubit.dart';
import '../../data/repository/basket_repository.dart';
import '../../data/repository/wishlist_repository.dart';
import '../../data/web_services/basket_web_services.dart';
import '../../generated/assets.dart';
import '../../main.dart';
import '../shared/custom_network_image.dart';

class CheckoutItemsProvider extends StatelessWidget {
  final String productId;
  final String title;
  final int priceBeforeDiscount;
  final int price;
  final String imageUrl;
  final String vendor;
  final int quantity;
  final int stock;
  const CheckoutItemsProvider(
      {required this.productId,
      required this.priceBeforeDiscount,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.vendor,
      required this.quantity,
      required this.stock,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WishlistCubit(
            WishlistRepository(
              WishlistWebServices(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => BasketCubit(
            BasketRepository(
              BasketWebServices(),
            ),
          ),
          child: CheckoutWidget(
            title: title,
            imageUrl: imageUrl,
            productId: productId,
            price: price,
            quantity: quantity,
            vendor: vendor,
            priceBeforeDiscount: priceBeforeDiscount,
            stock: stock,
          ),
        ),
      ],
      child: CheckoutWidget(
        imageUrl: imageUrl,
        title: title,
        vendor: vendor,
        quantity: quantity,
        price: price,
        priceBeforeDiscount: priceBeforeDiscount,
        productId: productId,
        stock: stock,
      ),
    );
  }
}

class CheckoutWidget extends StatelessWidget {
  final String productId;
  final String title;
  final int priceBeforeDiscount;
  final int price;
  final String imageUrl;
  final String vendor;
  int quantity;
  final int stock;
  CheckoutWidget({
    required this.productId,
    required this.priceBeforeDiscount,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.vendor,
    required this.quantity,
    required this.stock,
    Key? key,
  }) : super(key: key);

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // height: 120.h,
            margin: EdgeInsets.only(bottom: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        title,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Color(0xff231F20),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    priceBeforeDiscount == 0
                        ? Text(
                            "$priceBeforeDiscount ${translator.translate("checkout_items_screen.egp")}",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: Color(0xff606266)),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "$price ${translator.translate("checkout_items_screen.egp")} ",
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                CustomNetworkImage(
                  imageUrl: imageUrl,
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.contain,
                  radius: 0.r,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            translator.translate("checkout_items_screen.sold_by"),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            vendor,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  quantity--;
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffF2F2F2),
                  radius: 17.h,
                  child: Icon(
                    Icons.remove,
                    size: 20.r,
                    color: Color(0xff606266),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.71.w),
                width: 34.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border.all(color: Color(0xffF3F1F1), width: 1.w),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                child: Text(quantity.toString()),
              ),
              InkWell(
                onTap: () {
                  quantity++;
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffF2F2F2),
                  radius: 17.h,
                  child: Icon(
                    Icons.add,
                    size: 20.r,
                    color: Color(0xff606266),
                  ),
                ),
              ),
              Spacer(),

              BlocListener<WishlistCubit, WishlistState>(
                listener: (context, state) {
                  if (state is ToggleProductsInWishlistIsLoaded) {
                    BotToast.showText(
                        text: state.toggleProductsInWishlist!.data!.msg!);
                  }
                },
                child: BlocBuilder<WishlistCubit, WishlistState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        isFavorite = !isFavorite;
                        BlocProvider.of<WishlistCubit>(context)
                            .getToggleProductsInWishlist(productId);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.iconsHeart,
                            width: 15.w,
                            height: 13.5.h,
                            color: isFavorite
                                ? Colors.red
                                : Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            translator.translate(
                                "checkout_items_screen.move_to_wishlist"),
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: isFavorite
                                          ? Colors.red
                                          : Theme.of(context).primaryColor,
                                    ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: 2.w,
                height: 25.h,
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                color: Color(0xff484848),
              ),

              //remove button
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.iconsDelete,
                      width: 14.w,
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      translator.translate("checkout_items_screen.remove"),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.75.h,
          ),
        ],
      ),
    );
  }
}
