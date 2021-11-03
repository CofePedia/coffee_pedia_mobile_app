import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Ad extends StatelessWidget {
  const Ad({
    required this.ad_image_background,
    Key? key, 
  }) : super(key: key);
  final  ad_image_background;
  // final Function onPress_button;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: MediaQuery.of(context).size.width,
         child: 
         CachedNetworkImage(
            imageUrl: ad_image_background,
            imageBuilder: (context, imageProvider) => Container(
              height: 60.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            )
         )
    );
  }
}
