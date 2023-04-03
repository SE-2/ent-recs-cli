import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/layers/domain/entities/user.dart';
import 'package:supermedia/layers/domain/use_cases/signup_use_case.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase _signupUseCase;

  SignupBloc({required SignUpUseCase signupUseCase})
      : _signupUseCase = signupUseCase,
        super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupButtonPressed) {
        emit(SignupLoading());
        try {
          final user =
              await _signupUseCase.signUp(event.email, event.password);
          emit(SignupSuccess(user: user));
        } catch (e) {
          emit(SignupFailure(error: e.toString()));
        }
      }
    });
  }
}
