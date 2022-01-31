import 'package:coffepedia/business_logic/category_products/category_products_cubit.dart';
import 'package:coffepedia/data/models/categories.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/repository/category_products_repository.dart';
import 'package:coffepedia/data/web_services/category_products_web_services.dart';
import 'package:coffepedia/ui/screens/category_screen.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:coffepedia/ui/widgets/filters_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersScreenProvider extends StatelessWidget {
  final List<CategoryProductsDataFilters?>? productFilters;
  final int categoriesId;
  final List<CategoriesDataChildren?>? subCategories;

  const FiltersScreenProvider(
      {required this.categoriesId,
      required this.subCategories,
      required this.productFilters,
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
      ),
    );
  }
}

class FiltersScreen extends StatefulWidget {
  final List<CategoryProductsDataFilters?>? productFilters;
  final int categoriesId;
  final List<CategoriesDataChildren?>? subCategories;
  const FiltersScreen(
      {required this.productFilters,
      required this.subCategories,
      required this.categoriesId,
      Key? key})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<bool>? _isOpen;
  RangeValues _currentRangeValues = RangeValues(40, 60);
  int? radioRate;
  int? selectedRate;
  final result = {};
  final map = <String, List<String?>>{};

  @override
  void initState() {
    _isOpen = List.filled(widget.productFilters!.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 750.h,
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
          Column(
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
                    'Close',
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
                          child: widget.productFilters![filterIndex]!.type ==
                                  'multi'
                              ? FiltersButtons(
                                  multiFilter: widget
                                      .productFilters![filterIndex]!
                                      .optionsMulti!,
                                  multiKey:
                                      widget.productFilters![filterIndex]!.key!,
                                  map: map,
                                )
                              : widget.productFilters![filterIndex]!.type ==
                                      'range'
                                  ? Column(
                                      children: [
                                        RangeSlider(
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          values: _currentRangeValues,
                                          max: 80,
                                          // widget
                                          //     .productFilters![filterIndex]!
                                          //     .optionsRange!
                                          //     .max!
                                          //     .toDouble(),
                                          min: 20,
                                          // widget
                                          //     .productFilters![filterIndex]!
                                          //     .optionsRange!
                                          //     .min!
                                          //     .toDouble(),
                                          divisions: 5,
                                          labels: RangeLabels(
                                            _currentRangeValues.start
                                                .round()
                                                .toString(),
                                            _currentRangeValues.end
                                                .round()
                                                .toString(),
                                          ),
                                          onChanged: (RangeValues values) {
                                            setState(() {
                                              _currentRangeValues = values;
                                            });
                                          },
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Lower Price: ${_currentRangeValues.start.round().toString()}',
                                            ),
                                            Text(
                                              'Upper Price: ${_currentRangeValues.end.round().toString()}',
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : widget.productFilters![filterIndex]!.type ==
                                          'single'
                                      ? Container(
                                          height: 50.h,
                                          child: ListView.builder(
                                            itemCount: widget
                                                .productFilters![filterIndex]!
                                                .optionsSingle!
                                                .length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                setState(() {
                                                  radioRate = index;
                                                  selectedRate = widget
                                                      .productFilters![
                                                          filterIndex]!
                                                      .optionsSingle![index];
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
                                                      color: radioRate == index
                                                          ? Theme.of(context)
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
                                                          .optionsSingle![index]
                                                          .toString(),
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
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
                height: 132.h,
                width: 375.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.18),
                      blurRadius: 2.r,
                    ),
                  ],
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
                        // BlocProvider.of<CategoryProductsCubit>(context)
                        //     .getCategoryProducts(0, widget.categoriesId, map);
                        // TODO: change route
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CategoryScreenProvider(
                                subCategories: widget.subCategories,
                                categoriesId: widget.categoriesId,
                                multiMap: map,
                              );
                            },
                          ),
                        );
                      },
                      title: 'Show results',
                      height: 50.h,
                      width: 345.w,
                      imageWidth: 0,
                      imageHeight: 0,
                      buttonColor: Theme.of(context).primaryColor,
                      borderRadius: 25.r,
                      imageColor: Colors.transparent,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Clear all',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Color(0xff007CC6),
                            ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
