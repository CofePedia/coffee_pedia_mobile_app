
import 'dart:io';

import 'package:coffepedia/data/models/update_profile.dart';
import 'package:coffepedia/data/web_services/update_profile_web_services.dart';

class UpdateProfileRepository {
  final UpdateProfileWebServices updateProfileWebServices;

  UpdateProfileRepository(this.updateProfileWebServices);

  Future<UpdateProfile> getUpdateProfile(String? firstName , String? lastName, String? email , String? password , File? profilePicture) async {
    final updateProfile = updateProfileWebServices.getUpdateProfile(firstName,lastName,email,password,profilePicture);
    return updateProfile;
  }
}
