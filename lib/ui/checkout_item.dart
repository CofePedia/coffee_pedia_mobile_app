import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/business_logic/wishlist/wishlist_cubit.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/repository/wishlist_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class CheckoutItemProvider extends StatelessWidget {
  final String title;
  final String productId;
  final bool isLocal;
  final String image;
  final String price;
  final String? priceBeforeDiscount;
  final int quantity;
  final String vendor;
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
          create: (context) =>
              BasketCubit(BasketRepository(BasketWebServices())),
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
      Key? key})
      : super(key: key);

  final String title;
  final bool isLocal;
  final String image;
  final String price;
  final String? priceBeforeDiscount;
  int quantity;
  final String vendor;
  final String productId;
  Function onRemoveItem;
  Function onItemAdded;

  @override
  State<CheckoutItem> createState() => _CheckoutItemState();
}

class _CheckoutItemState extends State<CheckoutItem> {
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
          print("BasketLoaded from widget");
        } else if (state is AddToBasketIsPressed) {
          print("AddToBasketIsPressed from widget");
          widget.onItemAdded.call();
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
              // color: Colors.red,
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
                      Text(
                        "${translator.translate("checkout_items_screen.egp")} ${widget.priceBeforeDiscount}",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xff606266)),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "${translator.translate("checkout_items_screen.egp")} ${widget.price}",
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
                    imageUrl: widget.image,
                    height: 70.h,
                    width: 70.w,
                    radius: 2.r,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(translator.translate("checkout_items_screen.sold_by"),
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 4.h,
            ),
            Text(widget.vendor, style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (widget.quantity > 1) {
                        print("CCc");
                        BlocProvider.of<BasketCubit>(context)
                            .updateQuantityInLocalBasket(
                                int.parse(widget.productId.toString()),
                                int.parse(widget.quantity.toString()) - 1);
                      }
                      // else
                      //   if (widget.quantity > 1) widget.quantity--;
                    });
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
                    setState(() {
                      //if(widget.isLocal){
                      BlocProvider.of<BasketCubit>(context)
                          .updateQuantityInLocalBasket(
                              int.parse(widget.productId.toString()),
                              int.parse(widget.quantity.toString()) + 1);
                      //}else
                      // widget.quantity++;
                    });
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
                              color: Theme.of(context).primaryColor,
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
                                    color: Theme.of(context).primaryColor,
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
                    BlocProvider.of<BasketCubit>(context)
                        .deleteFromLocalBasket(int.parse(widget.productId));

                    if (widget.isLocal) {
                    } else {
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
