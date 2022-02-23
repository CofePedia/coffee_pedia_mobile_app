import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        height: 80.h,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          itemBuilder: (context, index) {
            return Container(
              width: 150.w,
              height: 84.h,
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  7.r,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FeaturedProductsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        height: 262.h,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  height: 262.h,
                  width: 214.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      7.r,
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class SlidersShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 24.h),
            width: MediaQuery.of(context).size.width,
            height: 170.h,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Container(
                    height: 170.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0.r),
                        color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 90.h,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}

class BrandsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        height: 90.h,
        child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              color: Colors.white,
              height: 90.h,
              width: 110.w,
            );
          },
        ),
      ),
    );
  }
}

class AdsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 2,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 24.h, right: 15.w, left: 15.w),
              height: 205.h,
              width: 344.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0.r),
                  color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}

class RecentProductsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 187.h,
        child: ListView.builder(
          itemCount: 5,
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Container(
                height: 187.h,
                width: 214.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    7.r,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryProductsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120.h,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 24.h),
            width: MediaQuery.of(context).size.width,
            height: 90.h,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  color: Colors.white,
                  height: 90.h,
                  width: 110.w,
                );
              },
            ),
          )
//           Padding(
//             padding: EdgeInsets.only(top: 31.h, right: 15.w, left: 15.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 RichText(
//                   textAlign: TextAlign.start,
//                   text: TextSpan(
//                     children: <TextSpan>[
//                       TextSpan(
//                         text:
//                             '${state.categoryProducts!.data!.category!.name} ',
//                         style: Theme.of(context).textTheme.headline1!.copyWith(
//                               fontSize: 18.sp,
//                             ),
//                       ),
//                       TextSpan(
//                         text:
//                             '(${state.categoryProducts!.data!.paginate!.total} Item)',
//                         style: Theme.of(context).textTheme.headline1!.copyWith(
//                               fontSize: 12.sp,
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 CustomOutlineButton(
//                   title: 'Filter',
//                   onPress: () {
//                     showModalBottomSheet(
//                       enableDrag: false,
//                       isDismissible: false,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(15.r),
//                           topRight: Radius.circular(15.r),
//                         ),
//                       ),
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (context) => FiltersScreenProvider(
//                         productFilters: state.categoryProducts!.data!.filters!,
//                         categoriesId: widget.categoriesId,
//                         subCategories: widget.subCategories,
//                       ),
//                     );
//                   },
//                   height: 40.h,
//                   width: 100.w,
//                   borderRadius: 9.r,
//                   shadowColor: BoxShadow(color: Colors.transparent),
//                   imageColor: Theme.of(context).primaryColor,
//                   assetName: Assets.iconsFilter,
//                   borderColor: Theme.of(context).primaryColor,
//                   imageWidth: 20.w,
//                   imageHeight: 18.h,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.w),
//             child: GridView.builder(
//                 padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16.h,
//                   crossAxisSpacing: 8.w,
//                   childAspectRatio: 164.5.w / 305.h,
//                 ),
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return ProductProvider(
//                               id: products[index]!.id!,
//                             );
//                           },
//                         ),
//                       );
//                     },
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
//                     child: Container(
//                       height: 305.h,
//                       width: 164.5.w,
//                       child: Stack(
//                         fit: StackFit.expand,
//                         children: [
//                           Container(
//                             height: 280.h,
//                             width: 164.5.w,
//                             child: Image.asset(
//                               Assets.imagesCard,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Positioned(
//                             right: 17.w,
//                             child: Container(
//                               child: Image.network(
//                                 products[index]!.image!,
//                                 width: 75.w,
//                                 height: 136.h,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           products[index]!.rate! != 0
//                               ? Positioned(
//                                   top: 30.h,
//                                   left: 20.w,
//                                   child: Row(
//                                     children: [
//                                       SvgPicture.asset(Assets.iconsStarActive),
//                                       SizedBox(
//                                         width: 5.w,
//                                       ),
//                                       Text(
//                                         products[index]!.rate.toString(),
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyText2!
//                                             .copyWith(
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               : SizedBox.shrink(),
//                           Positioned(
//                             top: 152.h,
//                             left: 12.w,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 8.w),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   products[index]!.discount == 0
//                                       ? SizedBox(
//                                           height: 17.h,
//                                           width: 55.w,
//                                         )
//                                       : Container(
//                                           height: 17.h,
//                                           width: 55.w,
//                                           alignment: Alignment.center,
//                                           decoration: BoxDecoration(
//                                             color: Color(0xffFFD008),
//                                             borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(
//                                                 12.5.r,
//                                               ),
//                                               bottomRight: Radius.circular(
//                                                 12.5.r,
//                                               ),
//                                               bottomLeft: Radius.circular(
//                                                 12.5.r,
//                                               ),
//                                             ),
//                                           ),
//                                           child: Text(
//                                             '${products[index]!.discount}% Off',
// // state.categoryProducts!.data!
// //     .filters![2]!.optionsSingle![2]
// //     .toString(),
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText1,
//                                           ),
//                                         ),
//                                   SizedBox(
//                                     height: 15.h,
//                                   ),
//                                   Container(
//                                     width: 140.w,
//                                     child: Text(
//                                       products[index]!.name!,
//                                       maxLines: 3,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headline1!
//                                           .copyWith(
//                                             fontSize: 14.sp,
//                                           ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 12.h,
//                                   ),
//                                   Text(
//                                     'EGP ${products[index]!.priceBeforeDiscount}',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText2!
//                                         .copyWith(
//                                           decoration:
//                                               TextDecoration.lineThrough,
//                                           color: Colors.black45,
//                                         ),
//                                   ),
//                                   SizedBox(
//                                     height: 8.h,
//                                   ),
//                                   Text(
//                                     'EGP ${products[index]!.price}',
//                                     style:
//                                         Theme.of(context).textTheme.subtitle1,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 240.h,
//                             right: 18.w,
//                             child: Container(
//                               height: 38.h,
//                               width: 38.w,
//                               decoration: BoxDecoration(
//                                 color: Color(0xffffffff),
//                                 borderRadius: BorderRadius.circular(25),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color.fromRGBO(0, 0, 0, 0.12),
//                                     offset: Offset(0, 2),
//                                     blurRadius: 11.sp,
//                                   )
//                                 ],
//                               ),
//                               child: WishlistIconWidget(
//                                 productId: products[index]!.id!.toString(),
//                                 isFavorite: products[index]!.inWishlist!,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//           ),
        ],
      ),
    );
  }
}
