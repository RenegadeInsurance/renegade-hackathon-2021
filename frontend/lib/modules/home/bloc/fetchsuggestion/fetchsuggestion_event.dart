part of 'fetchsuggestion_bloc.dart';

abstract class FetchsuggestionEvent extends Equatable {
  const FetchsuggestionEvent();

  @override
  List<Object> get props => [];
}

class FetchSuggestion extends FetchsuggestionEvent {
  final String querytext;
  const FetchSuggestion({required this.querytext});
  @override
  List<Object> get props => [querytext];
}
