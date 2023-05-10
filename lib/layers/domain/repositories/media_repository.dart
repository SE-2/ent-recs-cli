import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class MediaRepository {
  Future<List<MediaMetadata>> search(String query);
  Future<List<MediaMetadata>> recommend();
  Future<List<MediaMetadata>> getRecentWatchedMedia();
  Future<List<MediaMetadata>> getTodayTrendMedia();
  Future<List<MediaMetadata>> getAllTimesTrendMedia();
}
