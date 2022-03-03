import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/home/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  final double width;

  const SearchWidget({required this.width, Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: widget.width,
      child: TextField(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchBarProvider(),
            ),
          );
        },
        decoration: InputDecoration(
          hintText: translator.translate("home_screen.search"),
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
