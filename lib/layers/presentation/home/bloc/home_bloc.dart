// class HomeBloc extends Bloc<HomeEvent, SignupState> {
//   // final UseCase _signupUseCase = locator<SignUpUseCase>();

//   HomeBloc() : super(HomeInitial()) {
//     on<SignupEvent>((event, emit) async {
//       if (event is SignupButtonPressed) {
//         emit(SignupLoading());
//         try {
//           final user = await _signupUseCase.signUp(event.email, event.password);
//           emit(SignupSuccess(user: user));
//         } catch (e) {
//           emit(SignupFailure(error: e.toString()));
//         }
//       }
//     });
//   }
// }