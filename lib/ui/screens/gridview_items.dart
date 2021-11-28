import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridviewItems extends StatelessWidget {
  const GridviewItems({
    required this.onPress,
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);
  final VoidCallback onPress;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 110.h,
        width: 165.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
              offset: Offset(0, 2),
              blurRadius: 11.r,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              height: 13.33.h,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
