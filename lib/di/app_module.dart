import 'package:supermedia/di/network_module.dart';
import 'package:supermedia/di/storage_module.dart';
import 'package:supermedia/layers/domain/use_cases/signup_use_case.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';

class AppModule {
  final _networkModule = NetworkModule();
  final _storageModule = StorageModule();

  SignupScreen provideSignUpScreen() {
    final userRepository = _networkModule.provideUserRepository();
    final signupUseCase = SignUpUseCaseImpl(userRepository: userRepository);
    return SignupScreen(
      signupUseCase: signupUseCase,
    );
  }
}
