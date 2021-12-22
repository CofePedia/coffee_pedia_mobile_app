import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          width: 158.w,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.zero,
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: _selectedIndex == index
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
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xffEED2BB),
                  ),
                ),
                Positioned(
                    top: 2.h,
                    bottom: 2.h,
                    right: 2.w,
                    left: 35.w,
                    child: Image.asset(
                      Assets.imagesPack,
                      height: 64.h,
                      width: 102.w,
                    )),
                Positioned(
                  top: 12.6.h,
                  left: 12.w,
                  //bottom: 49.h,
                  child: Text(
                    'Beans',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(
                        0xff3A1008,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
