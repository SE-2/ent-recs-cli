import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/trend_items_use_case.dart';

class TrendItemsUseCaseImpl implements TrendItemsUseCase {
  final MediaRepository _mediaRepository = locator<MediaRepository>();

  @override
  Future<List<MediaMetadata>> getAllTimesTrendMedia() async {
    return _mediaRepository.getAllTimesTrendMedia();
  }
   @override
  Future<List<MediaMetadata>> getTodayTrendMedia() async {
    return _mediaRepository.getTodayTrendMedia();
  }
}
