import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_filter.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/entities/search_query.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/search_use_case.dart';

class SearchUseCaseImpl implements SearchUseCase {
  final MediaRepository _mediaRepository = locator<MediaRepository>();

  @override
  Future<List<MediaMetadata>> search(SearchQuery query) async {
    return _mediaRepository.search(query);
  }

  @override
  Future<List<MediaFilter>> getMediaFilters() async {
    return await _mediaRepository.getMediaFilters();
  }
}
