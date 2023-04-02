import 'package:supermedia/layers/data/data_sources/remote_user_data_source.dart';
import 'package:supermedia/layers/domain/entities/user.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource _remoteDataSource;

  UserRepositoryImpl({required RemoteUserDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<User> signUp(String email, String password) async {
    final userModel = await _remoteDataSource.signup(email, password);
    return User(email: userModel.email, password: userModel.password);
  }
}
