import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersButtons extends StatefulWidget {
  const FiltersButtons({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  State<FiltersButtons> createState() => _FiltersButtonsState();
}

class _FiltersButtonsState extends State<FiltersButtons> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: _selected
                  ? Theme.of(context).primaryColor
                  : Color(0xff231F20),
              fontSize: 13.sp,
            ),
      ),
      selected: _selected,
      side: BorderSide(
        color: _selected ? Theme.of(context).primaryColor : Colors.transparent,
      ),
      backgroundColor: Color(0xffE9E7E7),
      selectedColor: Colors.white,
      selectedShadowColor: Color.fromARGB(41, 16, 124, 192),
      elevation: _selected ? 2 : 0,
      showCheckmark: false,
      onSelected: (bool value) {
        _selected = value;
        setState(() {});
      },
    );
  }
}
