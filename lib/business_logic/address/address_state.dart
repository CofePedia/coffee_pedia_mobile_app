part of 'address_cubit.dart';

@immutable
abstract class AddressState {}

class GovernorateInitial extends AddressState {}

class GovernorateLoaded extends AddressState {
  final Governorates? governorates;
  GovernorateLoaded(this.governorates);
}

class CitiesLoaded extends AddressState {
  final Cities? cities;
  CitiesLoaded(this.cities);
}

// class AreasLoaded extends AddressState {
//   final Areas? areas;
//   AreasLoaded(this.areas);
// }

class AddAddressIsPressed extends AddressState {
  final AddAddress? addAddress;
  AddAddressIsPressed(this.addAddress);
}

class MyAddressesIsLoaded extends AddressState {
  final MyAddresses? myAddresses;
  MyAddressesIsLoaded(this.myAddresses);
}

class UpdateAddressIsPressed extends AddressState {
  final UpdateAddress? updateAddress;
  UpdateAddressIsPressed(this.updateAddress);
}

class DeleteAddressIsPressed extends AddressState {
  final DeleteAddress? deleteAddress;
  DeleteAddressIsPressed(this.deleteAddress);
}
