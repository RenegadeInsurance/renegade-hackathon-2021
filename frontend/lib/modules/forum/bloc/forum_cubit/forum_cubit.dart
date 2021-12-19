import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:we_alert/modules/forum/models/alert_personal_model.dart';
import 'package:we_alert/modules/forum/models/questionare_model.dart';
import 'package:we_alert/modules/forum/repository/get_question_repo.dart';

part 'forum_state.dart';

class ForumCubit extends Cubit<ForumState> {
  final GetQuestionRepo getQuestionRepo;
  ForumCubit({required this.getQuestionRepo}) : super(ForumState.initial()) {
    getFirstQuestion();
  }

  void changeName({required String name}) {
    emit(state.copyWith(fullName: name));
  }

  void changeEmail({required String email}) {
    emit(state.copyWith(age: email));
  }

  void changeAge({required String age}) {
    emit(state.copyWith(age: age));
  }

  void chnageGender({required String changeGender}) {
    emit(state.copyWith(gender: changeGender));
  }

  void updateLatLong({required double latitude, required double longitude}) {}

  void getFirstQuestion() async {
    emit(state.copyWith(questionStatus: QuestionStatus.loading));
    try {
      QuestionareModel questionareModel =
          await getQuestionRepo.getFirstQuestion();
      emit(state.copyWith(
          questions: questionareModel, questionStatus: QuestionStatus.loaded));
    } on Exception catch (e) {}
  }

  void getNexttQuestion({required String questionId}) async {
    emit(state.copyWith(
        questionStatus: QuestionStatus.loading, questions: null));
    try {
      QuestionareModel questionareModel =
          await getQuestionRepo.getNextQuestion(questionId: questionId);
      emit(state.copyWith(
          questions: questionareModel, questionStatus: QuestionStatus.loaded));
    } on Exception catch (e) {}
  }

  void changeSelectedOption({required Option selectedOption}) {
    emit(state.copyWith(
        selectedOption: Option(
            option: selectedOption.option,
            followQuestion: selectedOption.followQuestion,
            result: selectedOption.result)));
  }

  void changeSurveyResult({required String res}) {
    emit(state.copyWith(surveyResult: res));
  }
}
