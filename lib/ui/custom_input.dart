import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    required this.title,
    required this.hint,
    required this.textEditingController,
    this.icon = false,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController textEditingController;
  final bool icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: 9.h,
          ),
          SizedBox(
            height: 50.h,
            child: TextFormField(
              controller: textEditingController,
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: const Color(0xffc3ccd2),
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.w),
                  borderSide: BorderSide(
                    color: Color(0xffE3E3E3),
                    width: 0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.w),
                  borderSide: BorderSide(
                    color: Color(0xffE3E3E3),
                    width: 0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
