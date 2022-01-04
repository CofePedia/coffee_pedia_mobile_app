import 'package:coffepedia/business_logic/address/address_cubit.dart';
import 'package:coffepedia/data/repository/address_repository.dart';
import 'package:coffepedia/data/web_services/address_web_services.dart';
import 'package:coffepedia/ui/delivery_info_screen.dart';
import 'package:coffepedia/ui/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../area_address_widget.dart';
import '../city_address_widget.dart';

class AddAddressSheetProvider extends StatelessWidget {
  const AddAddressSheetProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(
        AddressRepository(
          AddressWebServices(),
        ),
      ),
      child: AddAddressSheet(),
    );
  }
}

class AddAddressSheet extends StatefulWidget {
  const AddAddressSheet({Key? key}) : super(key: key);

  @override
  State<AddAddressSheet> createState() => _AddAddressSheetState();
}

class _AddAddressSheetState extends State<AddAddressSheet> {
  // TextEditingController _email = TextEditingController();
  // TextEditingController _firstName = TextEditingController();
  // TextEditingController _lastName = TextEditingController();
  // TextEditingController _phone = TextEditingController();
  TextEditingController _details = TextEditingController();
  TextEditingController _street = TextEditingController();

  int? _selectedGovernorate;
  int _governorateId = 0;

  int? _selectedCity;
  int? _cityId = 0;
  int? _selectedArea;

  @override
  void initState() {
    BlocProvider.of<AddressCubit>(context).getGovernorate();
    super.initState();
  }

  @override
  void dispose() {
    // _email.dispose();
    // _firstName.dispose();
    // _lastName.dispose();
    // _phone.dispose();
    _street.dispose();
    _details.dispose();
    super.dispose();
  }

  void onSelectedGovernorate(int value) {
    setState(() {
      _selectedCity = value;
      _cityId = _selectedCity;
      _selectedArea = null;
    });
  }

  void onSelectedCity(int value) {
    setState(() {
      _selectedArea = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is AddAddressIsPressed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => DeliveryInfoScreen(),
            ),
          );
        }
      },
      child: Container(
        height: 450.h,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          "Close",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Color(0xff241F20),
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "New Address",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'First Name',
                  //           style:
                  //               Theme.of(context).textTheme.headline3!.copyWith(
                  //                     fontSize: 12.sp,
                  //                   ),
                  //         ),
                  //         SizedBox(
                  //           height: 8.h,
                  //         ),
                  //         CustomTextFormField(
                  //           hintText: 'First Name',
                  //           width: 168.w,
                  //           suffix: null,
                  //           keyboardType: TextInputType.name,
                  //           height: 40.h,
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'Last Name',
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .headline3!
                  //               .copyWith(fontSize: 12.sp),
                  //         ),
                  //         SizedBox(
                  //           height: 8.h,
                  //         ),
                  //         CustomTextFormField(
                  //           hintText: 'Last Name',
                  //           width: 168.w,
                  //           suffix: null,
                  //           keyboardType: TextInputType.name,
                  //           height: 40.h,
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 12.h),
                  //   child: Text(
                  //     'Email',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .headline3!
                  //         .copyWith(fontSize: 12.sp),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 8.h),
                  //   child: CustomTextFormField(
                  //     hintText: 'Email Address',
                  //     width: 345.w,
                  //     suffix: null,
                  //     keyboardType: TextInputType.emailAddress,
                  //     height: 40.h,
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 12.h),
                  //   child: Text(
                  //     'Phone',
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .headline3!
                  //         .copyWith(fontSize: 12.sp),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
                  //   child: CustomTextFormField(
                  //     hintText: 'Phone Number',
                  //     width: 345.w,
                  //     suffix: null,
                  //     keyboardType: TextInputType.phone,
                  //     height: 40.h,
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Governorate',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          BlocBuilder<AddressCubit, AddressState>(
                            builder: (context, state) {
                              if (state is GovernorateLoaded) {
                                return Container(
                                  height: 40.h,
                                  width: 168.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 9.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.r),
                                    border: Border.all(
                                      color: Color(0xffE3E3E3),
                                    ),
                                  ),
                                  child: DropdownButton<int>(
                                    value: _selectedGovernorate,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGovernorate = value;
                                        _governorateId = _selectedGovernorate!;
                                        _cityId = 0;
                                        _selectedCity = null;
                                        _selectedArea = null;
                                      });
                                    },
                                    items: List.generate(
                                      state.governorates!.data!.length,
                                      (index) => DropdownMenuItem(
                                        child: Text(
                                          state.governorates!.data![index]!
                                              .name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(fontSize: 14.sp),
                                        ),
                                        value: state
                                            .governorates!.data![index]!.id!,
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.expand_more,
                                      size: 20.h,
                                      color: Color(0xffCCCCCC),
                                    ),
                                    hint: Text(
                                      'Governorate',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
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
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'Area',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          AreaAddressProvider(
                            cityId: _cityId,
                            onSelectedCity: onSelectedCity,
                            selectedArea: _selectedArea,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CityAddressProvider(
                            governorateId: _governorateId,
                            onChange: onSelectedGovernorate,
                            selectedCity: _selectedCity,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'Street',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 12.sp),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CustomTextFormField(
                            hintText: 'Street',
                            width: 168.w,
                            suffix: null,
                            keyboardType: TextInputType.text,
                            textEditingController: _street,
                            height: 40.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Text(
                      "Address Details",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Color(0xff8A8A8A),
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Container(
                    height: 93.h,
                    child: TextFormField(
                      maxLines: 7,
                      controller: _details,
                      keyboardType: TextInputType.multiline,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14.sp),
                      decoration: InputDecoration(
                        hintStyle:
                            Theme.of(context).textTheme.headline2!.copyWith(
                                  color: const Color(0xffCCCCCC),
                                ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.w),
                          borderSide: BorderSide(
                            color: Color(0xffE3E3E3),
                            width: 1.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.w),
                          borderSide: BorderSide(
                            color: Color(0xffE3E3E3),
                            width: 1.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 107.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 28.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(22.r),
                  topLeft: Radius.circular(22.r),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6.r,
                    color: Color.fromARGB(4, 0, 0, 0),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: _selectedGovernorate == 0 ||
                        _selectedArea == 0 ||
                        _selectedArea == 0 ||
                        _street.text.isEmpty
                    ? null
                    : () {
                        BlocProvider.of<AddressCubit>(context).getAddAddress(
                          _selectedGovernorate.toString(),
                          _selectedCity.toString(),
                          _selectedArea.toString(),
                          _street.text,
                          _details.text,
                        );
                      },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                ),
                child: Text(
                  "Add Address",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
