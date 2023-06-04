import 'package:google_sign_in/google_sign_in.dart';
import 'package:supermedia/common/exceptions/search_exception.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_user_data_source.dart';
import 'package:supermedia/layers/data/http_client/http_client.dart';
import 'package:supermedia/layers/data/models/new_user_model.dart';
import 'package:supermedia/layers/data/models/userAbstractInfo.dart';
import 'package:supermedia/layers/data/models/user_model.dart';


class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final GoogleSignIn _googleSignIn = locator<GoogleSignIn>();
  final IHttpClient _httpClient = locator<IHttpClient>();

  @override
  Future<UserModel> signInWithGoogle() async {
    final account = await _googleSignIn.signIn();
    final auth = await account!.authentication;

    final userModel = UserModel(
        token: auth.idToken!,
        email: account.email,
        name: account.displayName!,
        photoUrl: account.photoUrl!
    );
    return userModel;
  }

  @override
  Future<void> createNewUser(NewUserModel newUserModel) async {
    final request = HttpRequest(
      '/signup',
      body: newUserModel.toJson(),
    );

    try {
      var response = await _httpClient.post(request);
      if (response.statusCode == 201) {}
    } on Exception catch(e){
      throw SearchException('Check your internet connection.');
    }
  }


  @override
  Future<UserAbstractInfo> getUserInfo() async {
    final request = HttpRequest(
      '/getUser',
    );

    try {
      var response = await _httpClient.get(request);
      if (response.statusCode == 201) {
        return UserAbstractInfo.fromJson(response.body);
      }
      else {
        throw SearchException(
            AppLocalization.instance.errorCode(response.statusCode)
        );
      }
    } on Exception catch(e){
      throw SearchException('Check your internet connection.');
    }
  }
}

