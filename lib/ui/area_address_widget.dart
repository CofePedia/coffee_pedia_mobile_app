import 'package:coffepedia/business_logic/address/address_cubit.dart';
import 'package:coffepedia/data/repository/address_repository.dart';
import 'package:coffepedia/data/web_services/address_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AreaAddressProvider extends StatelessWidget {
  final int? cityId;
  const AreaAddressProvider({this.cityId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(
        AddressRepository(
          AddressWebServices(),
        ),
      ),
      child: AreaAddress(
        cityId: cityId,
      ),
    );
  }
}

class AreaAddress extends StatefulWidget {
  final int? cityId;
  const AreaAddress({this.cityId, Key? key}) : super(key: key);

  @override
  _AreaAddressState createState() => _AreaAddressState();
}

class _AreaAddressState extends State<AreaAddress> {
  String? _selectedArea;

  @override
  void initState() {
    BlocProvider.of<AddressCubit>(context).getAreas(widget.cityId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AreasLoaded) {
          return Container(
            height: 40.h,
            width: 168.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              border: Border.all(
                color: Color(0xffE3E3E3),
              ),
            ),
            child: DropdownButton<String>(
              value: _selectedArea,
              items: List.generate(
                state.areas!.data!.length,
                (index) => DropdownMenuItem(
                  child: Text(
                    state.areas!.data![index]!.name!,
                  ),
                  value: state.areas!.data![index]!.name!,
                ),
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedArea = value;
                });
              },
              icon: Icon(
                Icons.expand_more,
                size: 20.h,
                color: Color(0xffCCCCCC),
              ),
              hint: Text(
                'Area',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Color(
                        0xffCCCCCC,
                      ),
                    ),
              ),
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
