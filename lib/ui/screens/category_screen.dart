import 'package:coffepedia/business_logic/featured_products/featured_products_cubit.dart';
import 'package:coffepedia/data/repository/featured_products_repository.dart';
import 'package:coffepedia/data/web_services/featured_products_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/filters_screen.dart';
import 'package:coffepedia/ui/screens/home/search_bar.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/ui/shared/wishlist_icon.dart';
import 'package:coffepedia/ui/widgets/category_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'product_screen.dart';

class CategoryScreenProvider extends StatelessWidget {
  const CategoryScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeaturedProductsCubit(
        FeaturedProductsRepository(
          FeaturedProductsWebServices(),
        ),
      ),
      child: CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 105.h,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.only(top: 53.h, bottom: 9.h, right: 15.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffFFD008),
                          Color(0xffFFE77E),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.chevron_left,
                            size: 22.w,
                          ),
                          color: Color(0xff000000),
                        ),
                        Expanded(
                          child: SearchBar(
                            width: 309.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CategoryItemProvider(),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 31.h, right: 15.w, left: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Coffee ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 18.sp,
                                    ),
                              ),
                              TextSpan(
                                text: '(156 Item)',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        CustomOutlineButton(
                          title: 'Filter',
                          onPress: () {
                            showModalBottomSheet(
                              enableDrag: false,
                              isDismissible: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r),
                                ),
                              ),
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => FiltersScreen(),
                            );
                          },
                          height: 40.h,
                          width: 100.w,
                          borderRadius: 9.r,
                          shadowColor: BoxShadow(color: Colors.transparent),
                          imageColor: Theme.of(context).primaryColor,
                          assetName: Assets.iconsFilter,
                          borderColor: Theme.of(context).primaryColor,
                          imageWidth: 20.w,
                          imageHeight: 18.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 8.w,
                        childAspectRatio: 164.5.w / 305.h,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.featuredProducts!.data!.data!.length,
                      itemBuilder: (context, index) => InkWell(
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
                          height: 305.h,
                          width: 164.5.w,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                height: 280.h,
                                width: 164.5.w,
                                child: Image.asset(
                                  Assets.imagesCard,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 17.w,
                                child: Container(
                                  child: Image.network(
                                    state.featuredProducts!.data!.data![index]!
                                        .image!,
                                    width: 75.w,
                                    height: 136.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 30.h,
                                left: 20.w,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsStarActive),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      state.featuredProducts!.data!
                                          .data![index]!.rate!
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 152.h,
                                left: 12.w,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 17.h,
                                        width: 55.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFD008),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              12.5.r,
                                            ),
                                            bottomRight: Radius.circular(
                                              12.5.r,
                                            ),
                                            bottomLeft: Radius.circular(
                                              12.5.r,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          '${state.featuredProducts!.data!.data![index]!.discount}% Off',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Container(
                                        width: 140.w,
                                        child: Text(
                                          state.featuredProducts!.data!
                                              .data![index]!.name!,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 14.sp,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Text(
                                        'EGP ${state.featuredProducts!.data!.data![index]!.priceBeforeDiscount!}',
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
                                        'EGP ${state.featuredProducts!.data!.data![index]!.price!}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 240.h,
                                right: 18.w,
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
                                        blurRadius: 11.sp,
                                      )
                                    ],
                                  ),
                                  child: WishlistIconWidget(
                                    productId: state.featuredProducts!.data!
                                        .data![index]!.id!
                                        .toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
