import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required this.hintText,
      this.keyboardType,
      this.width,
      this.suffix,
      Key? key})
      : super(key: key);
  final TextInputType? keyboardType;
  final String hintText;
  final double? width;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.h,
      child: TextFormField(
        keyboardType: keyboardType,
        textInputAction: TextInputAction.go,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                color: Color(
                  0xffCCCCCC,
                ),
              ),
          contentPadding: EdgeInsets.all(15.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                3.0.sp,
              ),
            ),
          ),
          suffixIcon: suffix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0.sp),
            borderSide: BorderSide(
              color: Color(0xffE3E3E3),
              width: 1.0.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
