import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/recommend_use_case.dart';

class RecommendUseCaseImpl implements RecommendUseCase {
  final MediaRepository _mediaRepository = locator<MediaRepository>();

  @override
  Future<List<MediaMetadata>> recommend(MediaType mediaType) async {
    return _mediaRepository.recommend(mediaType);
  }
}
