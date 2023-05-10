import 'package:supermedia/layers/domain/entities/media_metadata.dart';

abstract class TrendItemsUseCase {
  Future<List<MediaMetadata>> getAllTimesTrendMedia();
  Future<List<MediaMetadata>> getTodayTrendMedia();
}