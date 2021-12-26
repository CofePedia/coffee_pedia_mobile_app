import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.width,
  }) : super(key: key);
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: width,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Coffepedia',
          contentPadding: EdgeInsets.all(8.h),
          border: InputBorder.none,
          prefixIcon: SvgPicture.asset(
            Assets.iconsSearch,
            fit: BoxFit.none,
          ),
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Colors.black54,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        border: Border.all(
          color: Colors.black12,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.23),
            blurRadius: 11.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
