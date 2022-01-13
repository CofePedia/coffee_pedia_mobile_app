import 'package:coffepedia/ui/delivery_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutPopUp extends StatelessWidget {
  const CheckoutPopUp({this.title, this.totalPrice, this.image, Key? key})
      : super(key: key);

  final String? image;
  final String? title;
  final String? totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 222.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60.h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 6.h),
                  margin: EdgeInsets.only(right: 12.w),
                  child: Image.network(
                    image!,
                  ),
                ),
                Expanded(
                  child: Text(
                    title!,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Color(0xff231F20), height: 1.5.h),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TOTAL",
                      style: Theme.of(context).textTheme.overline,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "EGP $totalPrice",
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 22.h, bottom: 7.h),
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DeliveryInfoScreenProvider();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
              ),
              child: Text(
                "Proceed to checkout",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Continue Shopping",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
