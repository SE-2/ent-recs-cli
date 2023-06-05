import 'package:supermedia/layers/data/models/user_model.dart';

abstract class AbstractProfileUseCase {
  Future<UserModel> getAbstractProfile();
}