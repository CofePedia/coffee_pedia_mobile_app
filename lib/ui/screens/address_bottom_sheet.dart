import 'package:coffepedia/ui/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressSheet extends StatefulWidget {
  const AddAddressSheet({Key? key}) : super(key: key);

  @override
  State<AddAddressSheet> createState() => _AddAddressSheetState();
}

class _AddAddressSheetState extends State<AddAddressSheet> {
  TextEditingController _email = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _governorate = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _area = TextEditingController();
  TextEditingController _street = TextEditingController();
  TextEditingController _desc = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _phone.dispose();
    _governorate.dispose();
    _city.dispose();
    _area.dispose();
    _street.dispose();
    _desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 649.h,
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
                        style: Theme.of(context).textTheme.headline2!.copyWith(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12.sp,
                                  ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hintText: 'First Name',
                          width: 168.w,
                          suffix: SizedBox.shrink(),
                          keyboardType: TextInputType.name,
                          height: 40.h,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextFormField(
                          hintText: 'Last Name',
                          width: 168.w,
                          suffix: SizedBox.shrink(),
                          keyboardType: TextInputType.name,
                          height: 40.h,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Text(
                    'Email',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: CustomTextFormField(
                    hintText: 'Email Address',
                    width: 345.w,
                    suffix: SizedBox.shrink(),
                    keyboardType: TextInputType.emailAddress,
                    height: 40.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Text(
                    'Phone',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 12.h),
                  child: CustomTextFormField(
                    hintText: 'Phone Number',
                    width: 345.w,
                    suffix: SizedBox.shrink(),
                    keyboardType: TextInputType.phone,
                    height: 40.h,
                  ),
                ),
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
                          child: DropdownButton(
                            items: [],
                            onTap: () {},
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
                          child: DropdownButton(
                            items: [],
                            onTap: () {},
                            isExpanded: true,
                            icon: Icon(
                              Icons.expand_more,
                              size: 20.h,
                              color: Color(0xffCCCCCC),
                            ),
                            hint: Text(
                              'Area',
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
                          child: DropdownButton(
                            items: [],
                            onTap: () {},
                            isExpanded: true,
                            icon: Icon(
                              Icons.expand_more,
                              size: 20.h,
                              color: Color(0xffCCCCCC),
                            ),
                            hint: Text(
                              'City',
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
                          child: DropdownButton(
                            items: [],
                            onTap: () {},
                            isExpanded: true,
                            icon: Icon(
                              Icons.expand_more,
                              size: 20.h,
                              color: Color(0xffCCCCCC),
                            ),
                            hint: Text(
                              'Street',
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
                    controller: _desc,
                    keyboardType: TextInputType.multiline,
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
              onPressed: () {},
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
    );
  }
}
