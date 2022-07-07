import 'dart:convert';
import 'dart:io';

import 'package:coffepedia/data/models/vendor_register.dart';
import 'package:coffepedia/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';

class VendorRegisterWebServices {
  Future<VendorRegister> postVendorRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String brandName,
    required String mobile,
    required String arDescription,
    required String enDescription,
    required List<PlatformFile>? commercialRegister,
    required List<PlatformFile>? contract,
    required List<PlatformFile>? taxCard,
  }) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + '/auth/vendor_register'));
    request.fields.addAll({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'company_name': brandName,
      'company_phone_number': mobile,
      'description_ar': arDescription,
      'description_en': enDescription,
    });
    request.headers.addAll({
      'Content-Language': translator.currentLanguage,
      'platform': Platform.operatingSystem,
      'OSVersion': Platform.operatingSystemVersion,
    });

    request.files.add(await http.MultipartFile.fromPath(
        'commercial_register', commercialRegister!.first.path.toString()));
    request.files.add(await http.MultipartFile.fromPath(
        'contract', contract!.first.path.toString()));
    request.files.add(await http.MultipartFile.fromPath(
        'tax_card', taxCard!.first.path.toString()));

    http.StreamedResponse response = await request.send();

    final http.Response res = await http.Response.fromStream(response);

    print("response vendor register ${res.body}");

    if (response.statusCode == 201) {
      final vendor = VendorRegister.fromJson(
        json.decode(res.body),
      );
      return vendor;
    } else {
      final data = jsonDecode(res.body);
      data.forEach((key, value) {
        throw value[0];
      });
      throw 'Error, Please try again';
    }
  }
}
