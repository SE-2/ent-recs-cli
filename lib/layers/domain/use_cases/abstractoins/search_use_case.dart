import 'package:supermedia/layers/data/models/media_list_item_model.dart';

abstract class SearchUseCase {
  Future<List<MediaListItemModel>> search(String query);
}
