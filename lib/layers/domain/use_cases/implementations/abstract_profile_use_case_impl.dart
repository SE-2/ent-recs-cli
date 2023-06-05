import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/data/models/user_model.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/abstract_profile_use_case.dart';

class AbstractProfileUseCaseImpl implements AbstractProfileUseCase {
  final _userRepository = locator<UserRepository>();

  Future<UserModel> getAbstractProfile() async {
    return _userRepository.getUser();
  }
}