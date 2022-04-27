import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/category_products/category_products_cubit.dart';
import 'package:coffepedia/data/models/categories.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/repository/category_products_repository.dart';
import 'package:coffepedia/data/web_services/category_products_web_services.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/widgets/filters_buttons.dart';
import 'package:coffepedia/ui/widgets/range_filter_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import 'category_screen.dart';

class FiltersScreenProvider extends StatelessWidget {
  final List<CategoryProductsDataFilters?>? productFilters;
  final int categoriesId;
  final List<CategoriesDataChildren?>? subCategories;
  final int? vendorId;
  final String? categoryName;

  const FiltersScreenProvider(
      {required this.categoriesId,
      required this.subCategories,
      required this.productFilters,
      required this.vendorId,
      required this.categoryName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryProductsCubit(
        CategoryProductsRepository(
          CategoryProductsWebServices(),
        ),
      ),
      child: FiltersScreen(
        categoriesId: categoriesId,
        productFilters: productFilters,
        subCategories: subCategories,
        categoryName: categoryName,
        vendorId: vendorId,
      ),
    );
  }
}

class FiltersScreen extends StatefulWidget {
  final List<CategoryProductsDataFilters?>? productFilters;
  final int categoriesId;
  final List<CategoriesDataChildren?>? subCategories;
  final int? vendorId;
  final String? categoryName;
  const FiltersScreen(
      {required this.productFilters,
      required this.subCategories,
      required this.categoriesId,
      required this.vendorId,
      required this.categoryName,
      Key? key})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<bool>? _isOpen;
  int? radioRate;
  int? selectedRate;
  final result = {};
  final multiMap = <String, List<String?>>{};
  final singleMap = <String, String?>{};
  final rangeMap = <String, String?>{};

  @override
  void initState() {
    _isOpen = List.filled(widget.productFilters!.length, false);
    super.initState();
  }

  void addValueToSingleMap<K, V>(Map<K, V> singleMap, K key, V value) {
    singleMap.update(
      key,
      (list) => value,
      ifAbsent: () => value,
    );
  }

  RangeValues currentRangeValues(start, end) {
    final RangeValues changeRangeValues = RangeValues(start, end);
    return changeRangeValues;
  }

  @override
  Widget build(BuildContext context) {
    return CheckInternetConnection(
      screen: Container(
        height: 700.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 24.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Text(
                        translator.translate("filter_screen.close"),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Color(0xff241F20),
                              fontSize: 14.sp,
                            ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ExpansionPanelList(
                      dividerColor: Color(0xff979797),
                      elevation: 0,
                      expandedHeaderPadding: EdgeInsets.zero,
                      children: List.generate(
                        widget.productFilters!.length,
                        (filterIndex) {
                          return ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder: (context, isOpen) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.h),
                                child: Text(
                                  widget.productFilters![filterIndex]!.name!,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              );
                            },
                            body: Container(
                              width: MediaQuery.of(context).size.width,
                              child:
                                  widget.productFilters![filterIndex]!.type ==
                                          'multi'
                                      ? FiltersButtons(
                                          multiFilter: widget
                                              .productFilters![filterIndex]!
                                              .optionsMulti!,
                                          multiKey: widget
                                              .productFilters![filterIndex]!
                                              .key!,
                                          multiMap: multiMap,
                                        )
                                      : widget.productFilters![filterIndex]!
                                                  .type ==
                                              'range'
                                          ? RangeFilterSlider(
                                              min: widget
                                                  .productFilters![filterIndex]!
                                                  .optionsRange!
                                                  .min!
                                                  .toDouble(),
                                              max: widget
                                                  .productFilters![filterIndex]!
                                                  .optionsRange!
                                                  .max!
                                                  .toDouble(),
                                              rangeMap: rangeMap,
                                            )
                                          : widget.productFilters![filterIndex]!
                                                      .type ==
                                                  'single'
                                              ? Container(
                                                  height: 50.h,
                                                  child: ListView.builder(
                                                    itemCount: widget
                                                        .productFilters![
                                                            filterIndex]!
                                                        .optionsSingle!
                                                        .length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          radioRate = index;
                                                          selectedRate = widget
                                                              .productFilters![
                                                                  filterIndex]!
                                                              .optionsSingle![index];
                                                          addValueToSingleMap(
                                                            singleMap,
                                                            widget
                                                                .productFilters![
                                                                    filterIndex]!
                                                                .key!,
                                                            selectedRate
                                                                .toString(),
                                                          );
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 50.w,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              radioRate == index
                                                                  ? Icons
                                                                      .radio_button_checked
                                                                  : Icons
                                                                      .radio_button_unchecked,
                                                              color: radioRate ==
                                                                      index
                                                                  ? Theme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : Colors.grey,
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Text(
                                                              widget
                                                                  .productFilters![
                                                                      filterIndex]!
                                                                  .optionsSingle![
                                                                      index]
                                                                  .toString(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13.sp),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox.shrink(),
                            ),
                            isExpanded: _isOpen![filterIndex],
                          );
                        },
                      ),
                      expansionCallback: (i, isOpen) => setState(
                        () => _isOpen![i] = !isOpen,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 132.h,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  height: 132.h,
                  width: 375.w,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color.fromRGBO(0, 0, 0, 0.18),
                    //     blurRadius: 2.r,
                    //   ),
                    // ],
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.r),
                      topRight: Radius.circular(22.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        onPress: () {
                          if (multiMap.isEmpty &&
                              rangeMap.isEmpty &&
                              singleMap.isEmpty) {
                            BotToast.showText(
                              text: translator
                                  .translate("filter_screen.enter_data"),
                            );
                          } else {
                            // Navigator.of(context).pop();
                            // Navigator.pushReplacement(context, newRoute);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return CategoryScreenProvider(
                                    subCategories: widget.subCategories,
                                    categoriesId: widget.categoriesId,
                                    multiMap: multiMap,
                                    singleMap: singleMap,
                                    rangeMap: rangeMap,
                                    categoryName: widget.categoryName,
                                    vendorId: widget.vendorId,
                                  );
                                },
                              ),
                            );
                          }
                          // BlocProvider.of<CategoryProductsCubit>(context)
                          //     .getCategoryProducts(0, widget.categoriesId, map);
                          // TODO: change route
                        },
                        title:
                            translator.translate("filter_screen.show_result"),
                        height: 50.h,
                        width: 345.w,
                        imageWidth: 0,
                        imageHeight: 0,
                        // buttonColor: Theme.of(context).primaryColor,
                        borderRadius: 25.r,
                        imageColor: Colors.transparent,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            multiMap.clear();
                            rangeMap.clear();
                            singleMap.clear();
                            radioRate = -1;
                          });
                          print("multiMap $multiMap");
                          print("rangeMap $rangeMap");
                          print("singleMap $singleMap");
                        },
                        child: Text(
                          translator.translate("filter_screen.clear_all"),
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Color(0xff007CC6),
                                  ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
