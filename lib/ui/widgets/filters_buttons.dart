import 'package:coffepedia/data/models/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersButtons extends StatefulWidget {
  const FiltersButtons(
      {required this.multiFilter,
      required this.multiKey,
      required this.multiMap,
      Key? key})
      : super(key: key);
  final List<CategoryProductsDataFiltersOptions>? multiFilter;
  final String multiKey;
  final Map<String, List<String?>> multiMap;

  @override
  State<FiltersButtons> createState() => _FiltersButtonsState();
}

class _FiltersButtonsState extends State<FiltersButtons> {
  List<bool>? selected;
  @override
  void initState() {
    selected = List.filled(widget.multiFilter!.length, false);
    super.initState();
  }

  void addValueToMultiMap<K, V>(
      Map<K, List<V>> map, K key, V value, isSelected) {
    map.update(
      key,
      (list) {
        if (isSelected == true) {
          return list..add(value);
        } else {
          return list..remove(value);
        }
      },
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
              color: selected![index]
                  ? Theme.of(context).primaryColor
                  : Color(0xff231F20),
              fontSize: 13.sp,
            ),
          ),
          selected: selected![index],
          side: BorderSide(
            color: selected![index]
                ? Theme.of(context).primaryColor
                : Colors.transparent,
          ),
          backgroundColor: Color(0xffE9E7E7),
          selectedColor: Colors.white,
          selectedShadowColor: Color.fromARGB(41, 16, 124, 192),
          elevation: selected![index] ? 2 : 0,
          showCheckmark: false,
          onSelected: (bool value) {
            selected![index] = value;
            setState(() {
              addValueToMultiMap(
                widget.multiMap,
                widget.multiKey + '[]',
                widget.multiFilter![index].id.toString(),
                value,
              );
            });
          },
        ),
      ),
    );
  }
}
