import 'package:coffepedia/data/models/aboutCofePedia.dart';
import 'package:coffepedia/data/web_services/about_cofepedia_web_services.dart';

class AboutCofepediaRepository {
  final AboutCofepediaWebServices aboutCofepediaWebServices;

  AboutCofepediaRepository(this.aboutCofepediaWebServices);

  Future<AboutCofePedia> getAboutCofepedia() async {
    final about = aboutCofepediaWebServices.getAboutCofepedia();
    return about;
  }
}
