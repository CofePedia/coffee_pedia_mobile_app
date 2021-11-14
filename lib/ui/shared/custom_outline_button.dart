import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    required this.title,
    required this.onPress,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.shadowColor,
    this.assetName,
    this.imageColor,
    this.imageHeight,
    this.imageWidth,
    Key? key,
  }) : super(key: key);
  final String title;
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback onPress;
  final Color? borderColor;
  final BoxShadow? shadowColor;
  final String? assetName;
  final double? imageWidth;
  final double? imageHeight;
  final Color? imageColor;

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
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
