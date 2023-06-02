
import 'package:supermedia/layers/data/data_sources/abstractions/remote_bookmarek_data_source.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item.dart';

class RemoteBookmarkDataSourceImpl implements RemoteBookmarkDataSource {
  Future<List<BookmarkListItem>> getBookmarkLists() async{
    // final request = HttpRequest(
    //   '/bookmarklists',
    //   headers: {'Content-Type': 'application/json'},
    //   body: {'query': query},
    // );
    //
    // final response = await _httpClient.post(request);
    //
    // if (response.statusCode == 200) {
    //   return BookmarkListItem.fromJsonList(response.body);
    // } else {
    //   throw SearchException(
    //       AppLocalization.instance.errorCode(response.statusCode));
    // }
    return bookmarkLists;
  }
}


List<BookmarkListItem> bookmarkLists = [
  BookmarkListItem(id: 0, title: "Happiness", types: []),
  BookmarkListItem(id: 1, title: "Sadness", types: []),
  BookmarkListItem(id: 2, title: "Best", types: []),
  BookmarkListItem(id: 3, title: "To watch", types: []),
  BookmarkListItem(id: 4, title: "Others", types: []),
];