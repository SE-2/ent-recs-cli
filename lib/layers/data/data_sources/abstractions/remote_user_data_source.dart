import 'package:supermedia/layers/data/models/user_model.dart';

abstract class RemoteUserDataSource {
  Future<UserModel> signUp(String email, String password);
}