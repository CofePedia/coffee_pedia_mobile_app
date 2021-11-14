import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({
    required this.adImageBackground,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final adImageBackground;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: CachedNetworkImage(
          imageUrl: adImageBackground,
          imageBuilder: (context, imageProvider) => InkWell(
                onTap: () {
                  onPress!();
                },
                child: Container(
                  height: 66.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: imageProvider,
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  child: Image.asset(
                    Assets.imagesBitmap,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
    );
  }
}
