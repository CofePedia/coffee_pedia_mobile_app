import 'package:coffepedia/data/models/add_address.dart';
import 'package:coffepedia/data/models/cities.dart';
import 'package:coffepedia/data/models/delete_address.dart';
import 'package:coffepedia/data/models/governorates.dart';
import 'package:coffepedia/data/models/my_addresses.dart';
import 'package:coffepedia/data/models/update_address.dart';
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

  // Future<Areas> getAreas(int cityId) async {
  //   final areas = addressWebServices.getAreas(cityId);
  //   return areas;
  // }

  Future<AddAddress> getAddAddress(
    String governorateId,
    String cityId,
    String name,
    // String areaId,
    String street,
    String details,
  ) async {
    final addAddress = await addressWebServices.getAddAddress(
      governorateId,
      cityId,
      name,
      // areaId,
      street,
      details,
    );

    return addAddress;
  }

  Future<MyAddresses> getMyAddresses() async {
    final myAddresses = addressWebServices.getMyAddresses();
    return myAddresses;
  }

  Future<UpdateAddress> postUpdateAddress({
    String? governorateId,
    String? cityId,
    String? name,
    // String? areaId,
    String? street,
    String? details,
    String? primary,
    String? addressId,
  }) async {
    final updateAddress = await addressWebServices.postUpdateAddress(
        governorateId: governorateId,
        cityId: cityId,
        name: name,
        // areaId: areaId,
        street: street,
        details: details,
        addressId: addressId,
        primary: primary);

    return updateAddress;
  }

  Future<DeleteAddress> postDeleteAddress(
    String addressId,
  ) async {
    final deleteAddress = await addressWebServices.postDeleteAddress(addressId);

    return deleteAddress;
  }
}
