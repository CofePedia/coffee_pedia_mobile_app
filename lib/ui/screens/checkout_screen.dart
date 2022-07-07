import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/widgets/checkout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/repository/basket_repository.dart';
import '../delivery_info_screen.dart';
import '../shared/custom_button.dart';
import 'check_internet_connection.dart';

class CheckoutScreenProvider extends StatelessWidget {
  const CheckoutScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasketCubit(
        BasketRepository(
          BasketWebServices(),
        ),
      ),
      child: CheckoutScreen(),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BasketCubit>(context).getBasket();
    return CheckInternetConnection(
      screen: BlocBuilder<BasketCubit, BasketState>(
        builder: (context, state) {
          if (state is BasketLoaded) {
            final basketState = state.basket!.data!;
            return Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(bottom: 69.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 145.h,
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              translator.translate(
                                  "checkout_items_screen.total_price"),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              "${basketState.total} ${translator.translate("checkout_items_screen.egp")}",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        CustomButton(
                          title: translator.translate(
                              "checkout_items_screen.shopping_basket"),
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DeliveryInfoScreenProvider();
                                },
                              ),
                            );
                          },
                          width: 345.w,
                          height: 50.h,
                          borderRadius: 25.r,
                          // buttonColor: Theme.of(context).primaryColor,
                        ),
                      ],
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
                              translator.translate(
                                  "checkout_items_screen.shopping_basket"),
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
                                    translator.translate(
                                        "checkout_items_screen.items"),
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
                                    "(${basketState.totalItems} ${translator.translate("checkout_items_screen.item")})",
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
                          itemCount: basketState.items!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: CheckoutWidget(
                                productId:
                                    basketState.items![index]!.id!.toString(),
                                stock: basketState.items![index]!.stock!,
                                title: basketState.items![index]!.name!,
                                imageUrl: basketState.items![index]!.image!,
                                price: basketState.items![index]!.price!,
                                priceBeforeDiscount: basketState
                                    .items![index]!.priceBeforeDiscount!,
                                quantity: basketState.items![index]!.quantity!,
                                vendor: basketState.items![index]!.vendor!,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                vertical: 15.75.h,
                              ),
                              height: 1.h,
                              color: Color(0xff979797),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
