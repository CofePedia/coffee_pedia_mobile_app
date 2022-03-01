import 'package:coffepedia/data/models/search.dart';
import 'package:coffepedia/data/web_services/search_web_services.dart';

class SearchRepository {
  final SearchWebServices searchWebServices;

  SearchRepository(this.searchWebServices);

  Future<Search> getSearch(String query) async {
    final search = searchWebServices.getSearch(query);
    return search;
  }
}
