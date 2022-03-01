import 'package:coffepedia/business_logic/search/search_cubit.dart';
import 'package:coffepedia/data/repository/search_repository.dart';
import 'package:coffepedia/data/web_services/search_web_services.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarProvider extends StatelessWidget {
  final double? width;

  const SearchBarProvider({this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        SearchRepository(
          SearchWebServices(),
        ),
      ),
      child: SearchBar(
        width: width!,
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: widget.width,
      child: TextField(
        controller: _searchTextController,
        onChanged: (searchedProduct) {
          EasyDebounce.debounce('search-key', Duration(seconds: 1), () {
            BlocProvider.of<SearchCubit>(context).getSearch(searchedProduct);
          });
          print('searchedProduct $searchedProduct');
        },
        decoration: InputDecoration(
          hintText: 'Search Coffepedia',
          contentPadding: EdgeInsets.all(8.h),
          border: InputBorder.none,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {});
              _searchTextController.clear();
            },
            child: Icon(Icons.close),
          ),
          prefixIcon: SvgPicture.asset(
            Assets.iconsSearch,
            fit: BoxFit.none,
          ),
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Colors.black54,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        border: Border.all(
          color: Colors.black12,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.23),
            blurRadius: 11.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
