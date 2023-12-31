import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreItems extends StatelessWidget {
  const MoreItems({
    required this.onPress,
    this.subTitle,
    required this.title,
    required this.image,
    this.isAbout = false,
    Key? key,
  }) : super(key: key);
  final VoidCallback onPress;
  final String? subTitle;
  final String title;
  final String image;
  final bool isAbout;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 80.h,
          width: 343.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(6.h),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 16.sp,
                      color: isAbout ? Color(0xff000000) : Color(0xffBBB7B8),
                    ),
              ),
              Text(
                subTitle ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Color(0xffBBB7B8)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
