import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata_detail.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/media_use_case.dart';

class MediaUseCaseImpl implements MediaUseCase {
  final MediaRepository _mediaRepository = locator<MediaRepository>();

 @override
  Future<MediaMetadataDetail> getMediaById(String id) async {
    return _mediaRepository.getMediaById(id);
  }

  @override
  Future<int> like(String mediaId) {
    return _mediaRepository.like(mediaId);
  }
}
