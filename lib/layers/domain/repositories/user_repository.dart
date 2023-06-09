import 'package:supermedia/layers/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> signUpWithGoogle();
  Future<UserModel> getUser();
  Future<bool> isLoggedIn();
}
