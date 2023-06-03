import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';
import 'package:supermedia/layers/domain/entities/media_metadata_detail.dart';

abstract class MediaRepository {
  Future<List<MediaMetadata>> search(SearchQuery query);
  Future<List<MediaMetadata>> recommend();
  Future<List<MediaMetadata>> getRecentWatchedMedia();
  Future<List<MediaMetadata>> getTodayTrendMedia();
  Future<List<MediaMetadata>> getAllTimesTrendMedia();
  Future<MediaMetadataDetail> getMediaById(String id);
  Future<List<MediaFilter>> getMediaFilters();
}
