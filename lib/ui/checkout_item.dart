import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/business_logic/wishlist/wishlist_cubit.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/repository/wishlist_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/services/preferences.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/models/gettoken_database.dart';
import '../database/database_provider.dart';
import '../main.dart';

class CheckoutItemProvider extends StatelessWidget {
  final String title;
  final String productId;
  final bool isLocal;
  final String image;
  final String price;
  final int? priceBeforeDiscount;
  final int quantity;
  final String vendor;
  final int? stock;

  final Function onRemoveItem;
  final Function onItemAdded;
  const CheckoutItemProvider(
      {required this.quantity,
      required this.title,
      required this.onRemoveItem,
      required this.onItemAdded,
      required this.priceBeforeDiscount,
      required this.isLocal,
      required this.vendor,
      required this.image,
      required this.price,
      required this.productId,
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
          child: CheckoutItem(
            title: title,
            image: image,
            productId: productId,
            price: price,
            quantity: quantity,
            vendor: vendor,
            isLocal: isLocal,
            priceBeforeDiscount: priceBeforeDiscount,
            onRemoveItem: onRemoveItem,
            onItemAdded: onItemAdded,
            stock: stock,
          ),
        ),
      ],
      child: CheckoutItem(
        image: image,
        title: title,
        vendor: vendor,
        quantity: quantity,
        price: price,
        priceBeforeDiscount: priceBeforeDiscount,
        productId: productId,
        isLocal: isLocal,
        onRemoveItem: onRemoveItem,
        onItemAdded: onItemAdded,
        stock: stock,
      ),
    );
  }
}

class CheckoutItem extends StatefulWidget {
  CheckoutItem(
      {required this.quantity,
      required this.title,
      this.priceBeforeDiscount,
      required this.vendor,
      required this.image,
      required this.price,
      required this.productId,
      required this.isLocal,
      required this.onRemoveItem,
      required this.onItemAdded,
      this.stock,
      Key? key})
      : super(key: key);

  final String title;
  final bool isLocal;
  final String image;
  final String price;
  final int? priceBeforeDiscount;
  int quantity;
  final String vendor;
  final String productId;
  Function onRemoveItem;
  Function onItemAdded;
  final int? stock;

  @override
  State<CheckoutItem> createState() => _CheckoutItemState();
}

class _CheckoutItemState extends State<CheckoutItem> {
  bool isFavorite = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<BasketCubit, BasketState>(
      listener: (context, state) async {
        if (state is RemoveFromLocalBasketIsPressed) {
          print("RemoveFromLocalBasketIsPressed is called from Widget");
          widget.onRemoveItem.call();
          final userDao = UserDao();
          GetTokenDatabase? token = await userDao.getUserToken();
          if (token != null) {
            BlocProvider.of<BasketCubit>(context).getBasket();
          } else {
            BlocProvider.of<BasketCubit>(context)
                .getAllLocalProductsFromBasket();
          }
        } else if (state is BasketLoaded) {
          /*print("AddToBasketIsPressed---");
          bool isDialogLoading = Prefs.getBool("dialogLoading") ?? false;
          if (isDialogLoading) {
            print("AddToBasketIsPressed--- 1");
            Navigator.pop(context);
            Prefs.setBool("dialogLoading", false);
          }*/
          print("BasketLoaded from widget");
          widget.onItemAdded.call();
        } else if (state is AddToCartByItemIsPressed) {
          BotToast.showText(text: state.addToBasket!.data!.msg![0]!.message!);
          BlocProvider.of<BasketCubit>(context).getBasket();
          Prefs.setInt("quantity", widget.quantity);
        } else if (state is UpdateLocalBasket) {
          setState(() {
            isLoading = false;
          });
        }
      },
      child: Container(
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
                          widget.title,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Color(0xff231F20),
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      widget.priceBeforeDiscount == 0
                          ? Text(
                              "${widget.priceBeforeDiscount} ${translator.translate("checkout_items_screen.egp")}",
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
                        "${widget.price} ${translator.translate("checkout_items_screen.egp")} ",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductProvider(
                            id: int.parse(widget.productId),
                          ),
                        ),
                      );
                    },
                    child: CustomNetworkImage(
                      imageUrl: widget.image,
                      height: 80.h,
                      width: 80.w,
                      fit: BoxFit.contain,
                      radius: 0.r,
                    ),
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
              widget.vendor,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    if (Prefs.getBool("logged") == false) {
                      if (widget.quantity > 1) {
                        BlocProvider.of<BasketCubit>(context)
                            .updateQuantityInLocalBasket(
                                int.parse(widget.productId.toString()),
                                int.parse(widget.quantity.toString()) - 1);

                        String oldQuantity =
                            Prefs.getString("totalItems") ?? " 0";
                        Prefs.setString("totalItems",
                            (int.parse(oldQuantity) - 1).toString());
                        widget.onItemAdded();
                      }
                    } else {
                      BlocProvider.of<BasketCubit>(context).getAddToCartByItem(
                          int.parse(widget.productId), widget.quantity - 1);
                    }

