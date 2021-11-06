import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({required this.title, required this.onPress, Key? key})
      : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPress,
          child: ListTile(
            title: Text(title),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 16.w,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5.h,
          color: Color(0xffE3E3E3),
        ),
      ],
    );
  }
}
