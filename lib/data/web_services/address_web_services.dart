import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/areas.dart';
import 'package:coffepedia/data/models/cities.dart';
import 'package:coffepedia/data/models/governorates.dart';
import 'package:http/http.dart' as http;

class AddressWebServices {
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
}
