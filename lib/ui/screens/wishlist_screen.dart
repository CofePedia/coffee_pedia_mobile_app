import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/wishlist/wishlist_cubit.dart';
import 'package:coffepedia/data/repository/wishlist_repository.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/home_page.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:coffepedia/ui/widgets/category_item_widget.dart';
import 'package:coffepedia/ui/widgets/empty_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class WishlistScreenProvider extends StatelessWidget {
  const WishlistScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit(
        WishlistRepository(
          WishlistWebServices(),
        ),
      ),
      child: WishlistScreen(),
    );
  }
}

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool _isFavorite = true;
  //
  @override
  void initState() {
    BlocProvider.of<WishlistCubit>(context).getWishlist();

    super.initState();
  }
  //
  // void toggleWishlistIcon(
  //   String productId,
  // ) {
  //   setState(() {
  //     BlocProvider.of<WishlistCubit>(context)
  //         .getToggleProductsInWishlist(productId);
  //     _isFavorite = !_isFavorite;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WishlistCubit>(context).getWishlist();

    return CheckInternetConnection(
      screen: Scaffold(
        body: BlocListener<WishlistCubit, WishlistState>(
          listener: (context, state) {
            if (state is ToggleProductsInWishlistIsLoaded) {
              BotToast.showText(
                  text: state.toggleProductsInWishlist!.data!.msg!);
              BlocProvider.of<WishlistCubit>(context).getWishlist();
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 23.w, top: 60.h, right: 23.w, bottom: 35.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20.w,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          translator.translate("wishlist_screen.my_wishlist"),
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    fontSize: 18.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<WishlistCubit, WishlistState>(
                    builder: (context, state) {
                      if (state is WishlistIsLoaded) {
                        return state.wishlist!.data!.length > 0
                            ? Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: GridView.builder(
                                    padding:
                                        EdgeInsets.only(top: 5.h, bottom: 15.h),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 16.h,
                                      crossAxisSpacing: 8.w,
                                      childAspectRatio: 164.5.w / 305.h,
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.wishlist!.data!.length,
                                    itemBuilder: (context, index) {
                                      final data =
                                          state.wishlist!.data![index]!;
                                      return CategoryItemWidget(
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
                                        },
                                        image: data.image!,
                                        discount: data.discount!,
                                        rate: data.rate!,
                                        price: data.price!,
                                        title: data.name!,
                                        priceBeforeDiscount:
                                            data.priceBeforeDiscount!,
                                        productId: data.id!,
                                        isFavorite: data.inWishlist!,
                                      );
                                      // return InkWell(
                                      //   onTap: () {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //         builder: (context) {
                                      //           return ProductProvider(
                                      //             id: 5,
                                      //           );
                                      //         },
                                      //       ),
                                      //     );
                                      //   },
                                      //   child: Container(
                                      //     height: 305.h,
                                      //     width: 164.5.w,
                                      //     child: Stack(
                                      //       fit: StackFit.expand,
                                      //       children: [
                                      //         Container(
                                      //           height: 280.h,
                                      //           width: 164.5.w,
                                      //           child: Image.asset(
                                      //             Assets.imagesCard,
                                      //             fit: BoxFit.cover,
                                      //           ),
                                      //         ),
                                      //         Positioned(
                                      //           right: 17.w,
                                      //           child: CustomNetworkImage(
                                      //             imageUrl: state
                                      //                 .search!.data![index]!.image!,
                                      //             width: 75.w,
                                      //             height: 136.h,
                                      //             radius: 2,
                                      //             fit: BoxFit.cover,
                                      //           ),
                                      //           // child: Container(
                                      //           //   child: Image.network(
                                      //           //     state
                                      //           //         .search!.data![index]!.image!,
                                      //           //     width: 75.w,
                                      //           //     height: 136.h,
                                      //           //     fit: BoxFit.cover,
                                      //           //   ),
                                      //           // ),
                                      //         ),
                                      //         state.search!.data![index]!.rate! != 0
                                      //             ? Positioned(
                                      //                 top: 30.h,
                                      //                 left: 20.w,
                                      //                 child: Row(
                                      //                   children: [
                                      //                     SvgPicture.asset(
                                      //                         Assets.iconsStarActive),
                                      //                     SizedBox(
                                      //                       width: 5.w,
                                      //                     ),
                                      //                     Text(
                                      //                       state.search!
                                      //                           .data![index]!.rate
                                      //                           .toString(),
                                      //                       style: Theme.of(context)
                                      //                           .textTheme
                                      //                           .bodyText2!
                                      //                           .copyWith(
                                      //                             fontWeight:
                                      //                                 FontWeight.w700,
                                      //                           ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               )
                                      //             : SizedBox.shrink(),
                                      //         Positioned(
                                      //           top: 152.h,
                                      //           left: 12.w,
                                      //           child: Padding(
                                      //             padding: EdgeInsets.symmetric(
                                      //                 horizontal: 8.w),
                                      //             child: Column(
                                      //               crossAxisAlignment:
                                      //                   CrossAxisAlignment.start,
                                      //               children: [
                                      //                 state.search!.data![index]!
                                      //                             .discount ==
                                      //                         0
                                      //                     ? SizedBox(
                                      //                         height: 17.h,
                                      //                         width: 55.w,
                                      //                       )
                                      //                     : Container(
                                      //                         height: 17.h,
                                      //                         width: 55.w,
                                      //                         alignment:
                                      //                             Alignment.center,
                                      //                         decoration:
                                      //                             BoxDecoration(
                                      //                           color:
                                      //                               Color(0xffFFD008),
                                      //                           borderRadius:
                                      //                               BorderRadius.only(
                                      //                             topLeft:
                                      //                                 Radius.circular(
                                      //                               12.5.r,
                                      //                             ),
                                      //                             bottomRight:
                                      //                                 Radius.circular(
                                      //                               12.5.r,
                                      //                             ),
                                      //                             bottomLeft:
                                      //                                 Radius.circular(
                                      //                               12.5.r,
                                      //                             ),
                                      //                           ),
                                      //                         ),
                                      //                         child: Text(
                                      //                           '${state.search!.data![index]!.discount}% Off',
                                      //                           style:
                                      //                               Theme.of(context)
                                      //                                   .textTheme
                                      //                                   .bodyText1,
                                      //                         ),
                                      //                       ),
                                      //                 SizedBox(
                                      //                   height: 15.h,
                                      //                 ),
                                      //                 Container(
                                      //                   width: 140.w,
                                      //                   child: Text(
                                      //                     state.search!.data![index]!
                                      //                         .name!,
                                      //                     maxLines: 3,
                                      //                     overflow:
                                      //                         TextOverflow.ellipsis,
                                      //                     style: Theme.of(context)
                                      //                         .textTheme
                                      //                         .headline1!
                                      //                         .copyWith(
                                      //                           fontSize: 14.sp,
                                      //                         ),
                                      //                   ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 12.h,
                                      //                 ),
                                      //                 Text(
                                      //                   'EGP ${state.search!.data![index]!.priceBeforeDiscount}',
                                      //                   style: Theme.of(context)
                                      //                       .textTheme
                                      //                       .bodyText2!
                                      //                       .copyWith(
                                      //                         decoration:
                                      //                             TextDecoration
                                      //                                 .lineThrough,
                                      //                         color: Colors.black45,
                                      //                       ),
                                      //                 ),
                                      //                 SizedBox(
                                      //                   height: 8.h,
                                      //                 ),
                                      //                 Text(
                                      //                   'EGP ${state.search!.data![index]!.price}',
                                      //                   style: Theme.of(context)
                                      //                       .textTheme
                                      //                       .subtitle1,
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ),
                                      //         Positioned(
                                      //           top: 240.h,
                                      //           right: 18.w,
                                      //           child: Container(
                                      //             height: 38.h,
                                      //             width: 38.w,
                                      //             decoration: BoxDecoration(
                                      //               color: Color(0xffffffff),
                                      //               borderRadius:
                                      //                   BorderRadius.circular(25),
                                      //               boxShadow: [
                                      //                 BoxShadow(
                                      //                   color: Color.fromRGBO(
                                      //                       0, 0, 0, 0.12),
                                      //                   offset: Offset(0, 2),
                                      //                   blurRadius: 11.sp,
                                      //                 )
                                      //               ],
                                      //             ),
                                      //             child: WishlistIconWidget(
                                      //               productId: state
                                      //                   .search!.data![index]!.id!
                                      //                   .toString(),
                                      //               isFavorite: state.search!
                                      //                   .data![index]!.inWishlist!,
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // );
                                    }),
                              )

                            // ? Container(
                            //     width: MediaQuery.of(context).size.width,
                            //     padding: EdgeInsets.symmetric(horizontal: 15.w),
                            //     child: GridView.builder(
                            //       shrinkWrap: true,
                            //       padding: EdgeInsets.zero,
                            //       gridDelegate:
                            //           SliverGridDelegateWithFixedCrossAxisCount(
                            //         crossAxisCount: 2,
                            //         mainAxisSpacing: 24.h,
                            //         crossAxisSpacing: 15.5.w,
                            //         childAspectRatio: 164.5.w / 293.h,
                            //         // mainAxisExtent: 5,
                            //       ),
                            //       physics: const NeverScrollableScrollPhysics(),
                            //       itemCount: state.wishlist!.data!.length,
                            //       itemBuilder: (context, index) {
                            //         final item = state.wishlist!.data![index]!;
                            //         return Stack(
                            //           fit: StackFit.loose,
                            //           children: [
                            //             Positioned(
                            //               top: 13.h,
                            //               child: Container(
                            //                 height: 280.h,
                            //                 width: 164.5.w,
                            //                 decoration: BoxDecoration(
                            //                   boxShadow: [
                            //                     BoxShadow(
                            //                       color: Color.fromARGB(
                            //                           12, 0, 0, 0),
                            //                       blurRadius: 12.r,
                            //                       offset: Offset(0, 2),
                            //                     ),
                            //                   ],
                            //                   color: Colors.white,
                            //                   borderRadius:
                            //                       BorderRadius.circular(
                            //                     11.r,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //             Positioned(
                            //               right: 0.1.w,
                            //               child: Image.network(
                            //                 item.image!,
                            //                 width: 82.6.w,
                            //                 height: 118.h,
                            //               ),
                            //             ),
                            //             item.rate == 0
                            //                 ? SizedBox.shrink()
                            //                 : Positioned(
                            //                     top: 29.h,
                            //                     left: 12.w,
                            //                     child: Row(
                            //                       children: [
                            //                         SvgPicture.asset(
                            //                             Assets.iconsStarActive),
                            //                         SizedBox(
                            //                           width: 5.w,
                            //                         ),
                            //                         Text(
                            //                           item.rate!.toString(),
                            //                           style: Theme.of(context)
                            //                               .textTheme
                            //                               .bodyText2!
                            //                               .copyWith(
                            //                                 fontWeight:
                            //                                     FontWeight.w700,
                            //                               ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //             Positioned(
                            //               top: 171.h,
                            //               left: 12.w,
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Container(
                            //                     width: 135.w,
                            //                     height: 54.h,
                            //                     child: Text(
                            //                       item.name!,
                            //                       maxLines: 3,
                            //                       style: Theme.of(context)
                            //                           .textTheme
                            //                           .headline1!
                            //                           .copyWith(
                            //                             fontSize: 14.sp,
                            //                           ),
                            //                     ),
                            //                   ),
                            //                   SizedBox(
                            //                     height: 32.h,
                            //                   ),
                            //                   Text(
                            //                     '${translator.translate("wishlist_screen.egp")} ${item.price!}',
                            //                     style: Theme.of(context)
                            //                         .textTheme
                            //                         .subtitle1,
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //             Positioned(
                            //               right: 13.5.w,
                            //               bottom: 16.h,
                            //               child: Container(
                            //                 height: 38.h,
                            //                 width: 38.w,
                            //                 decoration: BoxDecoration(
                            //                   color: Color(0xffffffff),
                            //                   borderRadius:
                            //                       BorderRadius.circular(25.r),
                            //                   boxShadow: [
                            //                     BoxShadow(
                            //                       color: Color.fromRGBO(
                            //                           0, 0, 0, 0.12),
                            //                       offset: Offset(0, 2),
                            //                       blurRadius: 11.sp,
                            //                     )
                            //                   ],
                            //                 ),
                            //                 // child: WishlistIconWidget(
                            //                 //   isFavorite:
                            //                 //       state.wishlist!.data![index]!.like!,
                            //                 //   productId: state
                            //                 //       .wishlist!.data![index]!.id!
                            //                 //       .toString(),
                            //                 // ),
                            //                 child: InkWell(
                            //                   onTap: () {
                            //                     setState(() {
                            //                       BlocProvider.of<
                            //                                   WishlistCubit>(
                            //                               context)
                            //                           .getToggleProductsInWishlist(
                            //                         state.wishlist!
                            //                             .data![index]!.id!
                            //                             .toString(),
                            //                       );
                            //                       _isFavorite = state
                            //                           .wishlist!
                            //                           .data![index]!
                            //                           .inWishlist!;
                            //                     });
                            //                   },
                            //                   child: Icon(
                            //                     _isFavorite
                            //                         ? Icons.favorite
                            //                         : Icons.favorite_border,
                            //                     size: 28.h,
                            //                     color: _isFavorite
                            //                         ? Color(0xffE02020)
                            //                         : Colors.grey,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         );
                            //       },
                            //     ),
                            //   )
                            : EmptyWidgets(
                                image: Assets.noWishlist,
                                title: translator.translate(
                                    "wishlist_screen.wishlist_is_empty"),
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const HomePageProvider(
                                            currentIndex: 0);
                                      },
                                    ),
                                  );
                                },
                                description: translator.translate(
                                    "wishlist_screen.check_out_what's_trending"),
                                buttonTitle: translator
                                    .translate("wishlist_screen.shop_now"),
                              );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
