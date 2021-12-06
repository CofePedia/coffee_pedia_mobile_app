import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _selected = !_selected;
            });
          },
          child: Icon(
            _selected ? Icons.check_circle : Icons.radio_button_unchecked,
            color: _selected ? Color(0xff27DC4E) : Color(0xffCDCDCD),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Text(
          widget.title,
          style:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }
}
