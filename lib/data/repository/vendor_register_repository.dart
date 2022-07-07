import 'package:coffepedia/data/models/vendor_register.dart';
import 'package:coffepedia/data/web_services/vendor_register_web_services.dart';
import 'package:file_picker/file_picker.dart';

class VendorRegisterRepository {
  final VendorRegisterWebServices vendorRegisterWebServices;

  VendorRegisterRepository(this.vendorRegisterWebServices);

  Future<VendorRegister> postVendorRegister({
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
  }) async {
    final vendor = vendorRegisterWebServices.postVendorRegister(
      mobile: mobile,
      passwordConfirmation: passwordConfirmation,
      password: password,
      email: email,
      lastName: lastName,
      firstName: firstName,
      arDescription: arDescription,
      brandName: brandName,
      commercialRegister: commercialRegister,
      contract: contract,
      enDescription: enDescription,
      taxCard: taxCard,
    );
    return vendor;
  }
}
