import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/splash_use_case.dart';
import 'package:supermedia/layers/presentation/splash/bloc/splash_event.dart';
import 'package:supermedia/layers/presentation/splash/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashUseCase _splashUseCase = locator<SplashUseCase>();

  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>(
      (event, emit) async {
        if (event is SplashCheckLoginStatus) {
          Future.delayed(const Duration(milliseconds: 1000), () {} );
            try {
            var result = await _splashUseCase.isLoggedIn();
            emit(SplashSuccess(isLoggedIn: result));
          } catch (e) {
            emit(SplashFailure(error: e.toString()));
          }
        }
      },
    );
  }
}
