import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    required this.title,
    required this.onPress,
    this.assetName,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.boxShadow,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? assetName;
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback onPress;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:   Padding(
        padding: EdgeInsets.only(
            top: 15.h, right: 12.w, left: 12.w),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 6),
              child: CustomOutlineButton(
                title: 'weight[index]',
                borderColor:Theme.of(context).primaryColor,

                onPress: () {

                },
                height: 40.h,
                width: 152.w,
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    // offset: Offset(0, 0),
                    // spreadRadius: 0,
                  ),
                ],
                borderRadius: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
