import 'package:supermedia/di/app_module.dart';
import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/domain/repositories/media_repository.dart';
import 'package:supermedia/layers/domain/use_cases/abstractoins/questionnaire_use_case.dart';
import 'package:supermedia/layers/presentation/questionnaire/screens/questionnaire_screen.dart';

class QuestionnaireUseCaseImpl implements QuestionnaireUseCase {
  final MediaRepository _mediaRepository = locator<MediaRepository>();

  @override
  Future<List<MediaCategory>> getMediaCategories(MediaType mediaType) async {
    return _mediaRepository.getMediaCategories(mediaType);
  }

  @override
  Future<void> submitUserInterests(MediaType mediaType, List<String> categories) async {
    return _mediaRepository.submitUserInterests(mediaType, categories);
  }

  @override
  Future<bool> isQuestionnaireFilled(MediaType mediaType) {
    return _mediaRepository.isQuestionnaireFilled(mediaType);
  }
}
