import 'package:coffepedia/data/models/vendor_details.dart';
import 'package:coffepedia/data/web_services/vendor_web_services.dart';

class VendorRepository {
  final VendorWebServices vendorWebServices;

  VendorRepository(this.vendorWebServices);

  Future<VendorDetails> getVendorDetails(int vendorId) async {
    final vendor = vendorWebServices.getVendorDetails(vendorId);
    return vendor;
  }
}
