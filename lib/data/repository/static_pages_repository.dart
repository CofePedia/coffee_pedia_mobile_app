import 'package:coffepedia/data/models/static_pages.dart';

import '../web_services/static_pages_web_services.dart';

class StaticPagesRepository {
  final StaticPagesWebServices staticPagesWebServices;

  StaticPagesRepository(this.staticPagesWebServices);

  Future<StaticPage> getPrivacyPolicy() async {
    final privacyPolicy = staticPagesWebServices.getPrivacyPolicy();
    return privacyPolicy;
  }

  Future<StaticPage> getTermsAndConditions() async {
    final termsAndConditions = staticPagesWebServices.getTermsAndConditions();
    return termsAndConditions;
  }
}
