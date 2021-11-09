import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/shared/custom_outline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              width: 130.w,
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  //backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.pink),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(height: 70.h,left: 10.w,
                      child: Container(
                        height: 70.h,
                        width: 150.w,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.sp),color: Colors.green),
                      ),
                    ),
                    Positioned(
                        top: 10.h,
                        bottom: 10.w,
                        // height: 10.h,
                        right: 10.w,
                        child: Image.asset(
                          Assets.imagesPartnerLogo1,
                          height: 64.h,
                          width: 102.w,
                        )),
                    Positioned(
                      top: 12.6.h,
                      left: 12.w,
                      child: Text(
                        'Beans',
                        style: TextStyle(fontSize: 16, color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
