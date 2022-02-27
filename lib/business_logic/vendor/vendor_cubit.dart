import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/vendor_details.dart';
import 'package:coffepedia/data/repository/vendor_repository.dart';
import 'package:meta/meta.dart';

part 'vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  final VendorRepository vendorRepository;
  VendorCubit(this.vendorRepository) : super(VendorInitial());
  void getVendorDetails(int vendorId) {
    vendorRepository.getVendorDetails(vendorId).then(
      (value) {
        emit(VendorDetailsIsLoaded(value));
      },
    );
  }
}
