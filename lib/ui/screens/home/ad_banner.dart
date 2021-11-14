import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({
    required this.ad_image_background,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final ad_image_background;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: CachedNetworkImage(
          imageUrl: ad_image_background,
          imageBuilder: (context, imageProvider) => InkWell(
                onTap: () {
                  onPress!();
                },
                child: Container(
                  height: 60.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
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
