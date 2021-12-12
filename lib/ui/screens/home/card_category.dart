import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    required this.categoryImage,
    required this.categoryImageBackground,
    required this.categoryName,
    Key? key,
  }) : super(key: key);
  final String categoryImage, categoryImageBackground, categoryName;

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
        width: 150.w,
        height: 84.h,
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        child: Stack(
          children: [
            Positioned(
              top: 10.h,
              child: Container(
                height: 70.h,
                width: 150.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      blurRadius: 11.r,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    7.r,
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      Assets.imagesCardBlue,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 11.w,
              top: 30.h,
              child: Text(
                'Coffee',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Color(0xffFFD008),
                    ),
              ),
            ),
            Positioned(
              right: 12.5.w,
              child: Image.asset(
                Assets.imagesPack,
                width: 42.w,
                height: 76.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
