import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class RecommendUseCase {
  Future<List<MediaMetadata>> recommend();
}
