import 'package:coffepedia/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    required this.title,
    required this.hint,
    required this.textEditingController,
    this.icon = false,
    this.padding = true,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController textEditingController;
  final bool icon;
  final bool padding;
  final ValueNotifier<bool> changeObscure = ValueNotifier(true);
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ? 9.w : 0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: kGrey2, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 9.h,
          ),
          ValueListenableBuilder<bool>(
            valueListenable: changeObscure,
            builder: (context, value, _) {
              return SizedBox(
                height: 50.h,
                child: TextFormField(
                  controller: textEditingController,
                  obscureText: !icon ? !value : value,
                  style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  onChanged: onChanged!,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: Theme.of(context).textTheme.headline2!.copyWith(
                          color: kGrey3,
                        ),
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
                    // suffixIconConstraints:
                    //     BoxConstraints(maxHeight: 15.h, maxWidth: 24.w),
                    suffixIcon: !icon
                        ? null
                        : InkWell(
                            onTap: () {
                              changeObscure.value = !value;
                            },
                            child: Icon(
                              value ? Icons.visibility_off : Icons.visibility,
                              size: 20.h,
                              color: kGrey4,
                            ),
                          ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
