import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/media_use_case.dart';
import 'package:supermedia/layers/presentation/media/bloc/media_event.dart';
import 'package:supermedia/layers/presentation/media/bloc/media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  final MediaUseCase _mediaUseCase = locator<MediaUseCase>();

  MediaBloc() : super(MediaInitial()) {
    on<MediaEvent>(
      
      (event, emit) async {
        if (event is LoadMedia) {
          emit(MediaLoading());
          try {
            var media = await _mediaUseCase.getMediaById(event.id);
            emit(MediaSuccess(result: media));
          } catch (e) {
            emit(MediaFailure(error: e.toString()));
          }
        } else if (event is LikeButtonPressed) {
          var likes = await _mediaUseCase.like(event.mediaId);
          emit(MediaLiked(likes));
        }
      },
    );
  }
}
