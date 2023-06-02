import 'package:supermedia/layers/domain/entities/media_metadata.dart';

class MediaFilter {
  final MediaType mediaType;
  final List<String> categories;

  MediaFilter({required this.mediaType, required this.categories});
}
