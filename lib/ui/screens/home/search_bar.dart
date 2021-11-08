import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);
  // final Function onPress_button;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 345.w,
      margin: EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Search Coffepedia",
        ),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
    );
  }
}
