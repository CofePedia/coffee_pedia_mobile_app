import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'checkout_item.dart';
import 'delivery_info_screen.dart';

class CheckoutItemsScreenProvider extends StatelessWidget {
  const CheckoutItemsScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasketCubit(BasketRepository(BasketWebServices())),
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
    BlocProvider.of<BasketCubit>(context).getBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocBuilder<BasketCubit, BasketState>(
        builder: (context, state) {
          if (state is BasketLoaded) {
            return SingleChildScrollView(
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
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
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
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: CheckoutItemProvider(
                            productId: state.basket!.data!.items![index]!.id!
                                .toString(),
                            price: state.basket!.data!.items![index]!.price!
                                .toString(),
                            title: state.basket!.data!.items![index]!.name!,
                            priceBeforeDiscount: state.basket!.data!
                                .items![index]!.priceBeforeDiscount
                                .toString(),
                            image: state.basket!.data!.items![index]!.image!,
                            quantity:
                                state.basket!.data!.items![index]!.quantity!,
                            vendor: state.basket!.data!.items![index]!.vendor!,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 15.75.h),
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
                                  borderRadius: BorderRadius.circular(5.w),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.w,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.w),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: Theme.of(context).textTheme.headline4),
                            Text("EGP 840",
                                style: Theme.of(context).textTheme.headline4),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Discount",
                                style: Theme.of(context).textTheme.headline4),
                            Text("- EGP 120",
                                style: Theme.of(context).textTheme.headline4),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery charge"),
                            Text("+ EGP 50"),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.h, bottom: 28.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total price",
                                  style: Theme.of(context).textTheme.headline4),
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
            );
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
