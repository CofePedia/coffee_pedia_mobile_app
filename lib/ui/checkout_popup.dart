import 'package:appmetrica_sdk/appmetrica_sdk.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/business_logic/me/me_cubit.dart';
import 'package:coffepedia/business_logic/product/product_cubit.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/repository/me_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/data/web_services/me_web_services.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';

class CheckoutPopUpProvider extends StatelessWidget {
  final BasketLocal? basketLocal;
  final String? image;
  final String? title;
  final String? totalPrice;
  final ProductLoaded state;

  const CheckoutPopUpProvider({
    required this.image,
    required this.totalPrice,
    required this.title,
    required this.state,
    required this.basketLocal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MeCubit>(
          create: (context) => MeCubit(
            MeRepository(
              MeWebServices(),
            ),
          ),
        ),
        BlocProvider<BasketCubit>(
          create: (context) => BasketCubit(
            BasketRepository(
              BasketWebServices(),
            ),
          ),
        ),
      ],
      child: CheckoutPopUp(
        image: image,
        title: title,
        totalPrice: totalPrice,
        state: state,
        basketLocal: basketLocal!,
      ),
    );
  }
}

class CheckoutPopUp extends StatelessWidget {
  CheckoutPopUp({
    required this.title,
    required this.totalPrice,
    required this.image,
    required this.state,
    required this.basketLocal,
    Key? key,
  }) : super(key: key);

  //

  final BasketLocal? basketLocal;
  final String? image;
  final String? title;
  final String? totalPrice;
  final ProductLoaded state;

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MeCubit>(context).getMe();

    // return Container(
    return CheckInternetConnection(
        screen: Container(
      height: 240.h,
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0.w),
          topRight: Radius.circular(25.0.w),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 75.h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  imageUrl: image!,
                  height: 75.h,
                  width: 75.w,
                  radius: 2.r,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Text(
                    title!,
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Color(0xff231F20), height: 1.5.h),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      translator.translate("checkout_popup.total"),
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(height: 1.5.h),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "$totalPrice " +
                          translator.translate("checkout_popup.egp"),
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          MultiBlocListener(
            listeners: [
              BlocListener<MeCubit, MeState>(
                listener: (context, state) {
                  if (state is MeIsLoaded) {
                    isLoggedIn = true;
                  }
                },
              ),
              BlocListener<BasketCubit, BasketState>(
                listener: (context, state) async {
                  if (state is AddToBasketIsPressed)
                    BotToast.showText(
                        text: 'state.addToBasket!.data!.msg![0]!');
                  else if (state is AddedLocalBasket) {
                    BotToast.showText(text: 'added to local');
                  } else if (state is AddToCartPressed) {
                    /*if (isLoggedIn) {
                      print("MyQuerySoundEffectsEnabled  proceed button with a user");
                      //TODO 1) add the item to the local db..
                      await BlocProvider.of<BasketCubit>(context)
                          .addProductInLocalBasket(BasketLocal(
                          productId: basketLocal!.productId,
                          quantity: basketLocal!.quantity,
                          image: basketLocal!.image,
                          price: basketLocal!.price,
                          vendor: basketLocal!.vendor,
                          name: basketLocal!.name,
                          priceBeforeDiscount:
                          basketLocal!.priceBeforeDiscount)
                      );
                      //TODO 2) get all items from the local database..
                      List<Map<String, int>> basket = [];
                      print("A 1");
                      await BlocProvider.of<BasketCubit>(context)
                          .getAllLocalProductsFromBasket().then((basketInLocal) {
                        print("A 2++");
                        if(basketInLocal == null ) print(" A 2++ null" );
                        if (basketInLocal != null && basketInLocal.isNotEmpty) {
                          print("A 2 inside if");
                          print("A 2 " + basketInLocal.length.toString());
                          basketInLocal.forEach((element) {
                            Map<String, int> basketMap = {
                              "product_id": int.parse(element.productId.toString()),
                              "quantity": int.parse(element.quantity.toString())
                            };
                            basket.add(basketMap);
                          });
                        }else{
                          print("A 2--");
                        }
                      });
                      print("A 3");
                      //TODO 3) send all the products to the database..
                      BlocProvider.of<BasketCubit>(context).getAddToBasket(basket);
                    }
                    else
                      print("No user detected");*/
                  } else
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return const HomePageProvider(currentIndex: 1);
                      },
                    ), (route) => false);
                },
              ),
            ],
            child: BlocBuilder<MeCubit, MeState>(
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      final BasketRepository basketRepository =
                          BasketRepository(
                        BasketWebServices(),
                      );
                      if (state is MeIsLoaded) {
                        print(
                            "MyQuerySoundEffectsEnabled  proceed button with a user");
                        //TODO 1) add the item to the local db..
                        await BlocProvider.of<BasketCubit>(context)
                            .addProductInLocalBasket(BasketLocal(
                                productId: basketLocal!.productId,
                                quantity: basketLocal!.quantity,
                                image: basketLocal!.image,
                                price: basketLocal!.price,
                                vendor: basketLocal!.vendor,
                                name: basketLocal!.name,
                                priceBeforeDiscount:
                                    basketLocal!.priceBeforeDiscount));
                        AppmetricaSdk()
                            .reportEvent(name: 'Added to Server Cart');

                        /*//TODO 2) get all items from the local database..
                        List<Map<String, int>> basket = [];
                        print("A 1");
                        List<BasketLocal> basketInLocal = await basketRepository.getAllLocalProductsFromBasket();
                        print("A 2++");
                        if(basketInLocal == null ) print(" A 2++ null" );
                        if (basketInLocal != null && basketInLocal.isNotEmpty) {
                          print("A 2 inside if");
                          print("A 2 " + basketInLocal.length.toString());
                          basketInLocal.forEach((element) {
                            Map<String, int> basketMap = {
                              "product_id": int.parse(element.productId.toString()),
                              "quantity": int.parse(element.quantity.toString())
                            };
                            basket.add(basketMap);
                          });
                        }else{
                          print("A 2--");
                        }
                        print("A 3");
                        //TODO 3) send all the products to the database..
                        BlocProvider.of<BasketCubit>(context).getAddToBasket(basket);*/
                      } else if (state is MeIsNotExist) {
                        print(
                            "MyQuerySoundEffectsEnabled  proceed button with local");
                        await BlocProvider.of<BasketCubit>(context)
                            .addProductInLocalBasket(BasketLocal(
                                productId: basketLocal!.productId,
                                quantity: basketLocal!.quantity,
                                image: basketLocal!.image,
                                price: basketLocal!.price,
                                vendor: basketLocal!.vendor,
                                name: basketLocal!.name,
                                priceBeforeDiscount:
                                    basketLocal!.priceBeforeDiscount));
                        AppmetricaSdk()
                            .reportEvent(name: 'Added to Local Cart');
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                      ),
                    ),
                    child: Text(
                      translator
                          .translate("checkout_popup.proceed_to_checkout"),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.h),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                translator.translate("checkout_popup.continue_shopping"),
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
