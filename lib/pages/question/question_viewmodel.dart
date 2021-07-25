import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/api/api_exceptions.dart';
import 'package:msof_front/api/question_api.dart';
import 'package:msof_front/models/question/question.dart';
import 'package:msof_front/utils/loading_notifier_mixin.dart';

final questionViewModelProvider = ChangeNotifierProvider<QuestionViewModel>(
    (ref) => QuestionViewModel(ref.read));

class QuestionViewModel extends LoadingNotifierMixin {
  final QuestionAPI _questionApi;

  QuestionList? _questions;
  List<Question>? get questions {
    if (_questions != null) {
      return _questions!.questions ?? [];
    }
    return null;
  }

  Question? question;

  QuestionViewModel(Reader read) : _questionApi = read(questionApiProvider);

  Future<void> listQuestions() async {
    return whileLoading(
      () => _questionApi.list().then(
            (value) => value.maybeWhen(
              success: (response) {
                _questions = response;
              },
              failure: (error) => throw ApiExceptions.getErrorMessage(error),
              orElse: () {},
            ),
          ),
    );
  }

  Future<void> detailQuestion(int id) {
    return whileLoading(() => _questionApi.detail(id).then(
          (value) => value.maybeWhen(
            success: (response) {
              question = response;
            },
            failure: (error) => throw ApiExceptions.getErrorMessage(error),
            orElse: () {},
          ),
        ));
  }

  Future<void> createQuestion(String title, String content) async {
    question = null;
    return whileLoading(
      () => _questionApi.create(title, content).then(
            (result) => result.maybeWhen(
              success: (response) {
                question = response;
              },
              failure: (error) => throw ApiExceptions.getErrorMessage(error),
              orElse: () {},
            ),
          ),
    );
  }

  Future<void> deleteQuestion(int id) async {
    question = null;
    return whileLoading(
      () => _questionApi.delete(id).then(
            (result) => result.maybeWhen(
              success: (response) {
                question = null;
              },
              failure: (error) => throw ApiExceptions.getErrorMessage(error),
              orElse: () {},
            ),
          ),
    );
  }

  Future<void> updateQuestion(int id, String title, String content) async {
    question = null;
    return whileLoading(
      () => _questionApi.update(id, title, content).then(
            (result) => result.maybeWhen(
              success: (response) {},
              failure: (error) => throw ApiExceptions.getErrorMessage(error),
              orElse: () {},
            ),
          ),
    );
  }
}