                    // if (widget.quantity > 1) {
                    //   BlocProvider.of<BasketCubit>(context)
                    //       .updateQuantityInLocalBasket(
                    //           int.parse(widget.productId.toString()),
                    //           int.parse(widget.quantity.toString()) - 1);
                    //
                    //   String oldQuantity = Prefs.getString("totalItems") ?? "0";
                    //
                    //   Prefs.setString("totalItems",
                    //       (int.parse(oldQuantity) - 1).toString());
                    //   widget.onItemAdded();
                    // }

                    // else
                    //   if (widget.quantity > 1) widget.quantity--;
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
                  child: Text(widget.quantity.toString()),
                ),

                InkWell(
                  onTap: () {
                    setState(
                      () {
                        if (Prefs.getBool("logged") == false) {
                          if (widget.quantity == widget.stock) {
                            BotToast.showText(
                                text: translator.translate(
                                    "product_screen.unavailable_quantity"));
                          } else if (widget.quantity < widget.stock!) {
                            BlocProvider.of<BasketCubit>(context)
                                .updateQuantityInLocalBasket(
                                    int.parse(widget.productId.toString()),
                                    int.parse(widget.quantity.toString()) + 1);

                            String oldQuantity =
                                Prefs.getString("totalItems") ?? " 0";
                            Prefs.setString("totalItems",
                                (int.parse(oldQuantity) + 1).toString());
                            widget.onItemAdded();
                          } else {
                            BotToast.showText(
                                text: translator.translate(
                                    "product_screen.unavailable_quantity"));
                          }
                        } else {
                          BlocProvider.of<BasketCubit>(context)
                              .getAddToCartByItem(int.parse(widget.productId),
                                  widget.quantity + 1);
                        }
                        // if (widget.quantity == widget.stock) {
                        //   // BotToast.showText(
                        //   //     text: translator.translate(
                        //   //         "product_screen.unavailable_quantity"));
                        // } else if (widget.quantity < widget.stock!) {
                        //   if (Prefs.getBool("logged") == false) {
                        //     BlocProvider.of<BasketCubit>(context)
                        //         .updateQuantityInLocalBasket(
                        //             int.parse(widget.productId.toString()),
                        //             int.parse(widget.quantity.toString()) + 1);
                        //
                        //     String oldQuantity =
                        //         Prefs.getString("totalItems") ?? " 0";
                        //     Prefs.setString("totalItems",
                        //         (int.parse(oldQuantity) + 1).toString());
                        //     widget.onItemAdded();
                        //   } else {
                        //     print('amrServer');
                        //     BlocProvider.of<BasketCubit>(context)
                        //         .getAddToCartByItem(int.parse(widget.productId),
                        //             widget.quantity + 1);
                        //   }
                        // }
                      },
                    );
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
                //(!widget.isLocal)

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
                          if (!widget.isLocal) {
                            isFavorite = !isFavorite;

                            BlocProvider.of<WishlistCubit>(context)
                                .getToggleProductsInWishlist(widget.productId);
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          }
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
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

                //(!widget.isLocal)

                Container(
                  width: 2.w,
                  height: 25.h,
                  margin: EdgeInsets.symmetric(horizontal: 11.w),
                  color: Color(0xff484848),
                ),

                //remove button
                InkWell(
                  onTap: () {
                    print('fajsdabf');
                    BlocProvider.of<BasketCubit>(context)
                        .deleteFromLocalBasket(int.parse(widget.productId));
                    // widget.onRemoveItem();
                    print('jabffafa');
                    String oldQuantity =
                        Prefs.getString("totalItems").toString();
                    String newQuantity =
                        (int.parse(oldQuantity) - widget.quantity).toString();
                    Prefs.setString("totalItems", newQuantity);
                    widget.onRemoveItem.call();
                    print('afbasfma');
                    if (!widget.isLocal) {
                      BlocProvider.of<BasketCubit>(context)
                          .getRemoveFromBasket(widget.productId);
                    }
                  },
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
      ),
    );
  }
}
