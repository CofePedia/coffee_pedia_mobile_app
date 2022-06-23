import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:coffepedia/constants/strings.dart';
import 'package:coffepedia/data/models/add_address.dart';
import 'package:coffepedia/data/models/areas.dart';
import 'package:coffepedia/data/models/cities.dart';
import 'package:coffepedia/data/models/delete_address.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/governorates.dart';
import 'package:coffepedia/data/models/my_addresses.dart';
import 'package:coffepedia/data/models/update_address.dart';
import 'package:coffepedia/database/database_provider.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class AddressWebServices {
  final userDao = UserDao();

  Future<Governorates> getGovernorates() async {
    final uri = Uri.https(
      getBaseUrl,
      '/governorates',
    );
    final http.Response response = await http.get(
      uri,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );

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
    final uri = Uri.https(
      getBaseUrl,
      '/cities/$governorateId',
    );
    final http.Response response = await http.get(
      uri,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );

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
    final uri = Uri.https(
      getBaseUrl,
      '/areas/$cityId',
    );
    final http.Response response = await http.get(
      uri,
      headers: {
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );

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
    String name,
    String areaId,
    String street,
    String details,
  ) async {
    final url = Uri.parse(baseUrl + 'addAddress');
    GetTokenDatabase? token = await userDao.getUserToken();

    final http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
      body: {
        'governorate_id': governorateId,
        'city_id': cityId,
        'name': name,
        'area_id': areaId,
        'street': street,
        'details': details,
      },
    );
    print("response addAddress ${response.body}");

    if (response.statusCode == 200) {
      final address = AddAddress.fromJson(
        json.decode(response.body),
      );
      BotToast.showText(text: address.data!.msg!);
      return address;
    } else {
      // print(json.decode(response.body).toString());
      //
      // throw Exception(
      //   json.decode(response.body),
      // );

      // }
      final data = jsonDecode(response.body);

      data.forEach((key, value) {
        BotToast.showText(text: value[0]);

        throw value[0];
      });
      throw 'Error, Please try again';
    }
  }

  Future<MyAddresses> getMyAddresses() async {
    GetTokenDatabase? token = await userDao.getUserToken();

    final uri = Uri.https(
      getBaseUrl,
      '/myAddresses',
    );
    final http.Response response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
    );

    if (response.statusCode == 200) {
      return MyAddresses.fromJson(
        json.decode(response.body),
      );
    } else {
      print(json.decode(response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<UpdateAddress> postUpdateAddress({
    String? governorateId,
    String? cityId,
    String? name,
    String? areaId,
    String? street,
    String? details,
    String? primary,
    String? addressId,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'address_id': addressId,
    };

    if (name!.isNotEmpty) {
      queryParameters.addAll({
        'name': name,
      });
    }
    if (governorateId!.isNotEmpty) {
      queryParameters.addAll({
        'governorate_id': governorateId,
      });
    }
    if (cityId!.isNotEmpty) {
      queryParameters.addAll({
        'city_id': cityId,
      });
    }
    if (areaId!.isNotEmpty) {
      queryParameters.addAll({
        'area_id': areaId,
      });
    }
    if (street!.isNotEmpty) {
      queryParameters.addAll({
        'street': street,
      });
    }
    if (details!.isNotEmpty) {
      queryParameters.addAll({
        'details': details,
      });
    }
    if (primary! != '-1') {
      queryParameters.addAll({
        'primary': primary,
      });
    }

    final url = Uri.parse(baseUrl + 'updateAddress');
    GetTokenDatabase? token = await userDao.getUserToken();

    final http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
      body: queryParameters,
    );
    print("response updateAddress ${response.body}");

    if (response.statusCode == 200) {
      final update = UpdateAddress.fromJson(
        json.decode(response.body),
      );
      BotToast.showText(text: update.data!.msg!);
      return update;
    } else {
      print(json.decode(response.body).toString());
      throw Exception(
        json.decode(response.body),
      );
    }
  }

  Future<DeleteAddress> postDeleteAddress(
    String addressId,
  ) async {
    final url = Uri.parse(baseUrl + 'deleteAddress');
    GetTokenDatabase? token = await userDao.getUserToken();
    final http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ' + token!.getToken!,
        'Content-Language': translator.currentLanguage,
        'platform': Platform.operatingSystem,
        'OSVersion': Platform.operatingSystemVersion,
      },
      body: {
        'address_id': addressId,
      },
    );
    print("response deleteAddress ${response.body}");

    if (response.statusCode == 200) {
      return DeleteAddress.fromJson(
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
