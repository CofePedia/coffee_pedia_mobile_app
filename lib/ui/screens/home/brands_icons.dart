import 'package:coffepedia/business_logic/brands/brands_cubit.dart';
import 'package:coffepedia/data/repository/brands_repository.dart';
import 'package:coffepedia/data/web_services/brands_web_services.dart';
import 'package:coffepedia/ui/screens/brand_products_screen.dart';
import 'package:coffepedia/ui/shared/custom_network_image.dart';
import 'package:coffepedia/ui/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsProvider extends StatelessWidget {
  const BrandsProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandsCubit(BrandsRepository(BrandsWebServices())),
      child: BrandsIcons(),
    );
  }
}

class BrandsIcons extends StatefulWidget {
  const BrandsIcons({
    Key? key,
  }) : super(key: key);

  @override
  State<BrandsIcons> createState() => _BrandsIconsState();
}

class _BrandsIconsState extends State<BrandsIcons> {
  @override
  void initState() {
    BlocProvider.of<BrandsCubit>(context).getBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsCubit, BrandsState>(
      builder: (context, state) {
        if (state is BrandsLoaded) {
          return Container(
            margin: EdgeInsets.only(bottom: 24.h),
            width: MediaQuery.of(context).size.width,
            height: 90.h,
            child: ListView.builder(
              itemCount: state.brands!.data!.data!.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BrandProductsProvider(
                          brandName: state.brands!.data!.data![index]!.name!,
                          brandId: state.brands!.data!.data![index]!.id!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.w),
                    child: CustomNetworkImage(
                      imageUrl: state.brands!.data!.data![index]!.logo!,
                      width: 80.w,
                      height: 30.h,
                      fit: BoxFit.contain,
                      radius: 2.h,
                    ),
                    // child: Image.network(
                    //   state.brands!.data!.data![index]!.logo!,
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                );
              },
            ),
          );
        } else {
          return BrandsShimmerWidget();
        }
      },
    );
  }
}
