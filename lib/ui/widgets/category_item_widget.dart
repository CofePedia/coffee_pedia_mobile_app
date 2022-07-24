import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/shared/wishlist_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItemWidget extends StatelessWidget {
  final Function() onPress;
  final String image;
  final int discount;
  final int rate;
  final int price;
  final String title;
  final int priceBeforeDiscount;
  final int productId;
  final bool isFavorite;
  const CategoryItemWidget({
    required this.onPress,
    required this.image,
    required this.discount,
    required this.rate,
    required this.price,
    required this.title,
    required this.priceBeforeDiscount,
    required this.productId,
    required this.isFavorite,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
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
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromRGBO(0, 0, 0, 0.12),
          //     blurRadius: 11.r,
          //     offset: Offset(0, 2),
          //   ),
          // ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomNetworkImage(
                  imageUrl: image,
                  height: 140.h,
                  width: 100.w,
                  radius: 2.r,
                  fit: BoxFit.contain,
                ),
              ),
              discount == 0 && rate == 0
                  ? SizedBox(
                      height: 16.h,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        discount == 0
                            ? SizedBox.shrink()
                            : Container(
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
                                  '$discount % ${translator.translate("categories_screen.off")}',
// state.categoryProducts!.data!
//     .filters![2]!.optionsSingle![2]
//     .toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                        rate != 0
                            ? Row(
                                children: [
                                  SvgPicture.asset(Assets.iconsStarActive),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    rate.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                width: 154.5.w,
                child: Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 14.sp,
                        height: 1.5.h,
                      ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              discount == 0
                  ? SizedBox(
                      height: 8.h,
                    )
                  : Text(
                      translator.currentLanguage == "ar"
                          ? '$priceBeforeDiscount ${translator.translate("categories_screen.egp")}'
                          : '${translator.translate("categories_screen.egp")} $priceBeforeDiscount',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black45,
                          ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translator.currentLanguage == "ar"
                        ? '$price ${translator.translate("categories_screen.egp")}'
                        : '${translator.translate("categories_screen.egp")} $price',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Container(
                    height: 38.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(25),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Color.fromRGBO(0, 0, 0, 0.12),
                      //     offset: Offset(0, 2),
                      //     blurRadius: 11.sp,
                      //   )
                      // ],
                    ),
                    child: WishlistIconWidget(
                      productId: productId.toString(),
                      isFavorite: isFavorite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
