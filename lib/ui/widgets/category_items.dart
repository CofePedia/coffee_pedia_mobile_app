import 'package:coffepedia/business_logic/category_products/category_products_cubit.dart';
import 'package:coffepedia/data/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItems extends StatefulWidget {
  final int categoriesId;
  final List<CategoriesDataChildren?>? subCategories;

  CategoryItems({
    required this.categoriesId,
    required this.subCategories,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  int? _selectedSubCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 11.w, right: 11.w),
        scrollDirection: Axis.horizontal,
        itemCount: widget.subCategories!.length,
        itemBuilder: (context, index) => Container(
          width: 158.w,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                _selectedSubCategory == widget.subCategories![index]!.id!
                    ? _selectedSubCategory = 0
                    : _selectedSubCategory = widget.subCategories![index]!.id!;

                BlocProvider.of<CategoryProductsCubit>(context)
                    .getCategoryProducts(
                        _selectedSubCategory!, widget.categoriesId, {});
              });
              print('AmrSelectedSubCategoryId2 $_selectedSubCategory');
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.zero,
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color:
                      _selectedSubCategory == widget.subCategories![index]!.id!
                          ? Color(0xffCC1010)
                          : Colors.transparent,
                ),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  height: 72.h,
                  width: 145.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xffEED2BB),
                  ),
                ),
                Positioned(
                  top: 2.h,
                  bottom: 2.h,
                  right: 2.w,
                  left: 50.w,
                  child: Image.network(
                    widget.subCategories![index]!.icon!,
                    height: 64.h,
                    width: 102.w,
                  ),
                ),
                Positioned(
                  top: 12.6.h,
                  left: 12.w,
                  //bottom: 49.h,
                  child: Text(
                    widget.subCategories![index]!.name!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(
                        0xff3A1008,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
