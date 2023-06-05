import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';
import 'package:supermedia/layers/domain/entities/media_metadata_detail.dart';
import 'package:supermedia/layers/presentation/questionnaire/screens/questionnaire_screen.dart';

abstract class MediaRepository {
  Future<List<MediaMetadata>> search(SearchQuery query);
  Future<List<MediaMetadata>> recommend(MediaType mediaType);
  Future<List<MediaMetadata>> getRecentWatchedMedia();
  Future<List<MediaMetadata>> getTodayTrendMedia();
  Future<List<MediaMetadata>> getAllTimesTrendMedia();
  Future<MediaMetadataDetail> getMediaById(String id);
  Future<List<MediaFilter>> getMediaFilters();
  Future<List<MediaCategory>> getMediaCategories(MediaType mediaType);
  Future<void> submitUserInterests(MediaType mediaType, List<String> categories);
  Future<bool> isQuestionnaireFilled(MediaType mediaType);
}
