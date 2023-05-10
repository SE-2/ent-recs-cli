import 'package:supermedia/layers/data/models/user_model.dart';

abstract class SignUpUseCase {
  Future<UserModel> signUpWithGoogle();
}
