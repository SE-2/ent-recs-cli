import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/local_data_source.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_user_data_source.dart';
import 'package:supermedia/layers/data/models/new_user_model.dart';
import 'package:supermedia/layers/data/models/user_model.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource _remoteDataSource = locator<RemoteUserDataSource>();
  final LocalDataSource _localDataSource = locator<LocalDataSource>();

  @override
  Future<UserModel> signUpWithGoogle() async {
    final userModel = await _remoteDataSource.signInWithGoogle();
    var userToken = userModel.token.substring(0, 254);
    await _remoteDataSource.createNewUser(NewUserModel(
      token: userToken,
      name: userModel.name,
      email: userModel.email,
      birthDate: '',
      profileImgUrl: userModel.photoUrl
    ));
    await _localDataSource.storeToken(userToken);
    return userModel;
  }

  @override
  Future<UserModel> getUser() async {
    final userAbstract = await _remoteDataSource.getUserInfo();
    return UserModel(name: userAbstract.name, photoUrl: userAbstract.profileImgUrl!);
  }

  @override
  Future<bool> isLoggedIn() async {
    var token = _localDataSource.getToken();
    var isLoggedIn = token != null? token.isNotEmpty : false;
    return isLoggedIn;
  }
}