import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/user.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/signup_use_case.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase _signupUseCase = locator<SignUpUseCase>();

  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      if (event is SignupButtonPressed) {
        emit(SignupLoading());
        try {
          final user = await _signupUseCase.signUp(event.email, event.password);
          emit(SignupSuccess(user: user));
        } catch (e) {
          emit(SignupFailure(error: e.toString()));
        }
      }
    });
  }
}

/*
class GoogleSignInBloc {
  final _currentUserController = StreamController<User?>();

  void _init() async {
    final currentUser = await _authRepository.getCurrentUser();
    _currentUserController.add(currentUser);
  }

  Stream<User?> get currentUser => _currentUserController.stream;

  void signInWithGoogle() async {
    final user = await _authRepository.signInWithGoogle();
    _currentUserController.add(user);
  }

  void signOut() async {
    await _authRepository.signOut();
    _currentUserController.add(null);
  }

  void dispose() {
    _currentUserController.close();
  }
}*/
