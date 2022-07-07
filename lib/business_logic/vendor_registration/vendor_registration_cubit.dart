import 'package:bloc/bloc.dart';
import 'package:coffepedia/data/models/vendor_register.dart';
import 'package:coffepedia/data/repository/vendor_register_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

part 'vendor_registration_state.dart';

class VendorRegistrationCubit extends Cubit<VendorRegistrationState> {
  final VendorRegisterRepository vendorRegisterRepository;
  VendorRegistrationCubit(this.vendorRegisterRepository)
      : super(VendorRegistrationInitial());

  void postVendorRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String brandName,
    required String mobile,
    required String arDescription,
    required String enDescription,
    required List<PlatformFile>? commercialRegister,
    required List<PlatformFile>? contract,
    required List<PlatformFile>? taxCard,
  }) {
    vendorRegisterRepository
        .postVendorRegister(
          taxCard: taxCard,
          enDescription: enDescription,
          contract: contract,
          commercialRegister: commercialRegister,
          brandName: brandName,
          arDescription: arDescription,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation,
          mobile: mobile,
        )
        .then((value) => emit(VendorRegistrationIsPressed(value)))
        .catchError(
          (error) => emit(
            VendorRegistrationIsFailed(error),
          ),
        );
  }
}
