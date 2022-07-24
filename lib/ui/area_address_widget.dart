// import 'package:coffepedia/business_logic/address/address_cubit.dart';
// import 'package:coffepedia/data/repository/address_repository.dart';
// import 'package:coffepedia/data/web_services/address_web_services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../main.dart';
//
// class AreaAddressProvider extends StatelessWidget {
//   final int? cityId;
//   final Function? onSelectedCity;
//   final int? selectedArea;
//
//   const AreaAddressProvider(
//       {this.cityId, this.onSelectedCity, this.selectedArea, Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddressCubit(
//         AddressRepository(
//           AddressWebServices(),
//         ),
//       ),
//       child: AreaAddress(
//         cityId: cityId,
//         onSelectedCity: onSelectedCity,
//         selectedArea: selectedArea,
//       ),
//     );
//   }
// }
//
// class AreaAddress extends StatefulWidget {
//   final int? cityId;
//   final Function? onSelectedCity;
//   final int? selectedArea;
//
//   const AreaAddress(
//       {this.cityId, this.onSelectedCity, this.selectedArea, Key? key})
//       : super(key: key);
//
//   @override
//   _AreaAddressState createState() => _AreaAddressState();
// }
//
// class _AreaAddressState extends State<AreaAddress> {
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<AddressCubit>(context).getAreas(widget.cityId!);
//
//     return Container(
//       height: 40.h,
//       width: 168.w,
//       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(3.r),
//         border: Border.all(
//           color: Color(0xffE3E3E3),
//         ),
//       ),
//       child: BlocBuilder<AddressCubit, AddressState>(
//         builder: (context, state) {
//           if (state is AreasLoaded) {
//             return DropdownButton<int>(
//               value: widget.selectedArea,
//               underline: SizedBox(),
//               isDense: true,
//               items: state.areas!.data!.isEmpty
//                   ? []
//                   : List.generate(
//                       state.areas!.data!.length,
//                       (index) => DropdownMenuItem(
//                         child: Text(
//                           state.areas!.data![index]!.name!,
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText1!
//                               .copyWith(fontSize: 14.sp),
//                         ),
//                         value: state.areas!.data![index]!.id!,
//                       ),
//                     ),
//               isExpanded: true,
//               onChanged: (value) => widget.onSelectedCity!(value),
//               icon: Icon(
//                 Icons.expand_more,
//                 size: 20.h,
//                 color: Color(0xffCCCCCC),
//               ),
//               hint: Text(
//                 translator.translate("address.area"),
//                 style: Theme.of(context).textTheme.headline6!.copyWith(
//                       color: Color(
//                         0xffCCCCCC,
//                       ),
//                     ),
//               ),
//             );
//           } else {
//             return DropdownButton<int>(
//               isDense: true,
//               items: [],
//               isExpanded: true,
//               onChanged: (value) {},
//               icon: Icon(
//                 Icons.expand_more,
//                 size: 20.h,
//                 color: Color(0xffCCCCCC),
//               ),
//               hint: Text(
//                 translator.translate("address.area"),
//                 style: Theme.of(context).textTheme.headline6!.copyWith(
//                       color: Color(
//                         0xffCCCCCC,
//                       ),
//                     ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
