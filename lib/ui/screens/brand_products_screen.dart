import 'package:coffepedia/business_logic/brand_products/brand_products_cubit.dart';
import 'package:coffepedia/data/repository/brand_products_repository.dart';
import 'package:coffepedia/data/web_services/brand_products_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:coffepedia/ui/widgets/category_item_widget.dart';
import 'package:coffepedia/ui/widgets/empty_widgets.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandProductsProvider extends StatelessWidget {
  final String brandName;
  final int brandId;
  const BrandProductsProvider({
    required this.brandId,
    required this.brandName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandProductsCubit(
        BrandProductsRepository(
          BrandProductsWebServices(),
        ),
      ),
      child: BrandProductsScreen(
        brandId: brandId,
        brandName: brandName,
      ),
    );
  }
}

class BrandProductsScreen extends StatefulWidget {
  final String brandName;
  final int brandId;
  const BrandProductsScreen(
      {required this.brandId, required this.brandName, Key? key})
      : super(key: key);

  @override
  State<BrandProductsScreen> createState() => _BrandProductsScreenState();
}

class _BrandProductsScreenState extends State<BrandProductsScreen> {
  @override
  void initState() {
    BlocProvider.of<BrandProductsCubit>(context)
        .getBrandProducts(widget.brandId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Icons.arrow_back_ios,
                    size: 20.w,
                  ),
                  color: Color(0xff000000),
                ),
                Text(
                  widget.brandName,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
              ],
            ),
            BlocBuilder<BrandProductsCubit, BrandProductsState>(
              builder: (context, state) {
                if (state is BrandProductsLoaded) {
                  return state.brandProducts!.data!.length > 0
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: GridView.builder(
                              padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 8.w,
                                childAspectRatio: 164.5.w / 305.h,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.brandProducts!.data!.length,
                              itemBuilder: (context, index) {
                                final data = state.brandProducts!.data![index]!;
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
                              }),
                        )
                      : EmptyWidgets(
                          image: Assets.noItems,
                          title: translator
                              .translate("categories_screen.No products found"),
                          description: translator.translate(
                              "categories_screen.Check out what's trending"),
                        );
                } else {
                  return BrandProductsShimmerWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
