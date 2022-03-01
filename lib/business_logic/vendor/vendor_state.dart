part of 'vendor_cubit.dart';

@immutable
abstract class VendorState {}

class VendorInitial extends VendorState {}

class VendorDetailsIsLoaded extends VendorState {
  final VendorDetails? vendorDetails;
  VendorDetailsIsLoaded(this.vendorDetails);
}
