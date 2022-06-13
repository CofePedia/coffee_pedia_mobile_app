import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        height: 80.h,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          itemBuilder: (context, index) {
            return Container(
              width: 150.w,
              height: 84.h,
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  7.r,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FeaturedProductsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        height: 262.h,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Container(
                  height: 262.h,
                  width: 214.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      7.r,
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class SecondSliderShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          Container(
            height: 90.h,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}

class FirstSliderShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        height: 170.h,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Container(
                height: 170.h,
                width: 343.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0.r),
                    color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BrandsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        height: 90.h,
        child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              color: Colors.white,
              height: 90.h,
              width: 110.w,
            );
          },
        ),
      ),
    );
  }
}

class AdsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 2,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 24.h, right: 15.w, left: 15.w),
              height: 205.h,
              width: 344.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0.r),
                  color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}

class RecentProductsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 187.h,
        child: ListView.builder(
          itemCount: 5,
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Container(
                height: 187.h,
                width: 214.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    7.r,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CategoryProductsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140.h,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24.h),
              width: MediaQuery.of(context).size.width,
              height: 80.h,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Container(
                        height: 80.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            7.r,
                          ),
                        ),
                      ));
                },
              ),
            ),
            Container(
              height: 20.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0.r),
                  color: Colors.white),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 28.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 150.w / 280.h,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0.r),
                        color: Colors.white,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandProductsShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 28.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 150.w / 280.h,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: EdgeInsets.only(top: 16.h),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0.r),
                        color: Colors.white,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SellerInfoShimmerWidget extends StatelessWidget {
  const SellerInfoShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: CircleAvatar(
                    radius: 40.sp,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0.r),
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Container(
                      height: 20.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0.r),
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 14.74.h,
                    ),
                    Container(
                      // width: 100.w,
                      height: 28.h,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Container(
                            width: 100.w,
                            height: 28.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 3.h, horizontal: 12.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(
                                0xffE9E7E7,
                              ),
                              borderRadius: BorderRadius.circular(17.5.r),
                            ),
                          ),
                        ),
                        itemCount: 2,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
