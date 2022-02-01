import 'package:coffepedia/business_logic/categories/categories_cubit.dart';
import 'package:coffepedia/data/repository/categories_repository.dart';
import 'package:coffepedia/data/web_services/categories_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            height: 80.h,
            child: ListView.builder(
              itemCount: state.categories!.data!.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoryScreenProvider(
                            categoriesId: state.categories!.data![index]!.id!,
                            subCategories:
                                state.categories!.data![index]!.children,
                            multiMap: {},
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 150.w,
                    height: 84.h,
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10.h,
                          child: Container(
                            height: 70.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                  blurRadius: 11.r,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                7.r,
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.imagesCardBlue,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 11.w,
                          top: 30.h,
                          child: Text(
                            state.categories!.data![index]!.name!,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Color(0xffFFD008),
                                    ),
                          ),
                        ),
                        Positioned(
                          right: 12.5.w,
                          child: Image.network(
                            state.categories!.data![index]!.icon!,
                            width: 42.w,
                            height: 76.h,
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
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
