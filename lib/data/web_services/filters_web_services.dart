import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/flavors.dart';
import 'package:coffepedia/data/models/regions.dart';
import 'package:coffepedia/data/models/roasts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class FiltersWebServices {
  Future<Regions> getRegions() async {
    final url = Uri.parse(baseUrl + 'regions');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response regions ${response.body}");

    if (response.statusCode == 200) {
      return Regions.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response exception regions ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<Roasts> getRoasts() async {
    final url = Uri.parse(baseUrl + 'roasts');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response Roasts ${response.body}");

    if (response.statusCode == 200) {
      return Roasts.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response exception Roasts ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<Flavors> getFlavors() async {
    final url = Uri.parse(baseUrl + 'flavors');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response flavors ${response.body}");

    if (response.statusCode == 200) {
      return Flavors.fromJson(
        json.decode(response.body),
      );
    } else {
      print(
          'response exception flavors ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
