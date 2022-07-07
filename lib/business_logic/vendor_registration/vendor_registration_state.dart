part of 'vendor_registration_cubit.dart';

@immutable
abstract class VendorRegistrationState {}

class VendorRegistrationInitial extends VendorRegistrationState {}

class VendorRegistrationIsPressed extends VendorRegistrationState {
  final VendorRegister? vendorRegister;
  VendorRegistrationIsPressed(this.vendorRegister);
}

class VendorRegistrationIsFailed extends VendorRegistrationState {
  final String? error;
  VendorRegistrationIsFailed(this.error);
}
