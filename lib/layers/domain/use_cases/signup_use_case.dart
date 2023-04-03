import 'package:get_it/get_it.dart';
import 'package:supermedia/common/app_exceptions.dart';
import 'package:supermedia/common/utils/lang_util.dart';
import 'package:supermedia/common/utils/validators.dart';
import 'package:supermedia/layers/domain/entities/user.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class SignUpUseCase {
  Future<User> signUp(String email, String password);
}

class SignUpUseCaseImpl implements SignUpUseCase {
  final UserRepository _userRepository = GetIt.I<UserRepository>();

  @override
  Future<User> signUp(String email, String password) async {
    final emailError = Validators.validateEmail(email);
    if (emailError != null) {
      throw ArgumentError(emailError);
    }

    final passwordError = Validators.validatePassword(password);
    if (passwordError != null) {
      throw ArgumentError(passwordError);
    }

    try {
      return await _userRepository.signUp(email, password);
    } catch (e) {
      // todo get context from di and uses localization
      throw SignupException('An unexpected error occurred: ${e.toString()}');
    }
  }
}
