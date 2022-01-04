import 'package:coffepedia/data/models/flavors.dart';
import 'package:coffepedia/data/models/regions.dart';
import 'package:coffepedia/data/models/roasts.dart';
import 'package:coffepedia/data/web_services/filters_web_services.dart';

class FiltersRepository {
  final FiltersWebServices filtersWebServices;

  FiltersRepository(this.filtersWebServices);

  Future<Regions> getRegions() async {
    final regions = filtersWebServices.getRegions();
    return regions;
  }

  Future<Roasts> getRoasts() async {
    final roasts = filtersWebServices.getRoasts();
    return roasts;
  }

  Future<Flavors> getFlavors() async {
    final flavor = filtersWebServices.getFlavors();
    return flavor;
  }
}
