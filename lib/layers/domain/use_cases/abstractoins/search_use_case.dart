import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';

abstract class SearchUseCase {
  Future<List<MediaMetadata>> search(SearchQuery query);
  Future<List<MediaFilter>> getMediaFilters();
}
