import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 76.h,
            margin: EdgeInsets.only(bottom: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 9.h),
                        child: Text(
                          "CoffePedia Dark Espresso Roast COFFEE",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    Text(
                      "EGP 415",
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(decoration: TextDecoration.lineThrough, color: Color(0xff606266)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "EGP 340",
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline2!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 6.h),
                  margin: EdgeInsets.only(right: 12.w),
                  child: Image.asset(
                    Assets.imagesPack,
                  ),
                ),
              ],
            ),
          ),
          Text("Sold by", style: Theme.of(context).textTheme.bodyText1),
          SizedBox(
            height: 4.h,
          ),
          Text("D.Cappuccino Café", style: Theme.of(context).textTheme.bodyText1),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xffF2F2F2),
                radius: 17.h,
                child: Icon(
                  Icons.add,
                  size: 20.r,
                  color: Color(0xff606266),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.71.w),
                width: 34.w,
                height: 34.h,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  border: Border.all(color: Color(0xffF3F1F1), width: 1.w),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                child: Text("1"),
              ),
              CircleAvatar(
                backgroundColor: Color(0xffF2F2F2),
                radius: 17.h,
                child: Icon(
                  Icons.remove,
                  size: 20.r,
                  color: Color(0xff606266),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.iconsHeart,
                      width: 15.w,
                      height: 13.5.h,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Move to Wishlist",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 2.w,
                height: 25.h,
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                color: Color(0xff484848),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.iconsDelete,
                      width: 14.w,
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Remove",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
