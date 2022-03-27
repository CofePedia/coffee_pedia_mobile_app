import 'package:coffepedia/business_logic/vendor/vendor_cubit.dart';
import 'package:coffepedia/constants/colors.dart';
import 'package:coffepedia/data/repository/vendor_repository.dart';
import 'package:coffepedia/data/web_services/vendor_web_services.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerDetailsWidget extends StatelessWidget {
  final int vendorId;

  const SellerDetailsWidget({required this.vendorId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VendorCubit(
        VendorRepository(
          VendorWebServices(),
        ),
      ),
      child: SellerDetails(
        vendorId: vendorId,
      ),
    );
  }
}

class SellerDetails extends StatefulWidget {
  final int vendorId;
  const SellerDetails({required this.vendorId, Key? key}) : super(key: key);

  @override
  State<SellerDetails> createState() => _SellerDetailsState();
}

class _SellerDetailsState extends State<SellerDetails> {
  @override
  void initState() {
    BlocProvider.of<VendorCubit>(context).getVendorDetails(widget.vendorId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VendorCubit, VendorState>(
      builder: (context, state) {
        if (state is VendorDetailsIsLoaded) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: CircleAvatar(
                      radius: 40.sp,
                      foregroundImage:
                          NetworkImage(state.vendorDetails!.data!.logo!),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.vendorDetails!.data!.companyName ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.room,
                            size: 16.h,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(state.vendorDetails!.data!.map ?? ''),
                        ],
                      ),
                      // SizedBox(
                      //   height: 6.h,
                      // ),
                      // RatingBarComponent(
                      //   rate: 4,
                      // ),
                      SizedBox(
                        height: 14.74.h,
                      ),
                      Container(
                        // width: 100,
                        height: 28.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.h, horizontal: 12.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(
                                  0xffE9E7E7,
                                ),
                                borderRadius: BorderRadius.circular(17.5.r),
                              ),
                              child: Text(
                                state.vendorDetails!.data!.feature![index]!,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                          itemCount: state.vendorDetails!.data!.feature!.length,
                        ),
                      ),
                      // SizedBox(
                      //   height: 12.h,
                      // ),
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons.done,
                      //       color: Color(0xff14B93B),
                      //       size: 15.h,
                      //     ),
                      //     SizedBox(
                      //       width: 3.w,
                      //     ),
                      //     Text('Delivery'),
                      //     SizedBox(
                      //       width: 10.w,
                      //     ),
                      //     Icon(
                      //       Icons.done,
                      //       color: Color(0xff14B93B),
                      //       size: 15.h,
                      //     ),
                      //     SizedBox(
                      //       width: 3.w,
                      //     ),
                      //     Text('Outdoor dinning'),
                      //   ],
                      // )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(
                // height: 2.h,
                thickness: 5.h, color: kGrey6,
              ),
            ],
          );
        } else {
          return SellerInfoShimmerWidget();
        }
      },
    );
  }
}
