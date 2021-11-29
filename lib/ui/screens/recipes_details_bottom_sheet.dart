import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipesDetailsBottomSheet extends StatelessWidget {
  const RecipesDetailsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      builder: (_, controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
        ),
        child: ListView(
          controller: controller,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 24.h,
                left: 8.w,
                right: 8.w,
              ),
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(Icons.close),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            // font change
            Text(
              'French Cafe au Lait',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Color(0xff181818),
                  ),
            ),
            SizedBox(
              height: 17.6.h,
            ),
            Text(
              'This Mocha au Lait mix makes a great holiday gift, presented in a decorative holiday container or mug! Just make sure you remember to include the directions on a gift tag!',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
