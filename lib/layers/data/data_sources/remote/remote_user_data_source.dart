import 'package:get_it/get_it.dart';
import 'package:supermedia/common/app_exceptions.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/layers/data/http_client/http_client.dart';
import 'package:supermedia/layers/data/models/user_model.dart';

abstract class RemoteUserDataSource {
  Future<UserModel> signUp(String email, String password);
}

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final IHttpClient _httpClient = GetIt.I<IHttpClient>();

  @override
  Future<UserModel> signUp(String email, String password) async {
    final request = HttpRequest(
      '/signup',
      headers: {'Content-Type': 'application/json'},
      body: {'email': email, 'password': password},
    );

    final response = await _httpClient.post(request);

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    } else {
      throw SignupException(
          AppLocalization.instance.errorCode(response.statusCode));
    }
  }
}
