import 'package:appmetrica_sdk/appmetrica_sdk.dart';
import 'package:coffepedia/business_logic/most_recent/most_recent_cubit.dart';
import 'package:coffepedia/data/repository/most_recent_repository.dart';
import 'package:coffepedia/data/web_services/most_recent_web_services.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:coffepedia/ui/widgets/item_widget.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostRecent extends StatelessWidget {
  const MostRecent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MostRecentCubit(
        MostRecentRepository(
          MostRecentWebServices(),
        ),
      ),
      child: CardRecentProducts(),
    );
  }
}

class CardRecentProducts extends StatefulWidget {
  const CardRecentProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<CardRecentProducts> createState() => _CardRecentProductsState();
}

class _CardRecentProductsState extends State<CardRecentProducts> {
  @override
  void initState() {
    BlocProvider.of<MostRecentCubit>(context).getMostRecent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostRecentCubit, MostRecentState>(
      builder: (context, state) {
        if (state is MostRecentLoaded) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 286.h,
            child: ListView.builder(
              itemCount: state.mostRecent!.data!.data!.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              itemBuilder: (context, index) {
                final data = state.mostRecent!.data!.data![index]!;
                return ItemWidget(
                  image: data.image!,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductProvider(
                            id: data.id!,
                          );
                        },
                      ),
                    );
                    AppmetricaSdk()
                        .reportEvent(name: 'Most Recent Products ${data.name}');
                  },
                  discount: data.discount!,
                  priceBeforeDiscount: data.priceBeforeDiscount!,
                  title: data.name!,
                  price: data.price!,
                  rate: data.rate!,
                  productId: data.id!.toString(),
                  isFavorite: data.inWishlist!,
                );
                // return Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 6.w),
                //   child: InkWell(
                //     // onTap: () async {
                //     //   final hasData = await Navigator.push(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) {
                //             return ProductProvider(
                //               id: state.mostRecent!.data!.data![index]!.id!,
                //             );
                //           },
                //         ),
                //       );
                //       AppmetricaSdk().reportEvent(
                //           name:
                //               'Most Recent Products ${state.mostRecent!.data!.data![index]!.name}');
                //       // if (hasData == true) {
                //       //   BlocProvider.of<FeaturedProductsCubit>(context)
                //       //       .getFeaturedProducts();
                //       // }
                //     },
                //     child: Container(
                //       height: 262.h,
                //       width: 214.w,
                //       child: Stack(
                //         children: [
                //           Container(
                //             height: 262.h,
                //             width: 214.w,
                //             decoration: BoxDecoration(
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: Color.fromRGBO(0, 0, 0, 0.12),
                //                   blurRadius: 11.r,
                //                   offset: Offset(0, 2),
                //                 ),
                //               ],
                //               color: Colors.white,
                //               borderRadius: BorderRadius.circular(11.r),
                //               // image: DecorationImage(
                //               //   image: AssetImage(
                //               //     Assets.imagesCardWhite,
                //               //   ),
                //               //
                //               //   fit: BoxFit.fitHeight,
                //               // ),
                //             ),
                //           ),
                //           Positioned(
                //             left: 45.w,
                //             right: 45.w,
                //             child: CustomNetworkImage(
                //               imageUrl:
                //                   state.mostRecent!.data!.data![index]!.image!,
                //               height: 130.h,
                //               width: 85.w,
                //               radius: 2,
                //               fit: BoxFit.contain,
                //             ),
                //           ),
                //           Positioned(
                //             top: 135.h,
                //             left: 12.w,
                //             right: 12.w,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     state.mostRecent!.data!.data![index]!
                //                                 .discount ==
                //                             0
                //                         ? SizedBox.shrink()
                //                         : Container(
                //                             height: 17.h,
                //                             width: 55.h,
                //                             alignment: Alignment.center,
                //                             decoration: BoxDecoration(
                //                               color: Color(0xffFFD008),
                //                               borderRadius: BorderRadius.only(
                //                                   topLeft:
                //                                       Radius.circular(12.5.h),
                //                                   bottomRight:
                //                                       Radius.circular(12.5.h),
                //                                   bottomLeft:
                //                                       Radius.circular(12.5.h)),
                //                             ),
                //                             child: Text(
                //                               '${state.mostRecent!.data!.data![index]!.discount}% ${translator.translate("product_screen.off")}',
                //                               style: Theme.of(context)
                //                                   .textTheme
                //                                   .bodyText1,
                //                             ),
                //                           ),
                //                     state.mostRecent!.data!.data![index]!
                //                                 .rate ==
                //                             0
                //                         ? SizedBox.shrink()
                //                         : Row(
                //                             children: [
                //                               SvgPicture.asset(
                //                                   Assets.iconsStarActive),
                //                               SizedBox(
                //                                 width: 6.14.w,
                //                               ),
                //                               Text(
                //                                 state.mostRecent!.data!
                //                                     .data![index]!.rate!
                //                                     .toString(),
                //                               ),
                //                             ],
                //                           ),
                //                   ],
                //                 ),
                //                 SizedBox(
                //                   height: 13.h,
                //                 ),
                //                 Container(
                //                   width: 192.w,
                //                   child: Text(
                //                     state.mostRecent!.data!.data![index]!.name!,
                //                     maxLines: 2,
                //                     overflow: TextOverflow.ellipsis,
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .headline1!
                //                         .copyWith(
                //                             fontSize: 14.sp, height: 1.25),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: state.mostRecent!.data!.data![index]!
                //                               .discount !=
                //                           0
                //                       ? 6.h
                //                       : 24.h,
                //                 ),
                //                 state.mostRecent!.data!.data![index]!
                //                             .discount !=
                //                         0
                //                     ? Text(
                //                         '${state.mostRecent!.data!.data![index]!.priceBeforeDiscount} ${translator.translate("wishlist_screen.egp")}',
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .bodyText2!
                //                             .copyWith(
                //                               decoration:
                //                                   TextDecoration.lineThrough,
                //                               color: Colors.black45,
                //                             ),
                //                       )
                //                     : SizedBox.shrink(),
                //                 SizedBox(
                //                   height: 8.h,
                //                 ),
                //                 Text(
                //                   '${state.mostRecent!.data!.data![index]!.price} ${translator.translate("wishlist_screen.egp")}',
                //                   style: Theme.of(context).textTheme.subtitle1,
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Positioned(
                //             top: 208.h,
                //             right: translator.currentLanguage == 'ar'
                //                 ? null
                //                 : 16.w,
                //             left: translator.currentLanguage == 'ar'
                //                 ? 16.w
                //                 : null,
                //             child: Container(
                //               height: 38.h,
                //               width: 38.w,
                //               decoration: BoxDecoration(
                //                 color: Color(0xffffffff),
                //                 borderRadius: BorderRadius.circular(25),
                //                 boxShadow: [
                //                   BoxShadow(
                //                       color: Color.fromRGBO(0, 0, 0, 0.12),
                //                       offset: Offset(0, 2),
                //                       blurRadius: 11.sp)
                //                 ],
                //               ),
                //               child: WishlistIconWidget(
                //                 productId: state
                //                     .mostRecent!.data!.data![index]!.id!
                //                     .toString(),
                //                 isFavorite: state.mostRecent!.data!
                //                     .data![index]!.inWishlist!,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              },
            ),
          );

