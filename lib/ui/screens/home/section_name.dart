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
      child: Text(section_name,
      style: TextStyle(color: Colors.black , 
      fontSize: 16.sp),
      textAlign: TextAlign.start,),
    );
  }
}
