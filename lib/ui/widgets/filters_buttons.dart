import 'package:coffepedia/data/models/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersButtons extends StatefulWidget {
  const FiltersButtons(
      {required this.multiFilter,
      required this.multiKey,
      required this.map,
      Key? key})
      : super(key: key);
  final List<CategoryProductsDataFiltersOptions>? multiFilter;
  final String multiKey;
  final Map<String, List<String?>> map;

  @override
  State<FiltersButtons> createState() => _FiltersButtonsState();
}

class _FiltersButtonsState extends State<FiltersButtons> {
  List<bool>? _selected;
  @override
  void initState() {
    _selected = List.filled(widget.multiFilter!.length, false);
    super.initState();
  }

  // final map = <String, List<int?>>{};

  void addValueToMap<K, V>(Map<K, List<V>> map, K key, V value) {
    map.update(
      key,
      (list) => list..add(value),
      ifAbsent: () => [value],
    );
    print(map);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.w,
      children: List.generate(
        widget.multiFilter!.length,
        (index) => FilterChip(
          label: Text(
            widget.multiFilter![index].name!,
            style: TextStyle(
              color: _selected![index]
                  ? Theme.of(context).primaryColor
                  : Color(0xff231F20),
              fontSize: 13.sp,
            ),
          ),
          selected: _selected![index],
          side: BorderSide(
            color: _selected![index]
                ? Theme.of(context).primaryColor
                : Colors.transparent,
          ),
          backgroundColor: Color(0xffE9E7E7),
          selectedColor: Colors.white,
          selectedShadowColor: Color.fromARGB(41, 16, 124, 192),
          elevation: _selected![index] ? 2 : 0,
          showCheckmark: false,
          onSelected: (bool value) {
            _selected![index] = value;
            setState(() {
              addValueToMap(
                widget.map,
                widget.multiKey + '[]',
                widget.multiFilter![index].id.toString(),
              );

              // widget.map.removeWhere((key, value) {
              //   return key == widget.multiKey &&
              //       value == [widget.multiFilter![index].id];
              // });
            });
          },
        ),
      ),
    );
  }
}
