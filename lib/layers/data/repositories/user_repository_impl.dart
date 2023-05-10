import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/local_data_source.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_user_data_source.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource _remoteDataSource = locator<RemoteUserDataSource>();
  final LocalDataSource _localDataSource = locator<LocalDataSource>();

  @override
  Future<void> signUpWithGoogle() async {
    final userModel = await _remoteDataSource.signInWithGoogle();
    // TODO send it to the server
    await _localDataSource.storeToken(userModel.token);
  }
}