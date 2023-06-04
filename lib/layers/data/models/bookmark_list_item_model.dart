import 'package:supermedia/layers/domain/entities/media_metadata.dart';

class BookmarkListItemModel {
  final int? id;
  final String title;
  final List<String> types;

  BookmarkListItemModel({required this.id, required this.title, required this.types});
}