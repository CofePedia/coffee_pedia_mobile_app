import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/business_logic/product/product_cubit.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/ui/delivery_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutPopUpProvider extends StatelessWidget {
  final String? image;
  final String? title;
  final String? totalPrice;
  final ProductLoaded state;
  const CheckoutPopUpProvider({
    required this.image,
    required this.totalPrice,
    required this.title,
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasketCubit(
        BasketRepository(
          BasketWebServices(),
        ),
      ),
      child: CheckoutPopUp(
        image: image,
        title: title,
        totalPrice: totalPrice,
        state: state,
      ),
    );
  }
}

class CheckoutPopUp extends StatelessWidget {
  const CheckoutPopUp({
    required this.title,
    required this.totalPrice,
    required this.image,
    required this.state,
    Key? key,
  }) : super(key: key);
  //
  final String? image;
  final String? title;
  final String? totalPrice;
  final ProductLoaded state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60.h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 6.h),
                  margin: EdgeInsets.only(right: 12.w),
                  child: Image.network(
                    image!,
                  ),
                ),
                Expanded(
                  child: Text(
                    title!,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Color(0xff231F20), height: 1.5.h),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TOTAL",
                      style: Theme.of(context).textTheme.overline,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "EGP $totalPrice",
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          BlocListener<BasketCubit, BasketState>(
            listener: (context, state) {
              if (state is AddToBasketIsPressed)
                BotToast.showText(text: 'state.addToBasket!.data!.msg![0]!');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const DeliveryInfoScreenProvider();
                  },
                ),
              );
            },
            child: BlocBuilder<BasketCubit, BasketState>(
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 22.h, bottom: 7.h),
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<BasketCubit>(context).getAddToBasket([
                        {"product_id": 1, "quantity": 5}
                      ]);
                      // if (state is AddToBasketIsPressed) {
                      //   print(112);
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) {
                      //         return const DeliveryInfoScreenProvider();
                      //       },
                      //     ),
                      //   );
                      // } else {
                      //   print(111);
                      //   Center(
                      //     child: CircularProgressIndicator(),
                      //   );
                      // }
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
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Continue Shopping",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
