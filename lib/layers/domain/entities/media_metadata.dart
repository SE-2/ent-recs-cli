import 'package:supermedia/layers/data/models/media_metadata_model.dart';

class MediaMetadata {
  final String mediaId;
  final MediaType type;
  final String title;
  final String imageUrl;
  final Map<MediaProperty, String> properties;

  MediaMetadata({
    required this.mediaId,
    required this.type,
    required this.title,
    required this.imageUrl,
    required this.properties,
  });

  factory MediaMetadata.fromModel(MediaMetadataModel model) {
    return MediaMetadata(
      mediaId: model.mediaId,
      type: _parseMediaType(model.type),
      title: model.title,
      imageUrl: model.imageUrl,
      properties: _parseMediaProperties(model.properties),
    );
  }

  static final _mediaTypeMap = {
    'movie': MediaType.movie,
    'music': MediaType.music,
    'book': MediaType.book,
    'podcast': MediaType.podcast,
  };

  static MediaType _parseMediaType(String typeString) {
    return _mediaTypeMap[typeString.toLowerCase()] ??
        (throw ArgumentError('Unsupported media type: $typeString'));
  }

  static final _propertyMap = {
    'pages': MediaProperty.pages,
    'publishDate': MediaProperty.publishDate,
    'genre': MediaProperty.genre,
    'director': MediaProperty.director,
    'productionYear': MediaProperty.productionYear,
    'writer': MediaProperty.writer,
    'duration': MediaProperty.duration,
    'style': MediaProperty.style,
    'singer': MediaProperty.singer,
    'producer': MediaProperty.producer,
  };

  static MediaProperty _parseMediaProperty(String propertyKey) {
    return _propertyMap[propertyKey] ??
        (throw ArgumentError('Invalid property key: $propertyKey'));
  }

  static Map<MediaProperty, String> _parseMediaProperties(
      Map<String, String> properties) {
    Map<MediaProperty, String> result = {};
    for (String key in properties.keys) {
      MediaProperty property = _parseMediaProperty(key);
      result[property] = properties[key]!;
    }
    return result;
  }
}

enum MediaType {
  movie,
  music,
  book,
  podcast,
}

enum MediaProperty {
  pages,
  publishDate,
  genre,
  director,
  productionYear,
  writer,
  duration,
  style,
  singer,
  producer,
}
