import 'package:coffepedia/business_logic/orders_history/orders_history_cubit.dart';
import 'package:coffepedia/data/repository/orders_history_repository.dart';
import 'package:coffepedia/data/web_services/order_history_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/widgets/empty_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../main.dart';

class OrdersHistoryProvider extends StatelessWidget {
  const OrdersHistoryProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersHistoryCubit(
          OrdersHistoryRepository(OrderHistoryWebServices())),
      child: OrdersHistoryScreen(),
    );
  }
}

class OrdersHistoryScreen extends StatefulWidget {
  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  @override
  void initState() {
    BlocProvider.of<OrdersHistoryCubit>(context).getOrdersHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
        screen: Scaffold(
      body: SingleChildScrollView(
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
                    Icons.chevron_left,
                    size: 24.w,
                  ),
                  color: Color(0xff000000),
                ),
                Text(
                  translator.translate("order_history_screen.order_history"),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18.sp),
                ),
              ],
            ),
            BlocBuilder<OrdersHistoryCubit, OrdersHistoryState>(
              builder: (context, state) {
                if (state is OrdersHistoryLoaded) {
                  return state.orderHistory!.data!.length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.orderHistory!.data!.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 16.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.12),
                                    offset: Offset(0, 2),
                                    blurRadius: 11.sp,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: ExpansionTile(
                                collapsedIconColor: Color(0xff000000),
                                iconColor: Color(0xff000000),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: 12.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            translator.translate(
                                                "order_history_screen.status"),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Container(
                                            height: 17.h,
                                            width: 67.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: state
                                                          .orderHistory!
                                                          .data![index]!
                                                          .statusColor !=
                                                      'null'
                                                  ? HexColor(state
                                                      .orderHistory!
                                                      .data![index]!
                                                      .statusColor!)
                                                  : Theme.of(context)
                                                      .primaryColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(12.5.r),
                                                bottomRight:
                                                    Radius.circular(12.5.r),
                                                bottomLeft:
                                                    Radius.circular(12.5.r),
                                              ),
                                            ),
                                            child: Text(
                                              state.orderHistory!.data![index]!
                                                  .status!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(fontSize: 10.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            translator.translate(
                                                "order_history_screen.date"),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Text(
                                            state.orderHistory!.data![index]!
                                                .date!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                tilePadding: EdgeInsets.symmetric(
                                    vertical: 18.h, horizontal: 16.w),
                                title: Text(
                                  '${translator.translate("order_history_screen.order_id")}: ${state.orderHistory!.data![index]!.id!}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 14.sp,
                                      ),
                                ),
                                children: [
                                  Divider(
                                    thickness: 1.h,
                                    color: Color(0xffE3E3E3),
                                  ),
                                  ListView.builder(
                                    itemCount: state.orderHistory!.data![index]!
                                        .items!.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, itemsIndex) =>
                                        ListTile(
                                      title: Text(
                                        state.orderHistory!.data![index]!
                                            .items![itemsIndex]!.name!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                      subtitle: Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Text(
                                          'x${state.orderHistory!.data![index]!.items![itemsIndex]!.quantity!.toString()}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ),
                                      trailing: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6.h, horizontal: 17.w),
                                        decoration: BoxDecoration(
                                          color: Color(0xffF4F4F4),
                                          borderRadius:
                                              BorderRadius.circular(7.sp),
                                        ),
                                        child: Image.network(
                                          state.orderHistory!.data![index]!
                                              .items![itemsIndex]!.image!,
                                          fit: BoxFit.cover,
                                          height: 48.h,
                                          width: 26.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Color(0xffF8F8F8),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 19.w, vertical: 16.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          translator.translate(
                                              "order_history_screen.payment_method"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),

                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          state.orderHistory!.data![index]!
                                              .paymentMethod!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(fontSize: 13.sp),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        // Row(
                                        //   children: [
                                        //     SvgPicture.asset(Assets.imagesVisaLogo),
                                        //     SizedBox(
                                        //       width: 25.w,
                                        //     ),
                                        //     Text(
                                        //       '**** **** **** 5089',
                                        //       style: Theme.of(context)
                                        //           .textTheme
                                        //           .headline5,
                                        //     ),
                                        //   ],
                                        // ),

                                        Text(
                                          '${translator.translate("order_history_screen.subtotal")}            ${translator.translate("order_history_screen.egp")} ${state.orderHistory!.data![index]!.subTotal}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(fontSize: 12.sp),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          '${translator.translate("order_history_screen.discount")}            ${translator.translate("order_history_screen.egp")} ${state.orderHistory!.data![index]!.discount}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(fontSize: 12.sp),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          '${translator.translate("order_history_screen.cod")}            ${translator.translate("order_history_screen.egp")} ${state.orderHistory!.data![index]!.deliveryCharge}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3!
                                              .copyWith(fontSize: 12.sp),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          '${translator.translate("order_history_screen.total")}            ${translator.translate("order_history_screen.egp")} ${state.orderHistory!.data![index]!.totalPrice}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : EmptyWidgets(
                          image: Assets.noOrdersHistory,
                          title: "Your Wallet is Empty",
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const HomePage(currentIndex: 0);
                                },
                              ),
                            );
                          },
                          description:
                              "Make a purchase and gain credit to your wallet",
                          buttonTitle: "Shop now",
                        );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(6.sp),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Color.fromRGBO(0, 0, 0, 0.12),
            //           offset: Offset(0, 2),
            //           blurRadius: 11.sp,
            //         ),
            //       ],
            //       color: Colors.white,
            //     ),
            //     child: ExpansionTile(
            //       collapsedIconColor: Color(0xff000000),
            //       iconColor: Color(0xff000000),
            //       initiallyExpanded: true,
            //       subtitle: Padding(
            //         padding: EdgeInsets.only(
            //           top: 12.h,
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   'Status',
            //                   style: Theme.of(context).textTheme.headline3,
            //                 ),
            //                 SizedBox(
            //                   height: 6.h,
            //                 ),
            //                 Container(
            //                   height: 17.h,
            //                   width: 67.w,
            //                   alignment: Alignment.center,
            //                   decoration: BoxDecoration(
            //                     color: Color(0xff14B93B),
            //                     borderRadius: BorderRadius.only(
            //                       topLeft: Radius.circular(12.5.r),
            //                       bottomRight: Radius.circular(12.5.r),
            //                       bottomLeft: Radius.circular(12.5.r),
            //                     ),
            //                   ),
            //                   child: Text(
            //                     'Confirmed',
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .headline2!
            //                         .copyWith(fontSize: 10.sp),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   'Date',
            //                   style: Theme.of(context).textTheme.headline3,
            //                 ),
            //                 SizedBox(
            //                   height: 6.h,
            //                 ),
            //                 Text(
            //                   '30 Apr 2021',
            //                   style:
            //                       Theme.of(context).textTheme.caption!.copyWith(
            //                             fontSize: 13.sp,
            //                             fontWeight: FontWeight.w600,
            //                           ),
            //                 )
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       tilePadding:
            //           EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
            //       title: Text(
            //         'Order ID: 3457689654',
            //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
            //               fontSize: 14.sp,
            //             ),
            //       ),
            //       children: [
            //         Divider(
            //           thickness: 1.h,
            //           color: Color(0xffE3E3E3),
            //         ),
            //         ListTile(
            //           title: Text(
            //             'CoffePedia Dark Espresso Roast COFFEE',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .bodyText1!
            //                 .copyWith(fontSize: 12.sp),
            //           ),
            //           subtitle: Padding(
            //             padding: EdgeInsets.only(top: 10.h),
            //             child: Text(
            //               'x2',
            //               style: Theme.of(context).textTheme.headline4,
            //             ),
            //           ),
            //           trailing: Container(
            //             padding: EdgeInsets.symmetric(
            //                 vertical: 6.h, horizontal: 17.w),
            //             decoration: BoxDecoration(
            //               color: Color(0xffF4F4F4),
            //               borderRadius: BorderRadius.circular(7.sp),
            //             ),
            //             child: Image.asset(
            //               Assets.imagesPack,
            //               fit: BoxFit.cover,
            //               height: 48.h,
            //               width: 26.w,
            //             ),
            //           ),
            //         ),
            //         ListTile(
            //           title: Text(
            //             'Starbucks Dark Roast Whole Bean Coffee — Sumatra — 100%',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .bodyText1!
            //                 .copyWith(fontSize: 12.sp),
            //           ),
            //           subtitle: Padding(
            //             padding: EdgeInsets.only(top: 10.h),
            //             child: Text(
            //               'x1',
            //               style: Theme.of(context).textTheme.headline4,
            //             ),
            //           ),
            //           trailing: Container(
            //             padding: EdgeInsets.symmetric(
            //                 vertical: 6.h, horizontal: 17.w),
            //             decoration: BoxDecoration(
            //               color: Color(0xffF4F4F4),
            //               borderRadius: BorderRadius.circular(7.sp),
            //             ),
            //             child: Image.asset(
            //               Assets.imagesPack,
            //               fit: BoxFit.cover,
            //               height: 48.h,
            //               width: 26.w,
            //             ),
            //           ),
            //         ),
            //         ListTile(
            //           title: Text(
            //             'Roll over image to zoom in Parisi Artisian Coffee 32 Oz., Bolivian',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .bodyText1!
            //                 .copyWith(fontSize: 12.sp),
            //           ),
            //           subtitle: Padding(
            //             padding: EdgeInsets.only(top: 10.h),
            //             child: Text(
            //               'x1',
            //               style: Theme.of(context).textTheme.headline4,
            //             ),
            //           ),
            //           trailing: Container(
            //             padding: EdgeInsets.symmetric(
            //                 vertical: 6.h, horizontal: 17.w),
            //             decoration: BoxDecoration(
            //               color: Color(0xffF4F4F4),
            //               borderRadius: BorderRadius.circular(7.sp),
            //             ),
            //             child: Image.asset(
            //               Assets.imagesPack,
            //               fit: BoxFit.cover,
            //               height: 48.h,
            //               width: 26.w,
            //             ),
            //           ),
            //         ),
            // Container(
            //   color: Color(0xffF8F8F8),
            //   width: MediaQuery.of(context).size.width,
            //   padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Payment Method',
            //         style: Theme.of(context).textTheme.headline3,
            //       ),
            //       SizedBox(
            //         height: 5.h,
            //       ),
            //       Row(
            //         children: [
            //           SvgPicture.asset(Assets.imagesVisaLogo),
            //           SizedBox(
            //             width: 25.w,
            //           ),
            //           Text(
            //             '**** **** **** 5089',
            //             style: Theme.of(context).textTheme.headline5,
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 8.h,
            //       ),
            //       Text(
            //         'Subtotal               EGP 845',
            //         style: Theme.of(context)
            //             .textTheme
            //             .headline3!
            //             .copyWith(fontSize: 12.sp),
            //       ),
            //       SizedBox(
            //         height: 8.h,
            //       ),
            //       Text(
            //         'COD                       EGP 15',
            //         style: Theme.of(context)
            //             .textTheme
            //             .headline3!
            //             .copyWith(fontSize: 12.sp),
            //       ),
            //       SizedBox(
            //         height: 10.h,
            //       ),
            //       Text(
            //         'Total                   EGP 860',
            //         style: Theme.of(context)
            //             .textTheme
            //             .bodyText1!
            //             .copyWith(fontSize: 13.sp),
            //       ),
            //     ],
            //   ),
            // ),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(6.sp),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Color.fromRGBO(0, 0, 0, 0.12),
            //           offset: Offset(0, 2),
            //           blurRadius: 11.sp,
            //         ),
            //       ],
            //       color: Colors.white,
            //     ),
            //     child: ExpansionTile(
            //       collapsedIconColor: Color(0xff000000),
            //       iconColor: Color(0xff000000),
            //       subtitle: Padding(
            //         padding: EdgeInsets.only(top: 12.h),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   'Status',
            //                   style: Theme.of(context).textTheme.headline3,
            //                 ),
            //                 SizedBox(
            //                   height: 6.h,
            //                 ),
            //                 Container(
            //                   height: 17.h,
            //                   width: 67.w,
            //                   alignment: Alignment.center,
            //                   decoration: BoxDecoration(
            //                     color: Theme.of(context).primaryColor,
            //                     borderRadius: BorderRadius.only(
            //                       topLeft: Radius.circular(12.5.r),
            //                       bottomRight: Radius.circular(12.5.r),
            //                       bottomLeft: Radius.circular(12.5.r),
            //                     ),
            //                   ),
            //                   child: Text(
            //                     'Delivered',
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .headline2!
            //                         .copyWith(fontSize: 10.sp),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   'Date',
            //                   style: Theme.of(context).textTheme.headline3,
            //                 ),
            //                 SizedBox(
            //                   height: 6.h,
            //                 ),
            //                 Text(
            //                   '14 Aug 2021',
            //                   style:
            //                       Theme.of(context).textTheme.caption!.copyWith(
            //                             fontSize: 13.sp,
            //                             fontWeight: FontWeight.w600,
            //                           ),
            //                 )
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //
            //       tilePadding:
            //           EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
            //       title: Text(
            //         'Order ID: 76970773690',
            //         style: Theme.of(context).textTheme.bodyText1!.copyWith(
            //               fontSize: 14.sp,
            //             ),
            //       ),
            //       //childrenPadding: EdgeInsets.all(15),
            //       // children: [
            //       //   Row(
            //       //     children: [
            //       //       Column(
            //       //         crossAxisAlignment: CrossAxisAlignment.start,
            //       //         children: [
            //       //           Text('Status'),
            //       //           SizedBox(
            //       //             height: 6.h,
            //       //           ),
            //       //           Container(
            //       //             height: 17.h,
            //       //             width: 67.w,
            //       //             alignment: Alignment.center,
            //       //             decoration: BoxDecoration(
            //       //               color: Theme.of(context).primaryColor,
            //       //               borderRadius: BorderRadius.only(
            //       //                 topLeft: Radius.circular(12.5.h),
            //       //                 bottomRight: Radius.circular(12.5.h),
            //       //                 bottomLeft: Radius.circular(12.5.h),
            //       //               ),
            //       //             ),
            //       //             child: Text(
            //       //               'Delivered',
            //       //               style: Theme.of(context)
            //       //                   .textTheme
            //       //                   .headline2!
            //       //                   .copyWith(fontSize: 10.sp),
            //       //             ),
            //       //           ),
            //       //         ],
            //       //       ),
            //       //       Column(
            //       //         children: [],
            //       //       ),
            //       //     ],
            //       //   ),
            //       // ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    ));
  }
}
