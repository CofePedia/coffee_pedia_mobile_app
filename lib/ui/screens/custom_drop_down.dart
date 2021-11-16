import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownTextField extends StatelessWidget {
  CustomDropDownTextField({
    required this.title,
    required this.hint,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Color(0xff8A8A8A),
              ),
        ),
        SizedBox(
          height: 9.h,
        ),
        SizedBox(
          width: 168.w,
          height: 50.h,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              isDense: false,
              hintStyle: Theme.of(context).textTheme.headline2!.copyWith(
                    color: const Color(0xffCCCCCC),
                  ),
              contentPadding: EdgeInsets.all(5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.w),
                borderSide: BorderSide(
                  color: Color(0xffE3E3E3),
                  width: 1.w,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.w),
                borderSide: BorderSide(
                  color: Color(0xffE3E3E3),
                  width: 1.w,
                ),
              ),
            ),
            hint: Text(
              hint,
              style: TextStyle(
                fontSize: 15,
                fontFamily: "dinRegular",
                color: Color(0xff9aa2b5),
              ),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            items: [],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
