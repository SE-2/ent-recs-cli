import 'package:supermedia/layers/data/models/new_user_model.dart';
import 'package:supermedia/layers/data/models/userAbstractInfo.dart';
import 'package:supermedia/layers/data/models/user_model.dart';

abstract class RemoteUserDataSource {
  Future<UserModel> signInWithGoogle();
  Future<void> createNewUser(NewUserModel newUserModel);
  Future<UserAbstractInfo> getUserInfo();
}
