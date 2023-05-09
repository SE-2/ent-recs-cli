import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_media_data_source.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';

class MediaRepositoryImp implements MediaRepository {
  final RemoteMediaDataSource _remoteDataSource =
      locator<RemoteMediaDataSource>();

  @override
  Future<List<MediaMetadata>> recommend() {
    // TODO: implement recommend
    throw UnimplementedError();
  }

  @override
  Future<List<MediaMetadata>> search(String query) async {
    List<MediaMetadataModel> models = await _remoteDataSource.search(query);
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }
  
  @override
  Future<List<MediaMetadata>> getAllTimesTrendMedia() async {
    // TODO: implement getAllTimesTrendMedia
    // throw UnimplementedError();
    return List<MediaMetadata>.empty();
  }
  
  @override
  Future<List<MediaMetadata>> getRecentWatchedMedia() async {
    // TODO: implement getRecentWatchedMedia
    // throw UnimplementedError();
    return List<MediaMetadata>.empty();
  }
  
  @override
  Future<List<MediaMetadata>> getTodayTrendMedia() async {
    // TODO: implement getTodayTrendMedia
    // throw UnimplementedError();
    return List<MediaMetadata>.empty();
  }
}
