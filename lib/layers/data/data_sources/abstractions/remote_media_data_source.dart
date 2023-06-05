import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/data/models/media_metadata_model_details.dart';
import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';
import 'package:supermedia/layers/presentation/questionnaire/screens/questionnaire_screen.dart';

abstract class RemoteMediaDataSource {
  Future<List<MediaMetadataModel>> search(SearchQuery query);
  Future<List<MediaMetadataModel>> recommend(MediaType mediaType);
  Future<List<MediaMetadataModel>> getRecentWatchedMedia();
  Future<List<MediaMetadataModel>> getTodayTrendMedia();
  Future<List<MediaMetadataModel>> getAllTimesTrendMedia();
  Future<MediaMetadataDetailsModel> getMediaById(String id);
  Future<List<MediaFilter>> getMediaFilters();
  Future<List<MediaCategory>> getMediaCategories(MediaType mediaType);
  Future<void> submitUserInterests(MediaType mediaType, List<String> categories);
  Future<bool> isQuestionnaireFilled(MediaType mediaType);
}
