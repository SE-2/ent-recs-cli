import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/presentation/shared/widgets/sort_option.dart';

class SearchQuery {
  final String query;
  final MediaFilter filter;
  final SortMethod sortMethod;

  SearchQuery({required this.query, required this.filter, required this.sortMethod});

  Map<String, dynamic> toJson() {
    return {
      'query': query,
      'filter': filter.toJson(),
      'sortMethod': sortMethod.toJson(),
    };
  }
}