import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/add_address.dart';
import 'package:coffepedia/data/models/cities.dart';
import 'package:coffepedia/data/models/delete_address.dart';
import 'package:coffepedia/data/models/governorates.dart';
import 'package:coffepedia/data/models/my_addresses.dart';
import 'package:coffepedia/data/models/update_address.dart';
import 'package:coffepedia/data/repository/address_repository.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final AddressRepository addressRepository;
  AddressCubit(this.addressRepository) : super(GovernorateInitial());

  void getGovernorate() {
    addressRepository.getGovernorate().then(
      (governorate) {
        emit(GovernorateLoaded(governorate));
      },
    );
  }

  void getCities(int governorateId) {
    addressRepository.getCities(governorateId).then(
      (value) {
        emit(CitiesLoaded(value));
      },
    );
  }

  // void getAreas(int cityId) {
  //   addressRepository.getAreas(cityId).then(
  //     (value) {
  //       emit(AreasLoaded(value));
  //     },
  //   );
  // }

  void getAddAddress(
    String governorateId,
    String cityId,
    String name,
    // String areaId,
    String street,
    String details,
  ) {
    addressRepository
        .getAddAddress(
      governorateId,
      cityId,
      name,
      // areaId,
      street,
      details,
    )
        .then(
      (value) {
        emit(AddAddressIsPressed(value));
      },
    );
  }

  void getMyAddresses() {
    addressRepository.getMyAddresses().then(
      (myAddresses) {
        emit(
          MyAddressesIsLoaded(myAddresses),
        );
      },
    );
  }

  void postUpdateAddress({
    String? governorateId,
    String? cityId,
    String? name,
    // String? areaId,
    String? street,
    String? details,
    String? primary,
    String? addressId,
  }) {
    addressRepository
        .postUpdateAddress(
      governorateId: governorateId,
      cityId: cityId,
      name: name,
      // areaId: areaId,
      street: street,
      details: details,
      primary: primary,
      addressId: addressId,
    )
        .then(
      (value) {
        emit(UpdateAddressIsPressed(value));
      },
    );
  }

  void postDeleteAddress(String addressId) {
    addressRepository.postDeleteAddress(addressId).then(
      (value) {
        emit(DeleteAddressIsPressed(value));
      },
    );
  }
}
