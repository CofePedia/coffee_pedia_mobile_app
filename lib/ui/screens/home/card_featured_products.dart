import 'package:coffepedia/business_logic/featured_products/featured_products_cubit.dart';
import 'package:coffepedia/data/repository/featured_products_repository.dart';
import 'package:coffepedia/data/web_services/featured_products_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeaturedProductsCubit(
        FeaturedProductsRepository(
          FeaturedProductsWebServices(),
        ),
      ),
      child: CardFeaturedProducts(),
    );
  }
}

class CardFeaturedProducts extends StatefulWidget {
  const CardFeaturedProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<CardFeaturedProducts> createState() => _CardFeaturedProductsState();
}

class _CardFeaturedProductsState extends State<CardFeaturedProducts> {
  @override
  void initState() {
    BlocProvider.of<FeaturedProductsCubit>(context).getFeaturedProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedProductsCubit, FeaturedProductsState>(
      builder: (context, state) {
        if (state is FeaturedProductsIsLoaded) {
          return Container(
            margin: EdgeInsets.only(bottom: 24.h),
            width: MediaQuery.of(context).size.width,
            height: 286.h,
            child: ListView.builder(
              itemCount: state.featuredProducts!.data!.data!.length,
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
                            return ProductProvider();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 262.h,
                      width: 214.w,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 13.h,
                            child: Container(
                              height: 250.h,
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
                          ),
                          Positioned(
                            right: 17.w,
                            child: Container(
                              color: Colors.red,
                              child: Image.network(
                                state.featuredProducts!.data!.data![index]!
                                    .image!,
                                width: 85.w,
                                height: 130.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 28.h,
                            left: 12.w,
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.iconsStarActive),
                                SizedBox(
                                  width: 6.14.w,
                                ),
                                Text(
                                  state.featuredProducts!.data!.data![index]!
                                      .rate!
                                      .toString(),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 130.h,
                            left: 12.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 17.h,
                                  width: 55.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFD008),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12.5.h),
                                        bottomRight: Radius.circular(12.5.h),
                                        bottomLeft: Radius.circular(12.5.h)),
                                  ),
                                  child: Text(
                                    '${state.featuredProducts!.data!.data![index]!.discount}% Off',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                                Container(
                                  width: 192.w,
                                  child: Text(
                                    state.featuredProducts!.data!.data![index]!
                                        .name!,
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
                                  height: 6.h,
                                ),
                                Text(
                                  'EGP ${state.featuredProducts!.data!.data![index]!.priceBeforeDiscount}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black45,
                                      ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'EGP ${state.featuredProducts!.data!.data![index]!.price}',
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
                              child: FavoriteButton(
                                isFavorite: true,
                                iconSize: 35.h,
                                iconColor: Color(0xffE02020),
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite $_isFavorite)');
                                },
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
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
