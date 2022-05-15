import 'package:appmetrica_sdk/appmetrica_sdk.dart';
import 'package:coffepedia/business_logic/payments/payments_cubit.dart';
import 'package:coffepedia/data/repository/payments_repository.dart';
import 'package:coffepedia/data/web_services/payments_web_services.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/success_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class PaymentInfoScreenProvider extends StatelessWidget {
  final String addressId;
  final String coupon;
  const PaymentInfoScreenProvider({
    required this.addressId,
    required this.coupon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentsCubit(
        PaymentsRepository(
          PaymentsWebServices(),
        ),
      ),
      child: PaymentInfoScreen(addressId: addressId, coupon: coupon),
    );
  }
}

class PaymentInfoScreen extends StatefulWidget {
  final String addressId;
  final String coupon;

  const PaymentInfoScreen({
    required this.addressId,
    required this.coupon,
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentInfoScreen> createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  int? _selectedIndex;
  int? _paymentId = 0;

  @override
  void initState() {
    BlocProvider.of<PaymentsCubit>(context).getPayments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Scaffold(
        bottomNavigationBar: Container(
          height: 107.h,
          child: Container(
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
              title: translator.translate("payment_info_screen.pay_now"),
              onPress: _paymentId == 0
                  ? () {}
                  : () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            print('add124 ${widget.addressId}');
                            return SuccessScreenProvider(
                                paymentId: _paymentId!,
                                addressId: widget.addressId,
                                coupon: widget.coupon);
                          },
                        ),
                        ModalRoute.withName('/'),
                      );
                      AppmetricaSdk()
                          .reportEvent(name: 'Payment id $_paymentId');
                    },
              width: 345.w,
              height: 50.h,
              borderRadius: 25.r,
              buttonColor: _paymentId == 0
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
        body: BlocBuilder<PaymentsCubit, PaymentsState>(
          builder: (context, state) {
            if (state is PaymentsLoaded) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          translator
                              .translate("payment_info_screen.payment_info"),
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
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
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Container(
                            height: 27.h,
                            width: 25.w,
                            alignment: Alignment.center,
                            child: Text(
                              '3',
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
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translator
                              .translate("delivery_info_screen.delivery_info"),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          translator
                              .translate("checkout_items_screen.order_summary"),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          translator
                              .translate("delivery_info_screen.payment_info"),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 27.h),
                      child: Text(
                        translator.translate(
                            "payment_info_screen.select_payment_method"),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.payments!.data!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 12.h),
                          child: Container(
                            width: 343.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.r),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: _selectedIndex == index
                              //         ? Color.fromRGBO(16, 124, 192, 0.41)
                              //         : Colors.transparent,
                              //     blurRadius: 7.r,
                              //   ),
                              // ],
                            ),
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              style: ButtonStyle(
                                alignment: Alignment.center,
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                    color: _selectedIndex == index
                                        ? Theme.of(context).primaryColor
                                        : Color(0xffE3E3E3),
                                  ),
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                ),
                              ),
                              child: RadioListTile(
                                activeColor: Theme.of(context).primaryColor,
                                groupValue: _selectedIndex,
                                value: index,
                                contentPadding: EdgeInsets.zero,
                                secondary: Container(
                                  width: 60.w,
                                  height: 35.h,
                                  child: Image.network(
                                    state.payments!.data![index]!.logo!,
                                  ),
                                ),
                                // state.payments!.data![index]!.name! ==
                                //         state.payments!.data![0]!.name!
                                //     ? Text(
                                //         '+ EGP 15',
                                //         style:
                                //             Theme.of(context).textTheme.headline4,
                                //       )
                                //     : state.payments!.data![index]!.name! ==
                                //             state.payments!.data![1]!.name!
                                //         ? SizedBox.shrink()
                                //         : state.payments!.data![index]!.name! ==
                                //                 state.payments!.data![2]!.name!
                                //             ? SvgPicture.asset(
                                //                 Assets.fawryImage,
                                //                 height: 30.h,
                                //                 width: 30.w,
                                //               )
                                //             : SvgPicture.asset(
                                //                 Assets.imagesMastercardLogo,
                                //                 height: 40.h,
                                //                 width: 40.w,
                                //               ),
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _selectedIndex = value;
                                    _paymentId =
                                        state.payments!.data![index]!.id;
                                  });
                                  print(
                                      '${translator.translate("payment_info_screen.payment_id")}: ${state.payments!.data![index]!.id}');
                                },
                                title: Text(
                                  state.payments!.data![index]!.name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                        fontSize: 14.sp,
                                      ),
                                ),
                                // subtitle:
                                // _selectedIndex == index &&
                                //         _selectedIndex == 1
                                //     ? Form(
                                //         child: Column(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             SizedBox(
                                //               height: 22.h,
                                //             ),
                                //             Text(
                                //               'Card Holder Name',
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .headline3!
                                //                   .copyWith(fontSize: 12.sp),
                                //             ),
                                //             SizedBox(
                                //               height: 9.h,
                                //             ),
                                //             CustomTextFormField(
                                //               hintText: 'Card Holder Name',
                                //               keyboardType: TextInputType.text,
                                //               width: 311.w,
                                //               suffix: SizedBox.shrink(),
                                //               height: 40.h,
                                //             ),
                                //             SizedBox(
                                //               height: 16.h,
                                //             ),
                                //             Text(
                                //               'Card Number',
                                //               style: Theme.of(context)
                                //                   .textTheme
                                //                   .headline3!
                                //                   .copyWith(fontSize: 12.sp),
                                //             ),
                                //             SizedBox(
                                //               height: 9.h,
                                //             ),
                                //             CustomTextFormField(
                                //               hintText: 'Card Number',
                                //               keyboardType: TextInputType.number,
                                //               width: 311.w,
                                //               height: 40.h,
                                //               suffix: Container(
                                //                 width: 115.w,
                                //                 child: Row(
                                //                   children: [
                                //                     Container(
                                //                       height: 28.h,
                                //                       width: 51.w,
                                //                       padding:
                                //                           EdgeInsets.all(3.h),
                                //                       decoration: BoxDecoration(
                                //                         border: Border.all(
                                //                           color:
                                //                               Color(0xffF3F1F1),
                                //                           width: 1.w,
                                //                         ),
                                //                         borderRadius:
                                //                             BorderRadius.circular(
                                //                                 5.r),
                                //                       ),
                                //                       child: SvgPicture.asset(
                                //                         Assets
                                //                             .imagesMastercardLogo,
                                //                         // height: 24.h,
                                //                         // width: 50.w,
                                //                         fit: BoxFit.fill,
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                       width: 9.w,
                                //                     ),
                                //                     Container(
                                //                       height: 28.h,
                                //                       width: 51.w,
                                //                       padding:
                                //                           EdgeInsets.all(3.h),
                                //                       decoration: BoxDecoration(
                                //                         border: Border.all(
                                //                           color:
                                //                               Color(0xffF3F1F1),
                                //                           width: 1.w,
                                //                         ),
                                //                         borderRadius:
                                //                             BorderRadius.circular(
                                //                                 5.r),
                                //                       ),
                                //                       child: SvgPicture.asset(
                                //                         Assets.imagesVisaLogo,
                                //                         fit: BoxFit.fill,
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ),
                                //             SizedBox(
                                //               height: 16.h,
                                //             ),
                                //             Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.spaceBetween,
                                //               children: [
                                //                 Text(
                                //                   'Card Number',
                                //                   style: Theme.of(context)
                                //                       .textTheme
                                //                       .headline3!
                                //                       .copyWith(fontSize: 12.sp),
                                //                 ),
                                //                 Text(
                                //                   'CVV',
                                //                   style: Theme.of(context)
                                //                       .textTheme
                                //                       .headline3!
                                //                       .copyWith(fontSize: 12.sp),
                                //                 ),
                                //               ],
                                //             ),
                                //             SizedBox(
                                //               height: 9.h,
                                //             ),
                                //             Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.spaceBetween,
                                //               children: [
                                //                 Expanded(
                                //                   flex: 3,
                                //                   child: CustomTextFormField(
                                //                     hintText: 'MM',
                                //                     keyboardType:
                                //                         TextInputType.number,
                                //                     width: 10.w,
                                //                     height: 40.h,
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 8.w,
                                //                 ),
                                //                 Expanded(
                                //                   flex: 3,
                                //                   child: CustomTextFormField(
                                //                     hintText: 'YY',
                                //                     keyboardType:
                                //                         TextInputType.number,
                                //                     width: 10.w,
                                //                     height: 40.h,
                                //                   ),
                                //                 ),
                                //                 SizedBox(
                                //                   width: 8.w,
                                //                 ),
                                //                 Expanded(
                                //                   flex: 2,
                                //                   child: CustomTextFormField(
                                //                     hintText: 'CVV',
                                //                     keyboardType:
                                //                         TextInputType.number,
                                //                     width: 20.w,
                                //                     height: 40.h,
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //             SizedBox(
                                //               height: 16.h,
                                //             ),
                                //           ],
                                //         ),
                                //       )
                                //     : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Divider(
                    //   color: Color(0xff979797),
                    //   thickness: 0.7.h,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 23.h, right: 15.w, left: 15.w),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         'Wallet Balance',
                    //         style: Theme.of(context).textTheme.caption,
                    //       ),
                    //       Text(
                    //         'EGP199',
                    //         style: Theme.of(context).textTheme.headline4,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                    //     child: CheckboxWidget(
                    //       title: 'Use my wallet balance in this order',
                    //     )),
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
    );
  }
}
