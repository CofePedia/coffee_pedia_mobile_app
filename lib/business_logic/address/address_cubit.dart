import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/add_address.dart';
import 'package:coffepedia/data/models/areas.dart';
import 'package:coffepedia/data/models/cities.dart';
import 'package:coffepedia/data/models/governorates.dart';
import 'package:coffepedia/data/models/my_addresses.dart';
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

  void getAreas(int cityId) {
    addressRepository.getAreas(cityId).then(
      (value) {
        emit(AreasLoaded(value));
      },
    );
  }

  void getAddAddress(
    String governorateId,
    String cityId,
    String name,
    String areaId,
    String street,
    String details,
  ) {
    addressRepository
        .getAddAddress(
      governorateId,
      cityId,
      name,
      areaId,
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
}
