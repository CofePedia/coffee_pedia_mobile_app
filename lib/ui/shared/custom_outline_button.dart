import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    required this.title,
    required this.onPress,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.shadowColor,
    Key? key,
  }) : super(key: key);
  final String title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback onPress;
  final Color? borderColor;
  final BoxShadow? shadowColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height!,
        width: width!,
        decoration:
            BoxDecoration(boxShadow: [shadowColor!], color: Colors.white),
        child: OutlinedButton(
          onPressed: onPress,
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14.sp,
                    ),
              ),
            ],
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(
                color: borderColor!,
              ),
            ),
            // shadowColor:
            //     MaterialStateProperty.all(Color.fromRGBO(16, 124, 192, 0.41)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4.w),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
