import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../custom_input.dart';
import 'custom_drop_down.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    SizedBox(
                      width: 168.w,
                      child: CustomInput(
                        title: 'First Name',
                        hint: "First Name",
                        textEditingController: _firstName,
                        padding: false,
                      ),
                    ),
                    SizedBox(
                      width: 168.w,
                      child: CustomInput(
                        title: 'Last Name',
                        hint: "Last Name",
                        textEditingController: _lastName,
                        padding: false,
                      ),
                    )
                  ],
                ),
                CustomInput(
                  title: 'Email',
                  hint: "Email Address",
                  textEditingController: _email,
                  padding: false,
                ),
                CustomInput(
                  title: 'Phone',
                  hint: "Phone Number",
                  textEditingController: _phone,
                  padding: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownTextField(
                      hint: "Governorate",
                      title: "Governorate",
                    ),
                    CustomDropDownTextField(
                      hint: "City",
                      title: "City",
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomDropDownTextField(
                      hint: "Area",
                      title: "Area",
                    ),
                    CustomDropDownTextField(
                      hint: "Street",
                      title: "Street",
                    ),
                  ],
                ),
                Text(
                  "Address Details",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Color(0xff8A8A8A),
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
                      hintStyle: Theme.of(context).textTheme.headline2!.copyWith(
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
