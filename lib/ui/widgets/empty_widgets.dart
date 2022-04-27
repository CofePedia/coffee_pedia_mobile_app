import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidgets extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String? buttonTitle;
  final Function()? onPress;
  const EmptyWidgets(
      {required this.image,
      required this.title,
      this.onPress,
      required this.description,
      this.buttonTitle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          SizedBox(
            height: 16.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 14.sp),
          ),
          SizedBox(
            height: 24.h,
          ),
          InkWell(
            onTap: onPress ?? () {},
            child: Text(
              buttonTitle ?? "",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Color(0xff007CC6),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
