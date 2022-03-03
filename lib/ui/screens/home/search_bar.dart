import 'package:coffepedia/business_logic/search/search_cubit.dart';
import 'package:coffepedia/data/repository/search_repository.dart';
import 'package:coffepedia/data/web_services/search_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/main.dart';
import 'package:coffepedia/ui/screens/product_screen.dart';
import 'package:coffepedia/ui/shared/wishlist_icon.dart';
import 'package:coffepedia/ui/widgets/empty_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarProvider extends StatelessWidget {
  const SearchBarProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        SearchRepository(
          SearchWebServices(),
        ),
      ),
      child: SearchBar(),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 12.w,
                right: 12.w,
                bottom: 9.h,
                top: 53.h,
              ),
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    Assets.iconsHomeLogo,
                    height: 40.h,
                    width: 151.w,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 43.h,
                          width: 300.w,
                          child: TextField(
                            controller: _searchTextController,
                            onChanged: (searchedProduct) {
                              EasyDebounce.debounce(
                                  'search-key', Duration(seconds: 1), () {
                                BlocProvider.of<SearchCubit>(context)
                                    .getSearch(searchedProduct);
                              });
                              print('searchedProduct $searchedProduct');
                            },
                            decoration: InputDecoration(
                              hintText:
                                  translator.translate("home_screen.search"),
                              contentPadding: EdgeInsets.all(8.h),
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {});
                                  _searchTextController.clear();
                                },
                                child: Icon(Icons.close),
                              ),
                              prefixIcon: SvgPicture.asset(
                                Assets.iconsSearch,
                                fit: BoxFit.none,
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0.r),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.23),
                                blurRadius: 11.r,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('cancel',
                              style: Theme.of(context).textTheme.headline2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchIsPressed) {
                  return state.search!.data!.length > 0
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: GridView.builder(
                              padding: EdgeInsets.only(top: 40.h, bottom: 15.h),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 8.w,
                                childAspectRatio: 164.5.w / 305.h,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.search!.data!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ProductProvider(
                                            id: 5,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 305.h,
                                    width: 164.5.w,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Container(
                                          height: 280.h,
                                          width: 164.5.w,
                                          child: Image.asset(
                                            Assets.imagesCard,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          right: 17.w,
                                          child: Container(
                                            child: Image.network(
                                              state
                                                  .search!.data![index]!.image!,
                                              width: 75.w,
                                              height: 136.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        state.search!.data![index]!.rate! != 0
                                            ? Positioned(
                                                top: 30.h,
                                                left: 20.w,
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        Assets.iconsStarActive),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Text(
                                                      state.search!
                                                          .data![index]!.rate
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : SizedBox.shrink(),
                                        Positioned(
                                          top: 152.h,
                                          left: 12.w,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                state.search!.data![index]!
                                                            .discount ==
                                                        0
                                                    ? SizedBox(
                                                        height: 17.h,
                                                        width: 55.w,
                                                      )
                                                    : Container(
                                                        height: 17.h,
                                                        width: 55.w,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xffFFD008),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                              12.5.r,
                                                            ),
                                                            bottomRight:
                                                                Radius.circular(
                                                              12.5.r,
                                                            ),
                                                            bottomLeft:
                                                                Radius.circular(
                                                              12.5.r,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          '${state.search!.data![index]!.discount}% Off',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                        ),
                                                      ),
                                                SizedBox(
                                                  height: 15.h,
                                                ),
                                                Container(
                                                  width: 140.w,
                                                  child: Text(
                                                    state.search!.data![index]!
                                                        .name!,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1!
                                                        .copyWith(
                                                          fontSize: 14.sp,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 12.h,
                                                ),
                                                Text(
                                                  'EGP ${state.search!.data![index]!.priceBeforeDiscount}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: Colors.black45,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  'EGP ${state.search!.data![index]!.price}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 240.h,
                                          right: 18.w,
                                          child: Container(
                                            height: 38.h,
                                            width: 38.w,
                                            decoration: BoxDecoration(
                                              color: Color(0xffffffff),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.12),
                                                  offset: Offset(0, 2),
                                                  blurRadius: 11.sp,
                                                )
                                              ],
                                            ),
                                            child: WishlistIconWidget(
                                              productId: state
                                                  .search!.data![index]!.id!
                                                  .toString(),
                                              isFavorite: state.search!
                                                  .data![index]!.inWishlist!,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      : EmptyWidgets(
                          image: Assets.noItems,
                          title: "No products found",
                          description: "Check out what's trending",
                        );
                } else {
                  return EmptyWidgets(
                    image: Assets.noItems,
                    title: "No products found",
                    description: "Check out what's trending",
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
