import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ads extends StatelessWidget {
  const Ads({
    required this.adImageBackground,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final adImageBackground;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h , right: 15.w , left: 15.w),
      child: CachedNetworkImage(
          imageUrl: adImageBackground,
          imageBuilder: (context, imageProvider) => InkWell(
                onTap: () {
                  onPress!();
                },
                child: Container(
                  height: 205.h,
                  width: 344.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.0.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
    );
  }
}
