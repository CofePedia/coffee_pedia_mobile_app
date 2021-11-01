import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutItemsScreen extends StatelessWidget {
  const CheckoutItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 92.h,
        padding: EdgeInsets.symmetric(
          vertical: 21.h,
          horizontal: 15.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.r),
            topRight: Radius.circular(22.r),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
          ),
          child: Text("Proceed to checkout"),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shopping Basket"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 24.6.h,
                      horizontal: 0,
                    ),
                    child: Text("Items (3 Item)"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    return CheckoutItems();
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 15.75.h),
                      height: 1.h,
                      color: Color(0xff979797),
                    );
                  },
                  itemCount: 2,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffF8F8F8),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Have a coupon?"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Coupon code",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.w),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.w),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                        suffixIcon: Container(
                          width: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5.r),
                              topRight: Radius.circular(5.r),
                            ),
                            color: Color(0xff107CC0),
                          ),
                          alignment: Alignment.center,
                          child: Text("Apply"),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal"),
                      Text("EGP 840"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Discount"),
                      Text("- EGP 120"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery charge"),
                      Text("+ EGP 50"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, bottom: 28.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total price"),
                        Text("EGP 854"),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.imagesVisaLogo,
                        width: 53.w,
                        height: 25.h,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      SvgPicture.asset(
                        Assets.imagesMastercardLogo,
                        width: 44.w,
                        height: 28.h,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutItems extends StatelessWidget {
  const CheckoutItems({Key? key}) : super(key: key);

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
                        ),
                      ),
                    ),
                    Text(
                      "EGP 415",
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      "EGP 340",
                      maxLines: 2,
                      textAlign: TextAlign.start,
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
          Text("Sold by"),
          Text("D.Cappuccino Café"),
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
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text("Move to Wishlist"),
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
                    Text("Remove"),
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
