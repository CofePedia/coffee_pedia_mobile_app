import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExtensions on BuildContext {

  Future<void> showCustomBottomSheet(Widget child) {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.h),
          topRight: Radius.circular(15.w),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return child;
      },
    );
  }

  Future<void> showCustomDialog(Widget child) {
    return showDialog(
      context: this,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(15.width),
      //     topRight: Radius.circular(15.width),
      //   ),
      // ),
      // backgroundColor: Colors.white,
      builder: (context) {
        return child;
      },
    );
  }
}