import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/remote/remote_user_data_source.dart';
import 'package:supermedia/layers/domain/entities/user.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource _remoteDataSource = locator<RemoteUserDataSource>();

  @override
  Future<User> signUp(String email, String password) async {
    final userModel = await _remoteDataSource.signUp(email, password);
    return User(email: userModel.email, password: userModel.password);
  }
}
