import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/add_address.dart';
import 'package:coffepedia/data/models/areas.dart';
import 'package:coffepedia/data/models/cities.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/governorates.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class AddressWebServices {
  final userDao = UserDao();

  Future<Governorates> getGovernorates() async {
    final url = Uri.parse(baseUrl + 'governorates');
    final http.Response response = await http.get(
      url,
    );
    print("response governorates ${response.body}");

    if (response.statusCode == 200) {
      return Governorates.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response exception governorates ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<Cities> getCities(int governorateId) async {
    final url = Uri.parse(baseUrl + 'cities/$governorateId');

    final http.Response response = await http.get(
      url,
    );
    print("response cities ${response.body}");

    if (response.statusCode == 200) {
      return Cities.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response exception cities ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<Areas> getAreas(int cityId) async {
    final url = Uri.parse(baseUrl + 'areas/$cityId');
    final http.Response response = await http.get(
      url,
    );
    print("response areas ${response.body}");

    if (response.statusCode == 200) {
      return Areas.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response exception areas ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<AddAddress> getAddAddress(
    String governorateId,
    String cityId,
    String areaId,
    String street,
    String details,
  ) async {
    final url = Uri.parse(baseUrl + 'addAddress');
    GetTokenDatabase? token = await userDao.getUserToken();

    print("token = " + token!.getToken!);

    final http.Response response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ' + token.getToken!},
      body: {
        'governorate_id': governorateId,
        'city_id': cityId,
        'area_id': areaId,
        'street': street,
        'details': details,
      },
    );
    print("response addAddress ${response.body}");

    if (response.statusCode == 200) {
      return AddAddress.fromJson(
        json.decode(response.body),
      );
    } else {
      print(json.decode(response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
