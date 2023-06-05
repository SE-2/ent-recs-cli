import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermedia/common/locale/app_locale_bloc.dart';
import 'package:supermedia/common/theme/app_theme_bloc.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/local_data_source.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_media_data_source.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_user_data_source.dart';
import 'package:supermedia/layers/data/data_sources/local/local_data_source.dart';
import 'package:supermedia/layers/data/data_sources/remote/remote_user_data_source_impl.dart';
import 'package:supermedia/layers/data/http_client/dio_http_client.dart';
import 'package:supermedia/layers/data/http_client/http_client.dart';
import 'package:supermedia/layers/data/data_sources/remote/remote_media_data_source_impl.dart';
import 'package:supermedia/layers/data/http_client/token_provide_impl.dart';
import 'package:supermedia/layers/data/http_client/token_provider.dart';
import 'package:supermedia/layers/data/repositories/media_repository_impl.dart';
import 'package:supermedia/layers/data/repositories/user_repository_impl.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';
import 'package:supermedia/layers/domain/repositories/user_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/abstract_profile_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/media_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/questionnaire_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/recent_items_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/search_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/signup_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/splash_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/trend_items_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/abstract_profile_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/media_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/questionnaire_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/recent_items_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/recommend_use_case.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/recommend_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/search_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/splash_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/implementations/trend_items_use_case_impl.dart';
import 'package:supermedia/layers/domain/use_cases/signup_use_case.dart';
import 'package:supermedia/layers/presentation/home/bloc/profile/abstract_profile_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/explore/explore_bloc.dart';
import 'package:supermedia/layers/presentation/questionnaire/bloc/questionnaire_bloc.dart';
import 'package:supermedia/layers/presentation/media/bloc/media_bloc.dart';
import 'package:supermedia/layers/presentation/media/screens/show_media_screen.dart';
import 'package:supermedia/layers/presentation/auth/signup/bloc/signup_bloc.dart';
import 'package:supermedia/layers/presentation/auth/signup/screens/signup_screen.dart';
import 'package:supermedia/layers/presentation/home/bloc/recent_items/recent_items_bloc.dart';
import 'package:supermedia/layers/presentation/home/bloc/trend_items/trend_items_bloc.dart';
import 'package:supermedia/layers/presentation/home/screens/home_screen.dart';
import 'package:supermedia/layers/presentation/recommend/screens/recommend_screen.dart';
import 'package:supermedia/layers/presentation/recommend/bloc/recommend_bloc.dart';
import 'package:supermedia/layers/presentation/search/bloc/search_bloc.dart';
import 'package:supermedia/layers/presentation/search/screens/search_screen.dart';
import 'package:supermedia/layers/presentation/setting/screens/settings_screen.dart';
import 'package:supermedia/layers/presentation/splash/screens/splashScreen.dart';

import '../layers/data/data_sources/remote/remote_user_data_source_impl.dart';
import '../layers/presentation/splash/bloc/splash_bloc.dart';

final locator = GetIt.instance;

void _setupHttpClient() {
  locator.registerLazySingleton<IHttpClient>(
      () => DioHttpClient(baseUrl: 'http://5.34.201.62:8080/'));
  locator.registerLazySingleton<TokenProvider>(
      () => TokenProviderImpl()
  );
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

void _setupThirdPartyLibraries() {
  locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn(
        scopes: [
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
        clientId:
            '355571272838-hj8sfomh23finum1nbbg2g35nqvh31tv.apps.googleusercontent.com',
      ));
}

void _setupRepositories() {
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  locator.registerLazySingleton<MediaRepository>(() => MediaRepositoryImp());
}

void _setupUseCases() {
  locator.registerLazySingleton<SignUpUseCase>(() => SignUpUseCaseImpl());
  locator.registerLazySingleton<SearchUseCase>(() => SearchUseCaseImpl());
  locator.registerLazySingleton<RecentItemsUseCase>(
      () => RecentItemsUseCaseImpl());
  locator
      .registerLazySingleton<TrendItemsUseCase>(() => TrendItemsUseCaseImpl());
  locator.registerLazySingleton<RecommendUseCase>(() => RecommendUseCaseImpl());
  locator.registerLazySingleton<MediaUseCase>(() => MediaUseCaseImpl());
  locator.registerLazySingleton<AbstractProfileUseCase>(() => AbstractProfileUseCaseImpl());
  locator.registerLazySingleton<SplashUseCase>(() => SplashUseCaseImpl());
  locator.registerLazySingleton<QuestionnaireUseCase>(() => QuestionnaireUseCaseImpl());
}

void _setupScreens() {
  locator.registerLazySingleton<SignupScreen>(() => const SignupScreen());
  locator.registerLazySingleton<SettingsScreen>(() => const SettingsScreen());
  locator.registerLazySingleton<ShowMediaScreen>(() => const ShowMediaScreen(
        id: null,
      ));
  locator.registerLazySingleton<HomeScreen>(() => const HomeScreen());
  locator.registerLazySingleton<SearchScreen>(() => const SearchScreen());
  locator.registerLazySingleton<RecommendScreen>(() => const RecommendScreen());
  locator.registerLazySingleton<SplashScreen>(() => const SplashScreen());
}

void _setupBlocs() {
  locator.registerFactory<AppThemeBloc>(() => AppThemeBloc());
  locator.registerFactory<AppLocaleBloc>(() => AppLocaleBloc());
  locator.registerFactory<SignupBloc>(() => SignupBloc());
  locator.registerFactory<SearchBloc>(() => SearchBloc());
  locator.registerFactory<TrendItemsBloc>(() => TrendItemsBloc());
  locator.registerFactory<RecentItemsBloc>(() => RecentItemsBloc());
  locator.registerFactory<RecommendBloc>(() => RecommendBloc());
  locator.registerFactory<MediaBloc>(() => MediaBloc());
  locator.registerFactory<QuestionnaireBloc>(() => QuestionnaireBloc());
  locator.registerFactory<ExploreBloc>(() => ExploreBloc());
  locator.registerFactory<AbstractProfileBloc>(() => AbstractProfileBloc());
  locator.registerFactory<SplashBloc>(() => SplashBloc());
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
  _setupThirdPartyLibraries();

  await locator.allReady();
}
