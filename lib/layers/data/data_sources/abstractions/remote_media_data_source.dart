import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/data/models/media_metadata_model_details.dart';

abstract class RemoteMediaDataSource {
  Future<List<MediaMetadataModel>> search(String query);
  Future<List<MediaMetadataModel>> recommend();
  Future<List<MediaMetadataModel>> getRecentWatchedMedia();
  Future<List<MediaMetadataModel>> getTodayTrendMedia();
  Future<List<MediaMetadataModel>> getAllTimesTrendMedia();
  Future<MediaMetadataDetailsModel> getMediaById(String id);
}
