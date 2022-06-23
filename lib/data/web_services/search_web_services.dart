import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/search.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class SearchWebServices {
  Future<Search> getSearch(String query) async {
    final url = Uri.parse(baseUrl + '/search?query=$query');

    final http.Response response = await http.get(
      url,
      headers: {
        // "query": query,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );
    print('amreasfj $query');
    print("response Search  ${response.body}");

    if (response.statusCode == 200) {
      return Search.fromJson(
        json.decode(response.body),
      );
    } else {
      print("vendor Search error = " + (response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
