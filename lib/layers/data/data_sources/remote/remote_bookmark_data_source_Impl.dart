
import 'package:supermedia/layers/data/data_sources/abstractions/remote_bookmarek_data_source.dart';
import 'package:supermedia/layers/data/models/add_item_model.dart';
import 'package:supermedia/layers/data/models/bookmark_list_item_model.dart';
import 'package:supermedia/layers/data/models/media_metadata_model.dart';

class RemoteBookmarkDataSourceImpl implements RemoteBookmarkDataSource {
  Future<List<BookmarkListItem>> getBookmarkLists() async{
    // final request = HttpRequest(
    //   '/bookmarks',
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

  @override
  Future<List<MediaMetadataModel>> getBookmarkListItems(int bookmarkListId) async {
    // final request = HttpRequest(
      //   '/bookmarks/{id}',
    //   headers: {'Content-Type': 'application/json'},
    //   body: {'query': query},
    // );
    //
    // final response = await _httpClient.post(request);
    //
    // if (response.statusCode == 200) {
    //   return MediaMetadataModel.fromJsonList(response.body);
    // } else {
    //   throw SearchException(
    //       AppLocalization.instance.errorCode(response.statusCode));
    // }
    return mediaList;
  }

  @override
  Future<void> addItemToBookmarkList(AddItemModel addItemModel) async {
    // final request = HttpRequest(
    //   '/bookmarks/{id}/add',
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
  }
}


List<BookmarkListItem> bookmarkLists = [
  BookmarkListItem(id: 0, title: "Happiness", types: []),
  BookmarkListItem(id: 1, title: "Sadness", types: []),
  BookmarkListItem(id: 2, title: "Best", types: []),
  BookmarkListItem(id: 3, title: "To watch", types: []),
  BookmarkListItem(id: 4, title: "Others", types: []),
];

List<MediaMetadataModel> mediaList = [
  MediaMetadataModel(
    "m1",
    "Movie",
    "The Shawshank Redemption",
    "https://images.pathe-thuis.nl/23470_450x640.jpg",
    {"director": "Frank Darabont", "genre": "Drama", "productionYear": "1994"},
  ),
  MediaMetadataModel(
    "b1",
    "Book",
    "To Kill a Mockingbird",
    "https://encyclopediaofalabama.org/wp-content/uploads/2023/02/m-2908.jpg",
    {"writer": "Harper Lee", "genre": "Classic", "pages": "281"},
  ),
  MediaMetadataModel(
    "mu1",
    "Music",
    "Stairway to Heaven",
    "https://upload.wikimedia.org/wikipedia/commons/4/4b/Stairway_to_Heaven_by_Led_Zeppelin_US_promotional_single.png",
    {"duration": "8:02", "style": "Rock", "singer": "Led Zeppelin"},
  ),
  MediaMetadataModel(
    "p1",
    "Podcast",
    "Serial",
    "https://ww2.kqed.org/app/uploads/sites/23/2015/03/Serial-iPhone.jpg",
    {
      "duration": "30-60 minutes",
      "producer": "Sarah Koenig",
      "genre": "True Crime"
    },
  ),
  MediaMetadataModel(
    "m2",
    "Movie",
    "The Godfather",
    "https://static.wikia.nocookie.net/godfather/images/4/47/The_Godfather.jpg/revision/latest?cb=20100520182354",
    {
      "director": "Francis Ford Coppola",
      "genre": "Crime",
      "productionYear": "1972"
    },
  ),
  MediaMetadataModel(
    "b2",
    "Book",
    "1984",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgXnem1GNKWsgULAIZQUB7xpO7mVJfhnxBcsBbxA23XTi7YbjOmo_MPn-V___4sQWEy7g&usqp=CAU",
    {"writer": "George Orwell", "genre": "Dystopian Fiction", "pages": "328"},
  ),
  MediaMetadataModel(
    "mu2",
    "Music",
    "Bohemian Rhapsody",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQza68ybLR0U3OtZOsMQZLdRQVbc0hY4yDasylKwbP0t4zXlQ0QOqQFu6zchSiOQ3P_SaQ&usqp=CAU",
    {"duration": "5:55", "style": "Rock", "singer": "Queen"},
  ),
  MediaMetadataModel(
    "p2",
    "Podcast",
    "Criminal",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx589hbcxbKw4xZ3PtQHEhr5wlU_c7dGkfr9pTglEP9eQJsN1MeA_qUljTCNdT863ojiQ&usqp=CAU",
    {
      "duration": "20-45 minutes",
      "producer": "Phoebe Judge",
      "genre": "True Crime"
    },
  ),
  MediaMetadataModel(
    "m3",
    "Movie",
    "The Dark Knight",
    "https://soundvapors.com/wp-content/uploads/2020/06/The-Dark-Knight-Rises-830x1245.jpg",
    {
      "director": "Christopher Nolan",
      "genre": "Action",
      "productionYear": "2008"
    },
  ),
  MediaMetadataModel(
    "b3",
    "Book",
    "The Catcher in the Rye",
    "https://kbimages1-a.akamaihd.net/264004f8-0018-4ec9-a503-eb3a686cb26e/353/569/90/False/j-d-salinger-s-the-catcher-in-the-rye-4.jpg",
    {"writer": "J.D. Salinger", "genre": "Classic", "pages": "277"},
  )
];