import 'package:appmetrica_sdk/appmetrica_sdk.dart';
import 'package:coffepedia/business_logic/categories/categories_cubit.dart';
import 'package:coffepedia/data/repository/categories_repository.dart';
import 'package:coffepedia/data/web_services/categories_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/category_screen.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../main.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(
        CategoriesRepository(
          CategoriesWebServices(),
        ),
      ),
      child: CardCategory(),
    );
  }
}

class CardCategory extends StatefulWidget {
  const CardCategory({
    Key? key,
  }) : super(key: key);

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  @override
  void initState() {
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return Container(
            margin: EdgeInsets.only(bottom: 24.h),
            width: MediaQuery.of(context).size.width,
            height: 130.h,
            child: ListView.builder(
              itemCount: state.categories!.data!.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    final hasData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          //TODO subCategoryAmr for slider
                          // return CategoryScreenProvider(
                          //   vendorId: -1,
                          //   categoryName: '',
                          //   categoriesId: 4,
                          //   subCategoryId: 3,
                          //   subCategoryName: "mac",
                          //   subCategories:
                          //       state.categories!.data![index]!.children,
                          //   multiMap: {},
                          //   rangeMap: {},
                          //   singleMap: {},
                          // );
                          return CategoryScreenProvider(
                            vendorId: -1,
                            categoryName: '',
                            categoriesId: state.categories!.data![index]!.id!,
                            subCategories:
                                state.categories!.data![index]!.children,
                            multiMap: {},
                            rangeMap: {},
                            singleMap: {},
                          );
                        },
                      ),
                    );
                    AppmetricaSdk().reportEvent(
                        name:
                            'category ${state.categories!.data![index]!.name}');
                    if (hasData == true) {
                      BlocProvider.of<CategoriesCubit>(context).getCategories();
                    }
                  },
                  child: Container(
                    width: 190.w,
                    height: 110.h,
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20.h,
                          child: Container(
                            height: 100.h,
                            width: 190.w,
                            child: SvgPicture.asset(Assets.iconsCofePediaLogo),
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Color.fromRGBO(0, 0, 0, 0.12),
                              //     blurRadius: 11.r,
                              //     offset: Offset(0, 2),
                              //   ),
                              // ],
                              color: Color(0xff4470C1),
                              borderRadius: BorderRadius.circular(
                                7.r,
                              ),
                              // image: DecorationImage(
                              //   image: AssetImage(
                              //     Assets.iconsCofePediaLogo,
                              //   ),
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 1.w,
                          left: 1.w,
                          bottom: 16.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment:  CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 96.w,
                                // color: Colors.red,
                                alignment: translator.currentLanguage == "ar"
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7.w, vertical: 10.h),
                                child: Text(
                                  state.categories!.data![index]!.name!,
                                  textDirection: TextDirection.ltr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: Color(0xffFFD008),
                                        height: 1.25.h,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w900,
                                      ),
                                ),
                              ),
                              CustomNetworkImage(
                                imageUrl: state.categories!.data![index]!.icon!,
                                height: 120.h,
                                width: 86.w,
                                radius: 2.h,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return CategoryShimmerWidget();
        }
      },
    );
  }
}
