part of 'forum_cubit.dart';

enum QuestionStatus { loading, loaded, error }

class ForumState extends Equatable {
  final String fullName;
  final String email;
  final String age;
  final String? gender;
  final String contact;
  final double latitude;
  final double longitude;
  final QuestionareModel? questions;
  final String surveyResult;
  final QuestionStatus questionStatus;
  final Option? selectedOption;
  final List<AlertPersonnelModel> alertPersonnelModel;
  const ForumState({
    required this.fullName,
    required this.email,
    required this.age,
    this.gender,
    this.questions,
    this.selectedOption,
    required this.questionStatus,
    required this.contact,
    required this.latitude,
    required this.longitude,
    required this.surveyResult,
    required this.alertPersonnelModel,
  });
  @override
  List<Object?> get props => [
        fullName,
        email,
        age,
        selectedOption,
        gender,
        questions,
        contact,
        latitude,
        longitude,
        questionStatus,
        surveyResult,
        alertPersonnelModel
      ];

  factory ForumState.initial() => const ForumState(
      fullName: '',
      email: '',
      age: '',
      questionStatus: QuestionStatus.loading,
      contact: '',
      latitude: 0.0,
      longitude: 0.0,
      surveyResult: 'Incomplete',
      alertPersonnelModel: []);

  ForumState copyWith({
    String? fullName,
    String? email,
    String? age,
    String? gender,
    String? contact,
    QuestionareModel? questions,
    QuestionStatus? questionStatus,
    double? latitude,
    Option? selectedOption,
    double? longitude,
    String? surveyResult,
    List<AlertPersonnelModel>? alertPersonnelModel,
  }) {
    return ForumState(
      questions: questions,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      age: age ?? this.age,
      selectedOption: selectedOption,
      questionStatus: questionStatus ?? this.questionStatus,
      gender: gender ?? this.gender,
      contact: contact ?? this.contact,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      surveyResult: surveyResult ?? this.surveyResult,
      alertPersonnelModel: alertPersonnelModel ?? this.alertPersonnelModel,
    );
  }
}
