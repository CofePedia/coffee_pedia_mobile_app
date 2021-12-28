import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/most_recent_products.dart';
import 'package:http/http.dart' as http;

class MostRecentWebServices {
  Future<MostRecent> getMostRecent() async {
    final url = Uri.parse(baseUrl + 'products/mostRecent');
    final http.Response response = await http.get(
      url,
    );
    print("response ${response.body}");

    if (response.statusCode == 200) {
      return MostRecent.fromJson(
        json.decode(response.body),
      );
    } else {
      print('response exception ${json.decode(response.body).toString()}');
      throw Exception(
        json.decode(response.body),
      );
    }
  }
}
