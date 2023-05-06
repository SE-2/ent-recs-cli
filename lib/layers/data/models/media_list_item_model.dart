class MediaListItemModel {
  final String mediaId;
  final String type;
  final String title;
  final String imageUrl;
  final Map<String, String> properties;

  MediaListItemModel(
      this.mediaId, this.type, this.title, this.imageUrl, this.properties);
}
