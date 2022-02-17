import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/business_logic/me/me_cubit.dart';
import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/repository/me_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/data/web_services/me_web_services.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:coffepedia/ui/basket_empty_screen.dart';
import 'package:coffepedia/ui/screens/intro/login_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'checkout_item.dart';
import 'delivery_info_screen.dart';

class CheckoutItemsScreenProvider extends StatelessWidget {
  const CheckoutItemsScreenProvider({Key? key}) : super(key: key);

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
      child: CheckoutItemsScreen(),
    );
  }
}

class CheckoutItemsScreen extends StatefulWidget {
  const CheckoutItemsScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutItemsScreen> createState() => _CheckoutItemsScreenState();
}

class _CheckoutItemsScreenState extends State<CheckoutItemsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }
  bool isLoggedIn = false;
  init() async{
    BlocProvider.of<MeCubit>(context).getMe();
    //final userDao = UserDao();
    //GetTokenDatabase? token = await userDao.getUserToken();
  }

  localBasket(int totalItems, List<BasketDataItems?>? localProducts) {
    List<Map<String, String>> getLocalBasket = [];
    if (localProducts!.length > 0)
      localProducts.forEach(
        (element) {
          getLocalBasket.add(
            {
              'product_id': element!.id.toString(),
              'quantity': element.quantity.toString()
            },
          );
        },
      );
    print("localProducts $getLocalBasket");
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BasketCubit>(context).getAllLocalProductsFromBasket();
    // BlocProvider.of<BasketCubit>(context).getBasket();
    return MultiBlocListener(
      listeners: [
        BlocListener<BasketCubit, BasketState>(
        listener: (context, state) {
          if(state is AddToBasketIsPressed){
            print("AddToBasketIsPressed");
            BlocProvider.of<BasketCubit>(context).getBasket();
          }
          else if (state is RemoveFromBasketIsPressed) {
            BotToast.showText(text: state.removeFromBasket!.data!.msg!);
            print("MyQuerySoundEffectsEnabled 2");
            BlocProvider.of<BasketCubit>(context).getBasket();
          }
          else if (state is RemoveFromLocalBasketIsPressed ){
            print("MyQuerySoundEffectsEnabled 1");
            BotToast.showText(text: "removed from basket");
            BlocProvider.of<BasketCubit>(context).getAllLocalProductsFromBasket();
            BlocProvider.of<BasketCubit>(context).getBasket();
          }
          else if (state is UpdateLocalBasket ){
            print("MyQuerySoundEffectsEnabled 2");
            BotToast.showText(text: "updated to basket");
            BlocProvider.of<BasketCubit>(context).getAllLocalProductsFromBasket();
            BlocProvider.of<BasketCubit>(context).getBasket();
          }
          else if (state is AddedLocalBasket ){
            print("MyQuerySoundEffectsEnabled 3");
            BotToast.showText(text: "added to basket");
            BlocProvider.of<BasketCubit>(context).getAllLocalProductsFromBasket();
            BlocProvider.of<BasketCubit>(context).getBasket();
          }
        },
      ),

        BlocListener<MeCubit, MeState>(
          listener: (context, state) {
            if (state is MeIsLoaded) {
              print("user");
              isLoggedIn = true;
              // BlocProvider.of<BasketCubit>(context).getBasket();
            }else if (state is MeIsNotExist){
              // BlocProvider.of<BasketCubit>(context).getAllLocalProductsFromBasket();
              isLoggedIn = false;
              print("local");
            }
          },
      ),

      ],

      child: BlocBuilder<BasketCubit, BasketState>(

        builder: (context, state) {
          /*if (state is BasketLoaded) {
            print("basket loaded not local");
            localBasket(state.basket!.data!.totalItems!,
                state.basket!.data!.items);
            return state.basket!.data!.items!.length > 0
                ? Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(bottom: 69.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 92.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 21.h,
                      horizontal: 15.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22.r),
                        topRight: Radius.circular(22.r),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const DeliveryInfoScreenProvider();
                            },
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                        ),
                      ),
                      child: Text(
                        "Proceed to checkout",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shopping Basket",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 24.6.h,
                                horizontal: 0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Items",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "(${state.basket!.data!.totalItems} Item)",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: state.basket!.data!.items!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 16.w),
                              child: CheckoutItemProvider(
                                productId: state
                                    .basket!.data!.items![index]!.id!
                                    .toString(),
                                price: state
                                    .basket!.data!.items![index]!.price!
                                    .toString(),
                                title: state
                                    .basket!.data!.items![index]!.name!,
                                priceBeforeDiscount: state.basket!.data!
                                    .items![index]!.priceBeforeDiscount
                                    .toString(),
                                image: state
                                    .basket!.data!.items![index]!.image!,
                                quantity: state
                                    .basket!.data!.items![index]!.quantity!,
                                vendor: state
                                    .basket!.data!.items![index]!.vendor!,
                                isLocal: false,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                              EdgeInsets.symmetric(vertical: 15.75.h),
                              height: 1.h,
                              color: Color(0xff979797),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xffF8F8F8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Have a coupon?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 14.sp),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              child: Container(
                                height: 40.h,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.all(9.h),
                                    hintText: "Coupon code",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                      color: Color(0xffcccccc),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.w),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(5.w),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.w,
                                      ),
                                    ),
                                    suffixIcon: Container(
                                      height: 40.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5.r),
                                          topRight: Radius.circular(5.r),
                                        ),
                                        color: Color(0xff107CC0),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Apply",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subtotal",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4),
                                Text("EGP 840",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Discount",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4),
                                Text("- EGP 120",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery charge"),
                                Text("+ EGP 50"),
                              ],
                            ),
                            Padding(
                              padding:
                              EdgeInsets.only(top: 16.h, bottom: 28.h),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total price",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                  Text(
                                    "EGP ${state.basket!.data!.total}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                      color: Color(0xff107CC0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     SvgPicture.asset(
                            //       Assets.imagesVisaLogo,
                            //       width: 53.w,
                            //       height: 25.h,
                            //     ),
                            //     SizedBox(
                            //       width: 7.w,
                            //     ),
                            //     SvgPicture.asset(
                            //       Assets.imagesMastercardLogo,
                            //       width: 44.w,
                            //       height: 28.h,
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
                : BasketEmptyScreen();
          }*/
          if(state is LocalBasketLoaded){
          print("basket loaded in local");
          int totalPrice = 0; //total price
          int totalPriceBeforeDiscount = 0; //subtotal
          if(state.basketLocalList.length > 0 ){
            state.basketLocalList.forEach((element) {
              totalPrice = totalPrice + int.parse(element.price.toString());
              totalPriceBeforeDiscount = totalPriceBeforeDiscount + int.parse(element.priceBeforeDiscount.toString());
              totalPrice = totalPrice * element.quantity!;
              totalPriceBeforeDiscount = totalPriceBeforeDiscount * element.quantity!;
            });
          }
          int discount = totalPriceBeforeDiscount - totalPrice;
          totalPrice = totalPrice + 50;


          //TODO: LOCAL
          return state.basketLocalList!.length > 0
              ? Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(bottom: 69.h),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 92.h,
                padding: EdgeInsets.symmetric(
                  vertical: 21.h,
                  horizontal: 15.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.r),
                    topRight: Radius.circular(22.r),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if(isLoggedIn){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DeliveryInfoScreenProvider();
                          },
                        ),
                      );
                    }else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          },
                        ),
                      );
                    }
                    print("M");
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                    ),
                  ),
                  child: Text(
                    "Proceed to checkout",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shopping Basket",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 24.6.h,
                            horizontal: 0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Items",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "(${state.basketLocalList!.length} Item)",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: state.basketLocalList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16.w),
                          child: CheckoutItemProvider(
                            productId: state
                                .basketLocalList![index]!.productId
                                .toString(),
                            price: state
                                .basketLocalList![index]!.price!
                                .toString(),
                            title: state
                                .basketLocalList![index]!.name!,
                            priceBeforeDiscount: state
                                .basketLocalList![index]!.priceBeforeDiscount!,
                            image: state
                                .basketLocalList![index]!.image.toString() ?? "",
                            quantity: int.parse(state
                                .basketLocalList![index]!.quantity.toString()) ,
                            vendor: state
                                .basketLocalList![index]!.vendor!.toString(),
                            isLocal: isLoggedIn ? false : true,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                          EdgeInsets.symmetric(vertical: 15.75.h),
                          height: 1.h,
                          color: Color(0xff979797),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xffF8F8F8),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Have a coupon?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 14.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Container(
                            height: 40.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.all(9.h),
                                hintText: "Coupon code",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                  color: Color(0xffcccccc),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(5.w),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.w,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(5.w),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.w,
                                  ),
                                ),
                                suffixIcon: Container(
                                  height: 40.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5.r),
                                      topRight: Radius.circular(5.r),
                                    ),
                                    color: Color(0xff107CC0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Apply",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4),
                            Text("EGP "+totalPriceBeforeDiscount.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Discount",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4),
                            Text("- EGP "+ discount.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery charge"),
                            Text("+ EGP 50"),
                          ],
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 16.h, bottom: 28.h),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total price",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4),
                              Text(
                                "EGP "+totalPrice.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                  color: Color(0xff107CC0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SvgPicture.asset(
                        //       Assets.imagesVisaLogo,
                        //       width: 53.w,
                        //       height: 25.h,
                        //     ),
                        //     SizedBox(
                        //       width: 7.w,
                        //     ),
                        //     SvgPicture.asset(
                        //       Assets.imagesMastercardLogo,
                        //       width: 44.w,
                        //       height: 28.h,
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
              : BasketEmptyScreen(isLoggedIn: isLoggedIn,);
          }
          else if (state is LocalBasketError){
            return Center(
              child: Text("error"),
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
