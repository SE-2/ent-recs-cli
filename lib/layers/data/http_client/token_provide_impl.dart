import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/local_data_source.dart';
import 'package:supermedia/layers/data/http_client/token_provider.dart';

class TokenProviderImpl implements TokenProvider {
  final LocalDataSource _localDataSource = locator<LocalDataSource>();
  String? token;

  @override
  Future<String?> getToken() async {
    token ??= _localDataSource.getToken();
    return token;
  }
}