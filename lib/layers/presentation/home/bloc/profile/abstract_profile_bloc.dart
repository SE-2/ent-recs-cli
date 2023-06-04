import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/abstract_profile_use_case.dart';
import 'package:supermedia/layers/presentation/home/bloc/profile/abstract_profile_event.dart';
import 'package:supermedia/layers/presentation/home/bloc/profile/abstract_profile_state.dart';

class AbstractProfileBloc
    extends Bloc<AbstractProfileEvent, AbstractProfileState> {
  final AbstractProfileUseCase _abstractProfileBlocUseCase =
      locator<AbstractProfileUseCase>();

  AbstractProfileBloc() : super(AbstractProfileInitial()) {
    on<AbstractProfileEvent>(
      (event, emit) async {
        if (event is LoadAbstractProfile) {
          try {
            final result =
              await _abstractProfileBlocUseCase.getAbstractProfile();
              emit(AbstractProfileFetched(result: result));
          } catch (e) {
            emit(AbstractProfileFailure(error: e.toString()));
          }
        }
      },
    );
  }
}
