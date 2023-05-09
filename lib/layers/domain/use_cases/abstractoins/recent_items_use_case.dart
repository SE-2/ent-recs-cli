import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class RecentItemsUseCase {
  Future<List<MediaMetadata>> getRecentWatchedMedia();
}