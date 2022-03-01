import 'package:coffepedia/business_logic/address/address_cubit.dart';
import 'package:coffepedia/data/models/my_addresses.dart';
import 'package:coffepedia/data/repository/address_repository.dart';
import 'package:coffepedia/data/web_services/address_web_services.dart';
import 'package:coffepedia/ui/screens/address_book%D9%8D_screen.dart';
import 'package:coffepedia/ui/screens/check_internet_connection.dart';
import 'package:coffepedia/ui/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';
import '../area_address_widget.dart';
import '../city_address_widget.dart';

class AddAddressSheetProvider extends StatelessWidget {
  final Widget addressPath;
  final MyAddressesData? address;
  AddAddressSheetProvider({required this.addressPath, this.address, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(
        AddressRepository(
          AddressWebServices(),
        ),
      ),
      child: AddAddressSheet(
        addressPath: addressPath,
        address: address,
      ),
    );
  }
}

class AddAddressSheet extends StatefulWidget {
  final Widget addressPath;
  final MyAddressesData? address;

  const AddAddressSheet({required this.addressPath, this.address, Key? key})
      : super(key: key);

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
  TextEditingController _name = TextEditingController();

  int? _selectedGovernorate;
  int _governorateId = 0;

  int? _selectedCity;
  int? _cityId = 0;
  int? _selectedArea;

  @override
  void initState() {
    BlocProvider.of<AddressCubit>(context).getGovernorate();

    if (widget.address != null) {
      if (_details.text.isEmpty) _details.text = widget.address!.details!;
      if (_street.text.isEmpty) _street.text = widget.address!.street!;
      if (_name.text.isEmpty) _name.text = widget.address!.name!;

      _selectedGovernorate = widget.address!.governorateId!;
      _selectedCity = widget.address!.cityId!;
      _selectedArea = widget.address!.areaId!;
      _governorateId = _selectedGovernorate!;
      _cityId = _selectedCity;
    }

    print("_selectedCity $_selectedCity");
    print('_selectedArea $_selectedArea');

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
    _name.dispose();
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
    return CheckInternetConnection(
        screen: BlocListener<AddressCubit, AddressState>(
          listener: (context, state) {
            if (state is AddAddressIsPressed) {
              // Navigator.of(context).pop(hasData = true);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => widget.addressPath),
              );

              // Navigator.(
              //     context, AddressBookScreenProvider.routeName);
              // Navigator.pushNamedAndRemoveUntil(
              //     context, AddressBookScreenProvider.routeName, (route) => true);
              // Navigator.restorablePopAndPushNamed(
              //     context, AddressBookScreenProvider.routeName);
            } else if (state is UpdateAddressIsPressed) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddressBookScreenProvider(),
                ),
              );
            }
          },
          child: Container(
            height: 550.h,
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
                              translator.translate("address.close"),
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
                        widget.address != null ? translator.translate("address.edit_address") : translator.translate("address.new_address"),
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
                      Text(
                        translator.translate("address.name"),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
                        child: CustomTextFormField(
                          hintText: translator.translate("address.name"),
                          width: 345.w,
                          suffix: null,
                          keyboardType: TextInputType.text,
                          height: 40.h,
                          textEditingController: _name,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                translator.translate("address.governorate"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
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
                                child: BlocBuilder<AddressCubit, AddressState>(
                                  builder: (context, state) {
                                    if (state is GovernorateLoaded) {
                                      return DropdownButton<int>(
                                        underline: SizedBox(),
                                        isDense: true,
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
                                          translator.translate("address.governorate"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                            color: Color(
                                              0xffCCCCCC,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return DropdownButton<int>(
                                        isDense: true,
                                        onChanged: (value) {},
                                        items: [],
                                        isExpanded: true,
                                        icon: Icon(
                                          Icons.expand_more,
                                          size: 20.h,
                                          color: Color(0xffCCCCCC),
                                        ),
                                        hint: Text(
                                          translator.translate("address.governorate"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                            color: Color(
                                              0xffCCCCCC,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                translator.translate("address.area"),
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
                                translator.translate("address.city"),
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
                                translator.translate("address.street"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomTextFormField(
                                hintText: translator.translate("address.street"),
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
                          translator.translate("address.address_details"),
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
                    onPressed: _selectedGovernorate == null ||
                        _selectedArea == null ||
                        _selectedCity == null ||
                        _street.text.isEmpty ||
                        _name.text.isEmpty
                        ? null
                        : () {
                      widget.address != null
                          ? BlocProvider.of<AddressCubit>(context)
                          .postUpdateAddress(
                          name: _name.text,
                          governorateId:
                          _selectedGovernorate.toString(),
                          cityId: _selectedCity.toString(),
                          areaId: _selectedArea.toString(),
                          street: _street.text,
                          details: _details.text,
                          addressId: widget.address!.id.toString(),
                          primary: widget.address!.primary.toString())
                          : BlocProvider.of<AddressCubit>(context)
                          .getAddAddress(
                        _selectedGovernorate.toString(),
                        _selectedCity.toString(),
                        _name.text,
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
                      widget.address != null ? translator.translate("address.edit_address") : translator.translate("address.add_address"),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
