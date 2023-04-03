import 'package:supermedia/layers/data/data_sources/remote/remote_user_data_source.dart';
import 'package:supermedia/layers/data/http_client/dio_http_client.dart';
import 'package:supermedia/layers/data/repositories/user_repository_impl.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';

class NetworkModule {
  RemoteUserDataSource provideRemoteUserDataSource() {
    return RemoteUserDataSourceImpl(
      httpClient: DioHttpClient(baseUrl: 'http://localhost:1000/'),
    );
  }

  UserRepository provideUserRepository() {
    return UserRepositoryImpl(
      remoteDataSource: provideRemoteUserDataSource(),
    );
  }
}
