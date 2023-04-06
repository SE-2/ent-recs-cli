import 'package:supermedia/layers/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> signUp(String email, String password);
}
