import 'package:coffepedia/business_logic/category_products/category_products_cubit.dart';
import 'package:coffepedia/data/models/categories.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/repository/category_products_repository.dart';
import 'package:coffepedia/data/web_services/category_products_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/screens/filters_screen.dart';
import 'package:coffepedia/ui/screens/home/search_widget.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:coffepedia/ui/widgets/category_item_widget.dart';
import 'package:coffepedia/ui/widgets/empty_widgets.dart';
import 'package:coffepedia/ui/widgets/seller_details_widget.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                                      Icons.arrow_back_ios,
                                      size: 20.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    translator.translate(
                                        "categories_screen.seller_info"),
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
                                top: 53.h,
                                bottom: 9.h,
                                right: 10.w,
                                left: 10.w,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context, hasData = true);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20.w,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Expanded(
                                    child: SearchWidget(
                                      width: 312.w,
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
                                                color: Color(0xffD2E2FF),
                                              ),
                                            ),
                                            Positioned(
                                              top: 4.h,
                                              bottom: 4.h,
                                              right: 0.w,
                                              left: 80.w,
                                              child: CustomNetworkImage(
                                                imageUrl: state
                                                    .categoryProducts!
                                                    .data!
                                                    .subCategory![index]!
                                                    .icon!,
                                                height: 64.h,
                                                width: 50.w,
                                                radius: 2,
                                              ),
                                              // child: Image.network(
                                              //   state.categoryProducts!.data!
                                              //       .subCategory![index]!.icon!,
                                              //   height: 64.h,
                                              //   width: 50.w,
                                              // ),
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
                                                      0xff4470c1,
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
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.subCategories!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin:
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
                                                color: Color(0xffD2E2FF),
                                              ),
                                            ),
                                            Positioned(
                                              top: 4.h,
                                              bottom: 4.h,
                                              right: 0.w,
                                              left: 80.w,
                                              child: CustomNetworkImage(
                                                imageUrl: widget
                                                    .subCategories![index]!
                                                    .icon!,
                                                height: 64.h,
                                                width: 50.w,
                                                radius: 2.r,
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
                                                      0xff4470c1,
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
                            EdgeInsets.only(top: 31.h, right: 10.w, left: 10.w),
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
                                        '(${state.categoryProducts!.data!.paginate!.total} ${translator.translate("categories_screen.item")})',
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
                              title: translator
                                  .translate("categories_screen.filter"),
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
                                    vendorId: widget.vendorId,
                                    categoryName: widget.categoryName,
                                  ),
                                );
                              },
                              height: 40.h,
                              width: 100.w,
                              borderRadius: 9.r,
                              // shadowColor: BoxShadow(color: Colors.transparent),
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
                                    return CategoryItemWidget(
                                      onPress: () {
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
                                      image: products[index]!.image!,
                                      discount: products[index]!.discount!,
                                      rate: products[index]!.rate!,
                                      price: products[index]!.price!,
                                      title: products[index]!.name!,
                                      priceBeforeDiscount:
                                          products[index]!.priceBeforeDiscount!,
                                      productId: products[index]!.id!,
                                      isFavorite: products[index]!.inWishlist!,
                                    );
//                                     return InkWell(
//                                       onTap: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) {
//                                               return ProductProvider(
//                                                 id: products[index]!.id!,
//                                               );
//                                             },
//                                           ),
//                                         );
//                                       },
// // onTap: () async {
// //   final hasData = await Navigator.push(
// //     context,
// //     MaterialPageRoute(
// //       builder: (context) {
// //         return ProductProvider(
// //           id: state.categoryProducts!.data!
// //               .data![index]!.id!,
// //         );
// //       },
// //     ),
// //   );
// //   if (hasData == true) {
// //     BlocProvider.of<CategoryProductsCubit>(context)
// //         .getCategoryProducts(
// //             0, widget.categoriesId, widget.multiMap);
// //   }
// // },
//                                       child: Container(
//                                         height: 305.h,
//                                         width: 164.5.w,
//                                         decoration: BoxDecoration(
//                                           boxShadow: [
//                                             BoxShadow(
//                                               color:
//                                                   Color.fromRGBO(0, 0, 0, 0.12),
//                                               blurRadius: 11.r,
//                                               offset: Offset(0, 2),
//                                             ),
//                                           ],
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(11.r),
//                                         ),
//                                         child: Padding(
//                                           padding: EdgeInsets.symmetric(
//                                             horizontal: 10.w,
//                                           ),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Align(
//                                                 alignment: Alignment.center,
//                                                 child: CustomNetworkImage(
//                                                   imageUrl:
//                                                       products[index]!.image!,
//                                                   height: 140.h,
//                                                   width: 100.w,
//                                                   radius: 2.r,
//                                                   fit: BoxFit.contain,
//                                                 ),
//                                               ),
//                                               products[index]!.discount == 0 &&
//                                                       products[index]!.rate! ==
//                                                           0
//                                                   ? SizedBox(
//                                                       height: 16.h,
//                                                     )
//                                                   : Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         products[index]!
//                                                                     .discount ==
//                                                                 0
//                                                             ? SizedBox.shrink()
//                                                             : Container(
//                                                                 height: 17.h,
//                                                                 width: 55.w,
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .center,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   color: Color(
//                                                                       0xffFFD008),
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .only(
//                                                                     topLeft: Radius
//                                                                         .circular(
//                                                                       12.5.r,
//                                                                     ),
//                                                                     bottomRight:
//                                                                         Radius
//                                                                             .circular(
//                                                                       12.5.r,
//                                                                     ),
//                                                                     bottomLeft:
//                                                                         Radius
//                                                                             .circular(
//                                                                       12.5.r,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 child: Text(
//                                                                   '${products[index]!.discount ?? ""}% ${translator.translate("categories_screen.off")}',
// // state.categoryProducts!.data!
// //     .filters![2]!.optionsSingle![2]
// //     .toString(),
//                                                                   style: Theme.of(
//                                                                           context)
//                                                                       .textTheme
//                                                                       .bodyText1,
//                                                                 ),
//                                                               ),
//                                                         products[index]!
//                                                                     .rate! !=
//                                                                 0
//                                                             ? Row(
//                                                                 children: [
//                                                                   SvgPicture.asset(
//                                                                       Assets
//                                                                           .iconsStarActive),
//                                                                   SizedBox(
//                                                                     width: 5.w,
//                                                                   ),
//                                                                   Text(
//                                                                     products[
//                                                                             index]!
//                                                                         .rate
//                                                                         .toString(),
//                                                                     style: Theme.of(
//                                                                             context)
//                                                                         .textTheme
//                                                                         .bodyText2!
//                                                                         .copyWith(
//                                                                           fontWeight:
//                                                                               FontWeight.w700,
//                                                                         ),
//                                                                   ),
//                                                                 ],
//                                                               )
//                                                             : SizedBox.shrink(),
//                                                       ],
//                                                     ),
//                                               SizedBox(
//                                                 height: 8.h,
//                                               ),
//                                               Container(
//                                                 width: 154.5.w,
//                                                 child: Text(
//                                                   products[index]!.name ?? "",
//                                                   maxLines: 3,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .headline1!
//                                                       .copyWith(
//                                                           fontSize: 14.sp,
//                                                           height: 1.5.h),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 6.h,
//                                               ),
//                                               products[index]!.discount == 0
//                                                   ? SizedBox(
//                                                       height: 8.h,
//                                                     )
//                                                   : Text(
//                                                       '${products[index]!.priceBeforeDiscount ?? ""} ${translator.translate("categories_screen.egp")}',
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .bodyText2!
//                                                           .copyWith(
//                                                             decoration:
//                                                                 TextDecoration
//                                                                     .lineThrough,
//                                                             color:
//                                                                 Colors.black45,
//                                                           ),
//                                                     ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     '${products[index]!.price ?? ""} ${translator.translate("categories_screen.egp")}',
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .subtitle1,
//                                                   ),
//                                                   Container(
//                                                     height: 38.h,
//                                                     width: 38.w,
//                                                     decoration: BoxDecoration(
//                                                       color: Color(0xffffffff),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               25),
//                                                       boxShadow: [
//                                                         BoxShadow(
//                                                           color: Color.fromRGBO(
//                                                               0, 0, 0, 0.12),
//                                                           offset: Offset(0, 2),
//                                                           blurRadius: 11.sp,
//                                                         )
//                                                       ],
//                                                     ),
//                                                     child: WishlistIconWidget(
//                                                       productId:
//                                                           products[index]!
//                                                               .id!
//                                                               .toString(),
//                                                       isFavorite:
//                                                           products[index]!
//                                                               .inWishlist!,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
                                  }),
                            )
                          : EmptyWidgets(
                              image: Assets.noItems,
                              title: translator.translate(
                                  "categories_screen.No products found"),
                              description: translator.translate(
                                  "categories_screen.Check out what's trending"),
                            ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  widget.vendorId != -1
                      ? SizedBox(
                          height: 100.h,
                        )
                      : SizedBox.shrink(),
                  CategoryProductsShimmerWidget(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