          // return Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 200.h,
          //   child: ListView.builder(
          //     itemCount: state.mostRecent!.data!.data!.length,
          //     padding: EdgeInsets.symmetric(horizontal: 11.w),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       return Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 6.w),
          //         child: InkWell(
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return ProductProvider(
          //                     id: state.mostRecent!.data!.data![index]!.id!,
          //                   );
          //                 },
          //               ),
          //             );
          //           },
          //           child: Container(
          //             height: 187.h,
          //             width: 214.w,
          //             child: Stack(
          //               children: [
          //                 Container(
          //                   height: 187.h,
          //                   width: 214.w,
          //                   decoration: BoxDecoration(
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Color.fromRGBO(0, 0, 0, 0.12),
          //                         blurRadius: 11.r,
          //                         offset: Offset(0, 2),
          //                       ),
          //                     ],
          //                     color: Colors.white,
          //                     borderRadius: BorderRadius.circular(
          //                       11.r,
          //                     ),
          //                   ),
          //                 ),
          //                 Positioned(
          //                   right: 22.w,
          //                   child: CustomNetworkImage(
          //                     imageUrl:
          //                         state.mostRecent!.data!.data![index]!.image!,
          //                     width: 90.w,
          //                     height: 101.h,
          //                     radius: 2.h,
          //                   ),
          //                 ),
          //                 state.mostRecent!.data!.data![index]!.rate! == 0
          //                     ? SizedBox.shrink()
          //                     : Positioned(
          //                         top: 33.h,
          //                         left: 12.w,
          //                         child: Row(
          //                           children: [
          //                             SvgPicture.asset(Assets.iconsStarActive),
          //                             SizedBox(
          //                               width: 6.14.w,
          //                             ),
          //                             Text(
          //                               state.mostRecent!.data!.data![index]!
          //                                   .rate!
          //                                   .toString(),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                 Positioned(
          //                   top: 123.h,
          //                   left: 12.w,
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       SizedBox(
          //                         height: 13.h,
          //                       ),
          //                       Container(
          //                         width: 192.w,
          //                         child: Text(
          //                           state.mostRecent!.data!.data![index]!.name!,
          //                           maxLines: 2,
          //                           overflow: TextOverflow.ellipsis,
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .headline1!
          //                               .copyWith(
          //                                   fontSize: 14.sp, height: 1.25),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // );
        } else {
          return RecentProductsShimmerWidget();
        }
      },
    );
  }
}
