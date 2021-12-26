import 'package:coffepedia/data/models/most_recent_products.dart';
import 'package:coffepedia/data/web_services/most_recent_web_services.dart';

class MostRecentRepository {
  final MostRecentWebServices mostRecentWebServices;

  MostRecentRepository(this.mostRecentWebServices);

  Future<MostRecent> getMostRecent() async {
    final mostRecent = mostRecentWebServices.getMostRecent();
    return mostRecent;
  }
}
