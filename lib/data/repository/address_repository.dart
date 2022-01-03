import 'package:coffepedia/data/models/areas.dart';
import 'package:coffepedia/data/models/cities.dart';
import 'package:coffepedia/data/models/governorates.dart';
import 'package:coffepedia/data/web_services/address_web_services.dart';

class AddressRepository {
  final AddressWebServices governorateWebServices;

  AddressRepository(this.governorateWebServices);

  Future<Governorates> getGovernorate() async {
    final governorate = governorateWebServices.getGovernorates();
    return governorate;
  }

  Future<Cities> getCities(int governorateId) async {
    final cities = governorateWebServices.getCities(governorateId);
    return cities;
  }

  Future<Areas> getAreas(int cityId) async {
    final areas = governorateWebServices.getAreas(cityId);
    return areas;
  }
}
