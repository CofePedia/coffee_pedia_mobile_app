import 'dart:convert';

import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/me.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

class MeWebServices {
  final userDao = UserDao();

  Future<Me> getMe() async {
    final url = Uri.parse(baseUrl + 'auth/me');
    // print("token1 = " + userDao.getUserToken());

    userDao.getUserToken().then((value) => print("token1 = " + value.toString()));
    final http.Response response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ' + 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLXN0YWdpbmcuY29mZmVwaWRpYS5jb21cL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjQwNjk4NDE5LCJleHAiOjE2NDA3ODQ4MjAsIm5iZiI6MTY0MDY5ODQyMCwianRpIjoiSlpkVDJPUEFWaHM5bGx4biIsInN1YiI6MSwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.Rs0RJjc6j2NFqJhrqt9B9P7CjOnSyhbadBB_hkJidcQ'},
    );
    print("response me ${response.body}");


    if (response.statusCode == 200) {
      return Me.fromJson(
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
