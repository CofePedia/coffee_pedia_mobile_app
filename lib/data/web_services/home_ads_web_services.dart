import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/home_ads.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../models/home_sliders.dart';

class HomeAdsWebServices {
  Future<HomeAds> getHomeAds() async {
    final url = Uri.parse(baseUrl + 'homeAds');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response ${response.body}");

    if (response.statusCode == 200) {
      return HomeAds.fromJson(
        json.decode(response.body),
      );
    } else {
      print('response exception ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<HomeSliders> getHomeSliders() async {
    final url = Uri.parse(baseUrl + 'homeSliders');
    final http.Response response = await http.get(
      url,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print("response HomeSliders ${response.body}");

    if (response.statusCode == 200) {
      return HomeSliders.fromJson(
        json.decode(response.body),
      );
    } else {
      print('exception HomeSliders ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
