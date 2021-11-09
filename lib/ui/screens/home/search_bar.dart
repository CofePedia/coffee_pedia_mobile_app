import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 309.w,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Coffepedia', contentPadding: EdgeInsets.all(15.h),
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
          // filled: true,
          // fillColor: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black12,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.23),
            blurRadius: 11.sp,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
