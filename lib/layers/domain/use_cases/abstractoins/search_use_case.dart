import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class SearchUseCase {
  Future<List<MediaMetadata>> search(String query);
}
