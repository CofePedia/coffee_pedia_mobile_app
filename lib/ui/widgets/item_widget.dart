import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/shared/wishlist_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemWidget extends StatefulWidget {
  final Function() onPress;
  final String image;
  final int discount;
  final int rate;
  final String title;
  final int price;
  final int priceBeforeDiscount;
  final String productId;
  final bool isFavorite;
  bool isInCart;
  ItemWidget({
    required this.image,
    required this.onPress,
    required this.discount,
    required this.priceBeforeDiscount,
    required this.title,
    required this.price,
    required this.rate,
    required this.productId,
    required this.isFavorite,
    required this.isInCart,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: InkWell(
        onTap: widget.onPress,
        child: Container(
          height: 262.h,
          width: 214.w,
          margin: EdgeInsets.only(bottom: 8.h),
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
            // image: DecorationImage(
            //   image: AssetImage(
            //     Assets.imagesCardWhite,
            //   ),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35.w,
                    ),
                    CustomNetworkImage(
                      imageUrl: widget.image,
                      height: 130.h,
                      width: 85.w,
                      radius: 2,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 20.h),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.isInCart = !widget.isInCart;
                          });
                        },
                        child: SvgPicture.asset(
                          Assets.iconsShoppingBasket,
                          width: 24.w,
                          color: widget.isInCart
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          height: 18.h,
                        ),
                      ),
                    ),
                  ],
                ),
                widget.discount == 0 && widget.rate == 0
                    ? SizedBox(
                        height: 16.h,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.discount == 0
                              ? SizedBox.shrink()
                              : Container(
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
                                    '${widget.discount} % ${translator.translate("product_screen.off")}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                          widget.rate == 0
                              ? SizedBox.shrink()
                              : Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsStarActive),
                                    SizedBox(
                                      width: 6.14.w,
                                    ),
                                    Text(
                                      widget.rate.toString(),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  width: 214.w,
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 14.sp, height: 1.25),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                widget.discount != 0
                    ? Text(
                        '${widget.priceBeforeDiscount} ${translator.translate("wishlist_screen.egp")}',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black45,
                            ),
                      )
                    : SizedBox(
                        height: 12.h,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.price} ${translator.translate("wishlist_screen.egp")}',
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
                        //       color: Color.fromRGBO(0, 0, 0, 0.12),
                        //       offset: Offset(0, 2),
                        //       blurRadius: 11.sp)
                        // ],
                      ),
                      child: WishlistIconWidget(
                        productId: widget.productId,
                        isFavorite: widget.isFavorite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
