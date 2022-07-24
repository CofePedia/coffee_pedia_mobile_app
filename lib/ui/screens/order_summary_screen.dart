import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/basket/basket_cubit.dart';
import 'package:coffepedia/data/repository/basket_repository.dart';
import 'package:coffepedia/data/web_services/basket_web_services.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/payment_info_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryProvider extends StatelessWidget {
  final String addressId;

  const OrderSummaryProvider({
    required this.addressId,
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
      child: OrderSummaryScreen(
        addressId: addressId,
      ),
    );
  }
}

class OrderSummaryScreen extends StatefulWidget {
  OrderSummaryScreen({
    required this.addressId,
    Key? key,
  }) : super(key: key);
  final String addressId;

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController coupon = TextEditingController();
  bool isPressed = false;
  String? subTotal;
  String? discount;
  String? deliveryCharge;
  String? total;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BasketCubit>(context).getOrderSummary(widget.addressId);

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        height: 107.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromRGBO(0, 0, 0, 0.04),
          //     blurRadius: 2.r,
          //   )
          // ],
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        child: CustomButton(
          title: translator.translate("delivery_info_screen.continue"),
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PaymentInfoScreenProvider(
                    addressId: widget.addressId,
                    coupon: coupon.text,
                  );
                },
              ),
            );
          },
          width: 345.w,
          height: 50.h,
          borderRadius: 25.r,
          // buttonColor: Theme.of(context).primaryColor,
        ),
      ),
      body: CheckInternetConnection(
        screen: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20.w,
                    ),
                    color: Color(0xff000000),
                  ),
                  Text(
                    translator.translate("checkout_items_screen.order_summary"),
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontSize: 18.sp,
                        ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 33.h, bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 27.h,
                      width: 25.w,
                      alignment: Alignment.center,
                      child: Text(
                        '1',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(
                          25.r,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 58.w,
                      child: Divider(
                        thickness: 2.h,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      height: 27.h,
                      width: 25.w,
                      alignment: Alignment.center,
                      child: Text(
                        '2',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(
                          25.r,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    SizedBox(
                      width: 58.w,
                      child: Divider(
                        thickness: 2.h,
                        color: Color(0xff9D9D9D),
                      ),
                    ),
                    Container(
                      height: 27.h,
                      width: 25.w,
                      alignment: Alignment.center,
                      child: Text(
                        '3',
                        style: Theme.of(context).textTheme.overline,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xff9D9D9D),
                          width: 2.w,
                        ),
                        borderRadius: BorderRadius.circular(
                          25.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    translator.translate("delivery_info_screen.delivery_info"),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 12.sp,
                        ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    translator.translate("checkout_items_screen.order_summary"),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    translator.translate("delivery_info_screen.payment_info"),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Color(0xff9D9D9D), fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
              BlocListener<BasketCubit, BasketState>(
                listener: (context, state) {
                  if (state is CouponIsPressed) {
                    setState(() {
                      isPressed = true;
                    });
                    if (isPressed == true) {
                      subTotal = state.coupon!.data!.subTotal!.toString();
                      discount = state.coupon!.data!.discount!.toString();
                      deliveryCharge =
                          state.coupon!.data!.deliveryCharge!.toString();
                      total = state.coupon!.data!.totalPrice!.toString();
                    }
                  } else if (state is CouponUnvalid) {
                    BotToast.showText(text: state.error!.toString());
                    setState(() {
                      isPressed = false;
                    });
                  }
                },
                child: BlocBuilder<BasketCubit, BasketState>(
                  builder: (context, state) {
                    if (state is OrderSummaryIsLoaded) {
                      return Container(
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
                              translator.translate(
                                  "checkout_items_screen.have_coupon"),
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
                                  maxLines: 1,
                                  controller: coupon,
                                  showCursor: true,
                                  cursorColor: Theme.of(context).primaryColor,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.black45),
                                  inputFormatters: [
                                    WhiteSpacesInputFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    hintText: translator.translate(
                                        "checkout_items_screen.coupon_code"),
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
                                    alignLabelWithHint: true,
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        if (coupon.text.trim().isNotEmpty) {
                                          BlocProvider.of<BasketCubit>(context)
                                              .getCoupon(coupon.text,
                                                  widget.addressId);
                                        }
                                      },
                                      child: Container(
                                        height: 40.h,
                                        width: 90.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5.r,
                                          ),
                                          color: Color(0xff107CC0),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          translator.translate(
                                              "checkout_items_screen.apply"),
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
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    translator.translate(
                                        "checkout_items_screen.subtotal"),
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                Text(
                                  isPressed == false
                                      ? translator.currentLanguage == "ar"
                                          ? "${state.orderSummary!.data!.subTotal} ${translator.translate("checkout_items_screen.egp")}"
                                          : "${translator.translate("checkout_items_screen.egp")} ${state.orderSummary!.data!.subTotal}"
                                      : translator.currentLanguage == "ar"
                                          ? "$subTotal ${translator.translate("checkout_items_screen.egp")}"
                                          : "${translator.translate("checkout_items_screen.egp")} $subTotal",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    translator.translate(
                                        "checkout_items_screen.discount"),
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                Text(
                                    isPressed == false
                                        ? translator.currentLanguage == "ar"
                                            ? "- ${state.orderSummary!.data!.discount} ${translator.translate("checkout_items_screen.egp")}"
                                            : "- ${translator.translate("checkout_items_screen.egp")} ${state.orderSummary!.data!.discount}"
                                        : translator.currentLanguage == "ar"
                                            ? "- $discount ${translator.translate("checkout_items_screen.egp")}"
                                            : "- ${translator.translate("checkout_items_screen.egp")} $discount",
                                    style:
                                        Theme.of(context).textTheme.headline4),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    translator.translate(
                                        "checkout_items_screen.delivery_charge"),
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                Text(
                                  isPressed == false
                                      ? translator.currentLanguage == "ar"
                                          ? "${state.orderSummary!.data!.deliveryCharge} ${translator.translate("checkout_items_screen.egp")}"
                                          : "${translator.translate("checkout_items_screen.egp")} ${state.orderSummary!.data!.deliveryCharge}"
                                      : translator.currentLanguage == "ar"
                                          ? "$deliveryCharge ${translator.translate("checkout_items_screen.egp")}"
                                          : "${translator.translate("checkout_items_screen.egp")} $deliveryCharge",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16.h, bottom: 28.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    translator.translate(
                                        "checkout_items_screen.total_price"),
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Text(
                                    isPressed == false
                                        ? translator.currentLanguage == "ar"
                                            ? " ${state.orderSummary!.data!.total} ${translator.translate("checkout_items_screen.egp")}"
                                            : "${translator.translate("checkout_items_screen.egp")} ${state.orderSummary!.data!.total}"
                                        : translator.currentLanguage == "ar"
                                            ? " $total ${translator.translate("checkout_items_screen.egp")}"
                                            : "${translator.translate("checkout_items_screen.egp")} $total",
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
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WhiteSpacesInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var string = text.trim();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
