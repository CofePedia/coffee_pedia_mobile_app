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
            bottomLeft: Radius.circular(12.5.r),
            bottomRight: Radius.circular(12.5.r),
            topLeft: Radius.circular(12.5.r),)
      ),
      child: Text(
        discount_text,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
