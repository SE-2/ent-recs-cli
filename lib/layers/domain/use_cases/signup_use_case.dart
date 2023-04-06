import 'package:supermedia/common/exceptions/signup_exception.dart';
import 'package:supermedia/common/utils/app_localization.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/user.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/signup_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  final UserRepository _userRepository = locator<UserRepository>();

  @override
  Future<User> signUp(String email, String password) async {
    try {
      return await _userRepository.signUp(email, password);
    } on SignupException catch (e) {
      throw SignupException(
          AppLocalization.instance.registrationFailed(e.message));
    } catch (e) {
      throw SignupException(AppLocalization.instance
          .registrationFailed(AppLocalization.instance.unknownErrorOccurred));
    }
  }
}
