import 'package:supermedia/layers/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> signUpWithGoogle();
}
