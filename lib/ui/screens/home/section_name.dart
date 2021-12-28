import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionName extends StatelessWidget {
  const SectionName({
    required this.sectionName,
    Key? key,
  }) : super(key: key);

  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h, right: 15.w, left: 15.w),
      child: Text(
        sectionName,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.black),
        textAlign: TextAlign.start,
      ),
    );
  }
}
