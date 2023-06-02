import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_media_data_source.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/data/models/media_metadata_model_details.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/media_metadata_detail.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';

class MediaRepositoryImp implements MediaRepository {
  final RemoteMediaDataSource _remoteDataSource =
      locator<RemoteMediaDataSource>();

  @override
  Future<List<MediaMetadata>> recommend() async {
    List<MediaMetadataModel> models = await _remoteDataSource.recommend();
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaMetadata>> search(String query) async {
    List<MediaMetadataModel> models = await _remoteDataSource.search(query);
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaMetadata>> getAllTimesTrendMedia() async {
    List<MediaMetadataModel> models =
        await _remoteDataSource.getAllTimesTrendMedia();
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaMetadata>> getRecentWatchedMedia() async {
    List<MediaMetadataModel> models =
        await _remoteDataSource.getRecentWatchedMedia();
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaMetadata>> getTodayTrendMedia() async {
    List<MediaMetadataModel> models =
        await _remoteDataSource.getTodayTrendMedia();
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<MediaMetadataDetail> getMediaById(String id) async {
    MediaMetadataDetailsModel model = await _remoteDataSource.getMediaById(id);
    return MediaMetadataDetail.fromModel(model);
  }
}
