import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_media_data_source.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';
import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';

class MediaRepositoryImp implements MediaRepository {
  final RemoteMediaDataSource _remoteDataSource =
      locator<RemoteMediaDataSource>();

  @override
  Future<List<MediaMetadata>> recommend(MediaType mediaType) async {
    List<MediaMetadataModel> models = await _remoteDataSource.recommend(mediaType);
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaMetadata>> search(SearchQuery query) async {
    List<MediaMetadataModel> models = await _remoteDataSource.search(query);
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaMetadata>> getAllTimesTrendMedia() async {
    List<MediaMetadataModel> models = await _remoteDataSource.getAllTimesTrendMedia();
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaMetadata>> getRecentWatchedMedia() async {
    List<MediaMetadataModel> models = await _remoteDataSource.getRecentWatchedMedia();
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaMetadata>> getTodayTrendMedia() async {
    List<MediaMetadataModel> models = await _remoteDataSource.getTodayTrendMedia();
    return models.map((e) => MediaMetadata.fromModel(e)).toList();
  }

  @override
  Future<List<MediaFilter>> getMediaFilters() async {
    List<MediaFilter> mediaFilters = await _remoteDataSource.getMediaFilters();
    return mediaFilters;
  }
}
