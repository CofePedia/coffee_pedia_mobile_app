import 'package:coffepedia/data/models/logout.dart';
import 'package:coffepedia/data/models/me.dart';
import 'package:coffepedia/data/web_services/me_web_services.dart';

class MeRepository {
  final MeWebServices meWebServices;

  MeRepository(this.meWebServices);

  Future<MeModel> getMe() async {
    final me = meWebServices.getMe();
    return me;
  }

  Future<Logout> logout() async {
    final userLogout = await meWebServices.logout();
    return userLogout;
  }
}
