import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/update_profile.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class UpdateProfileWebServices {
  final userDao = UserDao();

  Future<UpdateProfile> getUpdateProfile(String? firstName, String? lastName,
      String? email, String? password, File? profilePicture) async {
    final url = Uri.parse(baseUrl + 'auth/updateProfile');
    GetTokenDatabase? token = await userDao.getUserToken();
    //print("token update profile = " + token!.getToken!);

    var headers = {
      'Authorization': 'Bearer ' + token!.getToken!,
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    };
    var request = http.MultipartRequest('POST', url);

    request.fields.putIfAbsent('firstName', () => firstName!);
    request.fields.putIfAbsent('lastName', () => lastName!);
    request.fields.putIfAbsent('email', () => email!);
    if (password!.isNotEmpty)
      request.fields.putIfAbsent('password', () => password);

    if (profilePicture != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'profilePicture', profilePicture.path));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("request updateProfile fields ${request.fields}");
    print("request updateProfile files ${request.files.asMap()}");

    final http.Response res = await http.Response.fromStream(response);

    print("response updateProfile ${res.body} ${res.statusCode.toString()}");

    if (response.statusCode == 200) {
      return UpdateProfile.fromJson(
        json.decode(res.body),
      );
    }
    // else if (response.statusCode == 401) {
    //   return UpdateProfile.refresh401(res.body);
    // }
    else {
      print(res.body);
      throw Exception(
        json.decode(res.body),
      );
    }
  }
}
