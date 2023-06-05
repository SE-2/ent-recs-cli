
import 'package:supermedia/layers/domain/entities/media_metadata_detail.dart';

abstract class MediaUseCase {
  Future<MediaMetadataDetail> getMediaById(String id);
  Future<int> like(String mediaId);
}
