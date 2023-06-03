import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';

abstract class RemoteMediaDataSource {
  Future<List<MediaMetadataModel>> search(SearchQuery query);
  Future<List<MediaMetadataModel>> recommend(MediaType mediaType);
  Future<List<MediaMetadataModel>> getRecentWatchedMedia();
  Future<List<MediaMetadataModel>> getTodayTrendMedia();
  Future<List<MediaMetadataModel>> getAllTimesTrendMedia();
  Future<List<MediaFilter>> getMediaFilters();
}
