import 'package:coffepedia/data/models/add_address.dart';
import 'package:coffepedia/data/models/areas.dart';
import 'package:coffepedia/data/models/cities.dart';
import 'package:coffepedia/data/models/governorates.dart';
import 'package:coffepedia/data/web_services/address_web_services.dart';

class AddressRepository {
  final AddressWebServices addressWebServices;

  AddressRepository(this.addressWebServices);

  Future<Governorates> getGovernorate() async {
    final governorate = addressWebServices.getGovernorates();
    return governorate;
  }

  Future<Cities> getCities(int governorateId) async {
    final cities = addressWebServices.getCities(governorateId);
    return cities;
  }

  Future<Areas> getAreas(int cityId) async {
    final areas = addressWebServices.getAreas(cityId);
    return areas;
  }

  Future<AddAddress> getAddAddress(
    String governorateId,
    String cityId,
    String areaId,
    String street,
    String details,
  ) async {
    final addAddress = await addressWebServices.getAddAddress(
      governorateId,
      cityId,
      areaId,
      street,
      details,
    );

    return addAddress;
  }
}
