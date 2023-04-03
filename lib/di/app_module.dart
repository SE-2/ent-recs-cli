import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermedia/layers/data/data_sources/local/local_data_source.dart';
import 'package:supermedia/layers/data/data_sources/remote/remote_user_data_source.dart';
import 'package:supermedia/layers/data/http_client/dio_http_client.dart';
import 'package:supermedia/layers/data/http_client/http_client.dart';
import 'package:supermedia/layers/data/repositories/user_repository_impl.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';
import 'package:supermedia/layers/domain/use_cases/signup_use_case.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';

final getIt = GetIt.instance;

void _setupHttpClient() {
  getIt.registerLazySingleton<IHttpClient>(
      () => DioHttpClient(baseUrl: 'http://localhost:1000/'));
}

void _setupLocalDataSources() {
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}

void _setupRemoteDataSources() {
  getIt.registerLazySingleton<RemoteUserDataSource>(
      () => RemoteUserDataSourceImpl());
}

void _setupRepositories() {
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
}

void _setupUseCases() {
  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCaseImpl());
}

void _setupScreens() {
  getIt.registerLazySingleton<SignupScreen>(() => SignupScreen());
}

void _setupSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
}

void setupAppModule() {
  _setupHttpClient();
  _setupLocalDataSources();
  _setupRemoteDataSources();
  _setupRepositories();
  _setupUseCases();
  _setupScreens();
  _setupSharedPreferences();
}
