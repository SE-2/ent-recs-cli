import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/recent_items_use_case.dart';

class RecentItemsUseCaseImpl implements RecentItemsUseCase {
  final MediaRepository _mediaRepository = locator<MediaRepository>();

  @override
  Future<List<MediaMetadata>> getRecentWatchedMedia() async {
    return _mediaRepository.getRecentWatchedMedia();
  }
}
