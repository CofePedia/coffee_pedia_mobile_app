import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecationName extends StatelessWidget {
  const SecationName({
    required this.section_name,
    Key? key,
  }) : super(key: key);

  final String section_name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h , right: 15.w , left: 15.w),
      child: Text(section_name,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
      textAlign: TextAlign.start,),
    );
  }
}
