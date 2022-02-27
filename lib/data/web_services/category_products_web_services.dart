import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/category_products.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class CategoryProductsWebServices {
  final userDao = UserDao();

  Future<CategoryProducts> getCategoryProducts({
    int? vendorId,
    int? limit,
    int? page,
    int? subCategoryId,
    int? categoryId,
    Map<String, List<String?>>? multiMap,
    Map<String, String?>? rangeMap,
    Map<String, String?>? singleMap,
  }) async {
    final Map<String, dynamic> queryParameters = {
      // 'category': categoryId.toString(),
    };

    if (multiMap!.isNotEmpty) {
      queryParameters.addAll(multiMap);
    }
    if (rangeMap!.isNotEmpty) {
      queryParameters.addAll(rangeMap);
    }
    if (singleMap!.isNotEmpty) {
      queryParameters.addAll(singleMap);
    }
    if (categoryId != -1) {
      queryParameters.addAll({
        'category': categoryId.toString(),
      });
    }
    if (subCategoryId != -1) {
      queryParameters.addAll({
        'subCategory': subCategoryId.toString(),
      });
    }
    if (vendorId != -1) {
      queryParameters.addAll({
        'vendor': vendorId.toString(),
      });
    }

    if (page != null) {
      queryParameters.addAll({
        'page': page.toString(),
      });
    }
    if (limit != null) {
      queryParameters.addAll({
        'limit': limit.toString(),
      });
    }

    final uri = Uri.https(getBaseUrl, '/products', queryParameters);
    print('queryParameters $queryParameters');
    GetTokenDatabase? token = await userDao.getUserToken();
    //print("token product " + token!.getToken!);

    final http.Response response = await http.get(
      uri,
      // TODO: Check token again if needed
      // headers: {'Authorization': 'Bearer ' + token!.getToken!},
    );
    print("response categoryProducts ${response.body}");
    if (response.statusCode == 200) {
      return CategoryProducts.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response category product exception ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  // Future<VendorDetails> getVendorDetails(int vendorId) async {
  //   final url = Uri.parse(baseUrl + '/vendor_details/$vendorId');
  //
  //   final http.Response response = await http.get(
  //     url,
  //   );
  //   print("response vendor details ${response.body}");
  //
  //   if (response.statusCode == 200) {
  //     return VendorDetails.fromJson(
  //       json.decode(response.body),
  //     );
  //   } else {
  //     print("vendor details error = " + (response.body).toString());
  //     throw Exception(
  //       json.decode(response.body),
  //     );
  //   }
  // }
}
