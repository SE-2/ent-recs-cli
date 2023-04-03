import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:supermedia/layers/common/app_exceptions.dart';
import 'package:supermedia/layers/common/utils/validators.dart';
import 'package:supermedia/layers/domain/entities/user.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';

class SignupUseCase {
  final UserRepository _userRepository;

  SignupUseCase({required UserRepository userRepository})
      : _userRepository = userRepository;

  Future<User> execute(String email, String password) async {
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
