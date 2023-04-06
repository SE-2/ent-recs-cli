import 'package:supermedia/layers/domain/entities/user.dart';

abstract class SignUpUseCase {
  Future<User> signUp(String email, String password);
}
