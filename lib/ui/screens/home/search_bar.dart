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
        width: 345.w,
        child:
                TextField(
            obscureText: true,
            decoration: InputDecoration(
                  hintText: 'Search Coffepedia',
                  prefixIcon: SvgPicture.asset(
                       Assets.iconsSearch,
                       fit: BoxFit.none,
                      ),
                  hintStyle: TextStyle(color: Colors.black),
                  // filled: true,
                  // fillColor: Colors.white,
                ),
                ),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.black12),
                color: Colors.white
                ),
                   );
  }
}
