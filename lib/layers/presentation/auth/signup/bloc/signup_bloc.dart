import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/signup_use_case.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase _signupUseCase = locator<SignUpUseCase>();

  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupWithGoogleButtonPressed) {
        emit(SignupLoading());
        try {
          await _signupUseCase.signUpWithGoogle();
          emit(SignupSuccess());
        } catch (e) {
          emit(SignupFailure(error: e.toString()));
        }
      }
    });
  }
}
