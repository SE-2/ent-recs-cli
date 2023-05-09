import 'package:supermedia/layers/data/models/media_metadata_model.dart';

abstract class RemoteMediaDataSource {
  Future<List<MediaMetadataModel>> search(String query);
  Future<List<MediaMetadataModel>> recommend();
}
