import 'package:coffepedia/business_logic/address/address_cubit.dart';
import 'package:coffepedia/data/repository/address_repository.dart';
import 'package:coffepedia/data/web_services/address_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityAddressProvider extends StatelessWidget {
  final int? governorateId;

  const CityAddressProvider({this.governorateId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddressCubit(AddressRepository(AddressWebServices())),
      child: CityAddress(
        governorateId: governorateId!,
      ),
    );
  }
}

class CityAddress extends StatefulWidget {
  final int? governorateId;

  const CityAddress({this.governorateId, Key? key}) : super(key: key);

  @override
  _CityAddressState createState() => _CityAddressState();
}

class _CityAddressState extends State<CityAddress> {
  int? _selectedCity;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddressCubit>(context).getCities(widget.governorateId!);
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is CitiesLoaded) {
          print('state.cities!.data ${state.cities!.data}');
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
            child: state.cities!.data!.isEmpty
                ? DropdownButton<String>(
                    items: [],
                    isExpanded: true,
                    onChanged: null,
                    icon: Icon(
                      Icons.expand_more,
                      size: 20.h,
                      color: Color(0xffCCCCCC),
                    ),
                    hint: Text(
                      'City',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Color(
                              0xffCCCCCC,
                            ),
                          ),
                    ),
                  )
                : DropdownButton<int>(
                    value: _selectedCity,
                    items: List.generate(
                      state.cities!.data!.length,
                      (index) => DropdownMenuItem(
                        child: Text(
                          state.cities!.data![index]!.name!,
                        ),
                        value: state.cities!.data![index]!.id!,
                      ),
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value;
                      });
                    },
                    icon: Icon(
                      Icons.expand_more,
                      size: 20.h,
                      color: Color(0xffCCCCCC),
                    ),
                    hint: Text(
                      'City',
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
