import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.title,
    required this.onPress,
    this.assetName,
    this.width,
    this.height,
    this.borderRadius,
    this.buttonColor,
    this.imageColor,
    this.imageHeight,
    this.imageWidth,
    Key? key,
  }) : super(key: key);
  final String? title;
  final String? assetName;
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final double? borderRadius;
  final VoidCallback onPress;
  final Color? buttonColor;
  final Color? imageColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height ?? 40.h,
        width: width ?? 152.w,
        child: ElevatedButton(
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: assetName != null
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                assetName ?? '',
                color: imageColor,
                alignment: Alignment.centerRight,
                width: imageWidth,
                height: imageHeight,
              ),
              Text(title ?? '', style: Theme.of(context).textTheme.headline2),
            ],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor!),
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
