import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class MediaRepository {
  Future<List<MediaMetadata>> search(String query);

  Future<List<MediaMetadata>> recommend();
}
