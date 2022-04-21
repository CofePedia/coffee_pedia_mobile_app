import 'package:coffepedia/business_logic/recommended_products/recommended_products_cubit.dart';
import 'package:coffepedia/data/repository/recommended_products_repository.dart';
import 'package:coffepedia/data/web_services/recommended_products_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/shared/wishlist_icon.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class RecommendedProductsProvider extends StatelessWidget {
  const RecommendedProductsProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendedProductsCubit(
        RecommendedProductsRepository(
          RecommendedProductsWebServices(),
        ),
      ),
      child: RecommendedProducts(),
    );
  }
}

class RecommendedProducts extends StatefulWidget {
  const RecommendedProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendedProducts> createState() => _RecommendedProductsState();
}

class _RecommendedProductsState extends State<RecommendedProducts> {
  @override
  void initState() {
    BlocProvider.of<RecommendedProductsCubit>(context).getRecommendedProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("RecommendedProducts called");
    return BlocBuilder<RecommendedProductsCubit, RecommendedProductsState>(
      builder: (context, state) {
        if (state is RecommendedProductsLoaded) {
          final result = state.recommendedProducts!.data!;
          return Container(
            margin: EdgeInsets.only(bottom: 24.h),
            width: MediaQuery.of(context).size.width,
            height: 286.h,
            child: ListView.builder(
              itemCount: result.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductProvider(
                              id: result[index]!.id!,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 262.h,
                      width: 214.w,
                      child: Stack(
                        children: [
                          Container(
                            height: 262.h,
                            width: 214.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                  blurRadius: 11.r,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11.r),
                            ),
                          ),
                          Positioned(
                            right: 45.w,
                            left: 45.w,
                            child: CustomNetworkImage(
                              imageUrl: result[index]!.image!,
                              height: 130.h,
                              width: 85.w,
                              radius: 2.r,
                            ),
                            // child: Container(
                            //   child: Image.network(
                            //     result[index]!.image!,
                            //     width: 85.w,
                            //     height: 130.h,
                            //     fit: BoxFit.fill,
                            //   ),
                            // ),
                          ),
                          Positioned(
                            top: 135.h,
                            left: 12.w,
                            right: 12.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    result[index]!.discount == 0
                                        ? SizedBox.shrink()
                                        : Container(
                                            height: 17.h,
                                            width: 55.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xffFFD008),
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(12.5.h),
                                                  bottomRight:
                                                      Radius.circular(12.5.h),
                                                  bottomLeft:
                                                      Radius.circular(12.5.h)),
                                            ),
                                            child: Text(
                                              '${result[index]!.discount}% Off',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          ),
                                    result[index]!.rate == 0
                                        ? SizedBox.shrink()
                                        : Row(
                                            children: [
                                              SvgPicture.asset(
                                                  Assets.iconsStarActive),
                                              SizedBox(
                                                width: 6.14.w,
                                              ),
                                              Text(
                                                result[index]!.rate!.toString(),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                                Container(
                                  width: 192.w,
                                  child: Text(
                                    result[index]!.name ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            fontSize: 14.sp, height: 1.25),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      result[index]!.discount != 0 ? 6.h : 24.h,
                                ),
                                result[index]!.priceBeforeDiscount == 0
                                    ? SizedBox.shrink()
                                    : Text(
                                        '${result[index]!.priceBeforeDiscount ?? ""} ${translator.translate("checkout_items_screen.egp")}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.black45,
                                            ),
                                      ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  '${result[index]!.price ?? ""} ${translator.translate("checkout_items_screen.egp")}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 208.h,
                            right: 16.w,
                            child: Container(
                              height: 38.h,
                              width: 38.w,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.12),
                                      offset: Offset(0, 2),
                                      blurRadius: 11.sp)
                                ],
                              ),
                              child: WishlistIconWidget(
                                productId: result[index]!.id!.toString(),
                                isFavorite: result[index]!.inWishlist!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return FeaturedProductsShimmerWidget();
        }
      },
    );
  }
}
