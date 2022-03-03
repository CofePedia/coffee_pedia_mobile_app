import 'package:coffepedia/business_logic/category_products/category_products_cubit.dart';
import 'package:coffepedia/data/models/categories.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/repository/category_products_repository.dart';
import 'package:coffepedia/data/web_services/category_products_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/filters_screen.dart';
import 'package:coffepedia/ui/screens/home/search_bar.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/ui/shared/wishlist_icon.dart';
import 'package:coffepedia/ui/widgets/empty_widgets.dart';
import 'package:coffepedia/ui/widgets/seller_details_widget.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'product_screen.dart';

class CategoryScreenProvider extends StatelessWidget {
  final int? categoriesId;
  final int? vendorId;
  final String? categoryName;
  final List<CategoriesDataChildren?>? subCategories;
  final Map<String, List<String?>>? multiMap;
  final Map<String, String?>? rangeMap;
  final Map<String, String?>? singleMap;

  const CategoryScreenProvider(
      {this.categoriesId,
      this.subCategories,
      this.categoryName,
      this.multiMap,
      this.rangeMap,
      this.singleMap,
      this.vendorId,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryProductsCubit(
        CategoryProductsRepository(
          CategoryProductsWebServices(),
        ),
      ),
      child: CategoryScreen(
        categoriesId: categoriesId!,
        subCategories: subCategories!,
        multiMap: multiMap!,
        rangeMap: rangeMap,
        singleMap: singleMap,
        vendorId: vendorId!,
        categoryName: categoryName!,
      ),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  final int categoriesId;
  final int vendorId;
  final String categoryName;
  final List<CategoriesDataChildren?>? subCategories;
  Map<String, List<String?>> multiMap;
  Map<String, String?>? rangeMap;
  Map<String, String?>? singleMap;

  CategoryScreen(
      {required this.categoriesId,
      this.subCategories,
      required this.categoryName,
      required this.multiMap,
      required this.rangeMap,
      required this.singleMap,
      required this.vendorId,
      Key? key})
      : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool hasData = false;
  bool? isRefresh;
  int? _subCategoryId = -1;
  int currentPage = 1;
  int limit = 4;
  List<CategoryProductsDataData?> products = [];
  final RefreshController refreshController = RefreshController();

  fetchMoreData() {
    BlocProvider.of<CategoryProductsCubit>(context).getCategoryProducts(
      vendorId: widget.vendorId,
      page: currentPage,
      limit: limit,
      subCategoryId: _subCategoryId,
      categoryId: widget.categoriesId,
      multiMap: widget.multiMap,
      rangeMap: widget.rangeMap,
      singleMap: widget.singleMap,
    );
  }

// BlocProvider.of<CategoryProductsCubit>(
  //         context)
  //     .getCategoryProducts(
  //   limit: limit,
  //   page: page,
  //   subCategoryId: _selectedSubCategory!,
  //   categoryId: widget.categoriesId,
  //   multiMap: {},
  //   rangeMap: {},
  //   singleMap: {},
  // );
  @override
  void initState() {
    fetchMoreData();
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        builder: (context, state) {
          if (state is CategoryProductsIsLoaded) {
            state.categoryProducts!.data!.paginate!.currentPage! <=
                    state.categoryProducts!.data!.paginate!.lastPage!
                ? isRefresh = true
                : isRefresh = false;
            // if (_subCategoryId != -1) products.clear();
            currentPage == 1
                ? products = state.categoryProducts!.data!.data!
                : products.addAll(state.categoryProducts!.data!.data!);
            // products.clear();
            // products.addAll(state.categoryProducts!.data!.data!);
            if (isRefresh == true) {
              currentPage++;
            }

            return SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              enablePullDown: false,
              onLoading: () async {
                await fetchMoreData();
                isRefresh == true
                    ? refreshController.loadComplete()
                    : refreshController.loadNoData();
              },
              child: CheckInternetConnection(
                screen: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //appbar
                      widget.vendorId != -1
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: 31.h,
                                  left: 18.w,
                                  right: 18.w,
                                  top: 60.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.chevron_left,
                                      size: 24.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Seller info',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 18.sp,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 105.h,
                              width: MediaQuery.of(context).size.width,
                              color: Theme.of(context).primaryColor,
                              padding: EdgeInsets.only(
                                  top: 53.h, bottom: 9.h, right: 15.w),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context, hasData = true);
                                    },
                                    icon: Icon(
                                      Icons.chevron_left,
                                      size: 22.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    color: Color(0xff000000),
                                  ),
                                  Expanded(
                                    child: SearchBarProvider(
                                      width: 309.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 15.h,
                      ),
                      // seller details
                      widget.vendorId != -1
                          ? SellerDetailsWidget(
                              vendorId: widget.vendorId,
                            )
                          : SizedBox.shrink(),

                      // subCategory
                      widget.vendorId != -1
                          ? Container(
                              height: 78.h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  padding:
                                      EdgeInsets.only(left: 11.w, right: 11.w),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.categoryProducts!.data!
                                      .subCategory!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 158.w,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: OutlinedButton(
                                        onPressed: () {
                                          setState(
                                            () async {
                                              currentPage = 1;
                                              widget.multiMap = {};
                                              widget.rangeMap = {};
                                              widget.singleMap = {};
                                              _subCategoryId ==
                                                      state
                                                          .categoryProducts!
                                                          .data!
                                                          .subCategory![index]!
                                                          .id!
                                                  ? _subCategoryId = -1
                                                  : _subCategoryId = state
                                                      .categoryProducts!
                                                      .data!
                                                      .subCategory![index]!
                                                      .id!;

                                              await fetchMoreData();
                                              refreshController.loadComplete();
                                              products.clear();
                                              products.addAll(state
                                                  .categoryProducts!
                                                  .data!
                                                  .data!);
                                            },
                                          );
                                        },
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            EdgeInsets.zero,
                                          ),
                                          shape: MaterialStateProperty.all<
                                              OutlinedBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.w),
                                            ),
                                          ),
                                          side: MaterialStateProperty.all<
                                              BorderSide>(
                                            BorderSide(
                                              color: _subCategoryId ==
                                                      state
                                                          .categoryProducts!
                                                          .data!
                                                          .subCategory![index]!
                                                          .id!
                                                  ? Color(0xffCC1010)
                                                  : Colors.transparent,
                                            ),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 72.h,
                                              width: 145.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Color(0xffEED2BB),
                                              ),
                                            ),
                                            Positioned(
                                              top: 4.h,
                                              bottom: 4.h,
                                              right: 4.w,
                                              left: 80.w,
                                              child: Image.network(
                                                state.categoryProducts!.data!
                                                    .subCategory![index]!.icon!,
                                                height: 64.h,
                                                width: 50.w,
                                              ),
                                            ),
                                            Positioned(
                                              top: 12.6.h,
                                              left: 10.w,
                                              child: Container(
                                                width: 60.w,
                                                child: Text(
                                                  state
                                                      .categoryProducts!
                                                      .data!
                                                      .subCategory![index]!
                                                      .name!,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Color(
                                                      0xff3A1008,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : Container(
                              height: 78.h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  padding:
                                      EdgeInsets.only(left: 11.w, right: 11.w),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.subCategories!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 158.w,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: OutlinedButton(
                                        onPressed: () {
                                          setState(
                                            () async {
                                              currentPage = 1;
                                              widget.multiMap = {};
                                              widget.rangeMap = {};
                                              widget.singleMap = {};

                                              _subCategoryId ==
                                                      widget
                                                          .subCategories![
                                                              index]!
                                                          .id!
                                                  ? _subCategoryId = -1
                                                  : _subCategoryId = widget
                                                      .subCategories![index]!
                                                      .id!;

                                              await fetchMoreData();
                                              refreshController.loadComplete();
                                              products.clear();
                                              products.addAll(state
                                                  .categoryProducts!
                                                  .data!
                                                  .data!);
                                            },
                                          );
                                        },
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                            EdgeInsets.zero,
                                          ),
                                          shape: MaterialStateProperty.all<
                                              OutlinedBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.w),
                                            ),
                                          ),
                                          side: MaterialStateProperty.all<
                                              BorderSide>(
                                            BorderSide(
                                              color:
                                                  // _subCategoryId == widget.subCategories![index]!.id ?                                               Color(0xffCC1010)

                                                  // _subCategoryId ==
                                                  //         widget
                                                  //             .subCategories![index]!
                                                  //             .id!

                                                  _subCategoryId ==
                                                          widget
                                                              .subCategories![
                                                                  index]!
                                                              .id!
                                                      ? Color(0xffCC1010)
                                                      : Colors.transparent,

                                              //     borderColor(
                                              //   state.categoryProducts!.data!
                                              //       .subCategory![index]!.id!,
                                              //   widget.subCategories![index]!.id!,
                                              // ),
                                            ),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 72.h,
                                              width: 145.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                                color: Color(0xffEED2BB),
                                              ),
                                            ),
                                            Positioned(
                                              top: 4.h,
                                              bottom: 4.h,
                                              right: 4.w,
                                              left: 80.w,
                                              child: Image.network(
                                                widget.subCategories![index]!
                                                    .icon!,
                                                height: 64.h,
                                                width: 50.w,
                                              ),
                                            ),
                                            Positioned(
                                              top: 12.6.h,
                                              left: 10.w,
                                              child: Container(
                                                width: 60.w,
                                                child: Text(
                                                  widget.subCategories![index]!
                                                      .name!,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Color(
                                                      0xff3A1008,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),

                      // category name
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
                                    text: widget.vendorId != -1
                                        ? '${widget.categoryName} '
                                        : '${state.categoryProducts!.data!.category!.name} ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 18.sp,
                                        ),
                                  ),
                                  TextSpan(
                                    text:
                                        '(${state.categoryProducts!.data!.paginate!.total} Item)',
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
                                  builder: (context) => FiltersScreenProvider(
                                    productFilters:
                                        state.categoryProducts!.data!.filters!,
                                    categoriesId: widget.categoriesId,
                                    subCategories: widget.subCategories,
                                  ),
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

                      products.length > 0
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: GridView.builder(
                                  padding:
                                      EdgeInsets.only(top: 40.h, bottom: 15.h),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16.h,
                                    crossAxisSpacing: 8.w,
                                    childAspectRatio: 164.5.w / 305.h,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    print('products length ${products.length}');
                                    print(
                                        'total ${state.categoryProducts!.data!.paginate!.total}');
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ProductProvider(
                                                id: products[index]!.id!,
                                              );
                                            },
                                          ),
                                        );
                                      },
// onTap: () async {
//   final hasData = await Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) {
//         return ProductProvider(
//           id: state.categoryProducts!.data!
//               .data![index]!.id!,
//         );
//       },
//     ),
//   );
//   if (hasData == true) {
//     BlocProvider.of<CategoryProductsCubit>(context)
//         .getCategoryProducts(
//             0, widget.categoriesId, widget.multiMap);
//   }
// },
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
                                                  products[index]!.image!,
                                                  width: 75.w,
                                                  height: 136.h,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            products[index]!.rate! != 0
                                                ? Positioned(
                                                    top: 30.h,
                                                    left: 20.w,
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(Assets
                                                            .iconsStarActive),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text(
                                                          products[index]!
                                                              .rate
                                                              .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox.shrink(),
                                            Positioned(
                                              top: 152.h,
                                              left: 12.w,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    products[index]!.discount ==
                                                            0
                                                        ? SizedBox(
                                                            height: 17.h,
                                                            width: 55.w,
                                                          )
                                                        : Container(
                                                            height: 17.h,
                                                            width: 55.w,
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xffFFD008),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                  12.5.r,
                                                                ),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                  12.5.r,
                                                                ),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                  12.5.r,
                                                                ),
                                                              ),
                                                            ),
                                                            child: Text(
                                                              '${products[index]!.discount}% Off',
// state.categoryProducts!.data!
//     .filters![2]!.optionsSingle![2]
//     .toString(),
                                                              style: Theme.of(
                                                                      context)
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
                                                        products[index]!.name!,
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                      'EGP ${products[index]!.priceBeforeDiscount}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            color:
                                                                Colors.black45,
                                                          ),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Text(
                                                      'EGP ${products[index]!.price}',
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
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.12),
                                                      offset: Offset(0, 2),
                                                      blurRadius: 11.sp,
                                                    )
                                                  ],
                                                ),
                                                child: WishlistIconWidget(
                                                  productId: products[index]!
                                                      .id!
                                                      .toString(),
                                                  isFavorite: products[index]!
                                                      .inWishlist!,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : EmptyWidgets(
                              image: Assets.noItems,
                              title: "No products found",
                              description: "Check out what's trending"),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return CategoryProductsShimmerWidget();
          }
        },
      ),
    );
  }
}
