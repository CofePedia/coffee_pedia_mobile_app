import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/business_logic/wishlist/wishlist_cubit.dart';
import 'package:coffepedia/data/repository/wishlist_repository.dart';
import 'package:coffepedia/data/web_services/wishlist_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WishlistScreenProvider extends StatelessWidget {
  const WishlistScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit(
        WishlistRepository(
          WishlistWebServices(),
        ),
      ),
      child: WishlistScreen(),
    );
  }
}

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool _isFavorite = true;
  //
  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // void toggleWishlistIcon(
  //   String productId,
  // ) {
  //   setState(() {
  //     BlocProvider.of<WishlistCubit>(context)
  //         .getToggleProductsInWishlist(productId);
  //     _isFavorite = !_isFavorite;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WishlistCubit>(context).getWishlist();

    return BlocListener<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is ToggleProductsInWishlistIsLoaded) {
          BotToast.showText(text: state.toggleProductsInWishlist!.data!.msg!);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 23.w, top: 60.h, right: 23.w, bottom: 35.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.chevron_left,
                          size: 24.w,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'My wishlist',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 18.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<WishlistCubit, WishlistState>(
                  builder: (context, state) {
                    if (state is WishlistIsLoaded) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 24.h,
                            crossAxisSpacing: 15.5.w,
                            childAspectRatio: 164.5.w / 293.h,
                            // mainAxisExtent: 5,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.wishlist!.data!.length,
                          itemBuilder: (context, index) {
                            final item = state.wishlist!.data![index]!;
                            return Stack(
                              fit: StackFit.loose,
                              children: [
                                Positioned(
                                  top: 13.h,
                                  child: Container(
                                    height: 280.h,
                                    width: 164.5.w,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(12, 0, 0, 0),
                                          blurRadius: 12.r,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        11.r,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0.1.w,
                                  child: Image.network(
                                    item.image!,
                                    width: 82.6.w,
                                    height: 118.h,
                                  ),
                                ),
                                item.rate == 0
                                    ? SizedBox.shrink()
                                    : Positioned(
                                        top: 29.h,
                                        left: 12.w,
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                Assets.iconsStarActive),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              item.rate!.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                Positioned(
                                  top: 171.h,
                                  left: 12.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 135.w,
                                        height: 54.h,
                                        child: Text(
                                          item.name!,
                                          maxLines: 3,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                fontSize: 14.sp,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32.h,
                                      ),
                                      Text(
                                        'EGP ${item.price!}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 13.5.w,
                                  bottom: 16.h,
                                  child: Container(
                                    height: 38.h,
                                    width: 38.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(25.r),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.12),
                                          offset: Offset(0, 2),
                                          blurRadius: 11.sp,
                                        )
                                      ],
                                    ),
                                    // child: WishlistIconWidget(
                                    //   isFavorite:
                                    //       state.wishlist!.data![index]!.like!,
                                    //   productId: state
                                    //       .wishlist!.data![index]!.id!
                                    //       .toString(),
                                    // ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          BlocProvider.of<WishlistCubit>(
                                                  context)
                                              .getToggleProductsInWishlist(
                                            state.wishlist!.data![index]!.id!
                                                .toString(),
                                          );
                                          _isFavorite = state.wishlist!
                                              .data![index]!.inWishlist!;
                                        });
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        size: 28.h,
                                        color: _isFavorite
                                            ? Color(0xffE02020)
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
