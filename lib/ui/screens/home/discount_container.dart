import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({
    required this.discount_text,
    Key? key,
  }) : super(key: key);
  final String discount_text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.h,
      width: 55.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.5),
            bottomRight: Radius.circular(12.5),
            topLeft: Radius.circular(12.5),
            topRight: Radius.zero),
      ),
      child: Text(
        discount_text,
        style: TextStyle(
          fontSize: 10.sp,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
