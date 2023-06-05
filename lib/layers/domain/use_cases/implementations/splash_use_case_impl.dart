import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/splash_use_case.dart';

class SplashUseCaseImpl implements SplashUseCase {
  final _userRepository = locator<UserRepository>();

  @override
  Future<bool> isLoggedIn() async{
    return _userRepository.isLoggedIn();
  }
}