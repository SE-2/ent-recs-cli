import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermedia/common/locale/app_locale_bloc.dart';
import 'package:supermedia/common/theme/app_theme_bloc.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/local_data_source.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_media_data_source.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_user_data_source.dart';
import 'package:supermedia/layers/data/data_sources/local/local_data_source.dart';
import 'package:supermedia/layers/data/data_sources/remote/remote_user_data_source.dart';
import 'package:supermedia/layers/data/http_client/dio_http_client.dart';
import 'package:supermedia/layers/data/http_client/http_client.dart';
import 'package:supermedia/layers/data/data_sources/remote/remote_media_data_source_impl.dart';
import 'package:supermedia/layers/data/repositories/media_repository_impl.dart';
import 'package:supermedia/layers/data/repositories/user_repository_impl.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/search_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/signup_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/search_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/signup_use_case.dart';
import 'package:supermedia/layers/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';
import 'package:supermedia/layers/presentation/search/bloc/search_bloc.dart';
import 'package:supermedia/layers/presentation/search/screens/search_screen.dart';
import 'package:supermedia/layers/presentation/settings/screens/settings_screen.dart';

final locator = GetIt.instance;

void _setupHttpClient() {
  locator.registerLazySingleton<IHttpClient>(
      () => DioHttpClient(baseUrl: 'http://localhost:1000/'));
}

void _setupLocalDataSources() {
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}

void _setupRemoteDataSources() {
  locator.registerLazySingleton<RemoteUserDataSource>(
      () => RemoteUserDataSourceImpl());
  locator.registerLazySingleton<RemoteMediaDataSource>(
      () => RemoteMediaDataSourceImpl());
}

void _setupRepositories() {
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  locator.registerLazySingleton<MediaRepository>(() => MediaRepositoryImp());
}

void _setupUseCases() {
  locator.registerLazySingleton<SignUpUseCase>(() => SignUpUseCaseImpl());
  locator.registerLazySingleton<SearchUseCase>(() => SearchUseCaseImpl());
}

void _setupScreens() {
  locator.registerLazySingleton<SignupScreen>(() => const SignupScreen());
  locator.registerLazySingleton<SettingsScreen>(() => const SettingsScreen());
  locator.registerLazySingleton<SearchScreen>(() => const SearchScreen());
}

void _setupBlocs() {
  locator.registerFactory<AppThemeBloc>(() => AppThemeBloc());
  locator.registerFactory<AppLocaleBloc>(() => AppLocaleBloc());
  locator.registerFactory<SignupBloc>(() => SignupBloc());
  locator.registerFactory<SearchBloc>(() => SearchBloc());
}

void _setupSharedPreferences() {
  locator.registerSingletonAsync(
      () async => await SharedPreferences.getInstance());
}

Future<void> setupLocator() async {
  _setupSharedPreferences();
  _setupLocalDataSources();
  _setupHttpClient();
  _setupRemoteDataSources();
  _setupRepositories();
  _setupUseCases();
  _setupBlocs();
  _setupScreens();

  await locator.allReady();
}
