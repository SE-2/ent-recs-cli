import 'package:supermedia/layers/domain/entities/media_metadata.dart';
import 'package:supermedia/layers/presentation/questionnaire/screens/questionnaire_screen.dart';

abstract class QuestionnaireUseCase {
  Future<List<MediaCategory>> getMediaCategories(MediaType mediaType);
  Future<void> submitUserInterests(MediaType mediaType, List<String> categories);
  Future<bool> isQuestionnaireFilled(MediaType mediaType);
}
