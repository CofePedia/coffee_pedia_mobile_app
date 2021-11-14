import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    required this.category_image,
    required this.category_image_background,
    required this.category_name,
    Key? key,
  }) : super(key: key);
  final String category_image, category_image_background, category_name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CategoryScreen();
            },
          ),
        );
      },
      child: Container(
        height: 84.h,
        margin: EdgeInsets.only(bottom: 24.h, right: 15.w, left: 15.w),
        child: Container(
          width: 150.w,
          height: 70.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0.r),
            image: DecorationImage(
              image: AssetImage(Assets.imagesCardBlue),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  category_name.toString(),
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color(0xffffd008),
                      ),
                ),
              ),
              Container(
                child: CachedNetworkImage(
                  imageUrl: category_image,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
