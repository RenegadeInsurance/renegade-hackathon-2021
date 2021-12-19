part of 'fetchsuggestion_bloc.dart';

abstract class FetchsuggestionState extends Equatable {
  const FetchsuggestionState();

  @override
  List<Object> get props => [];
}

class FetchsuggestionInitial extends FetchsuggestionState {}

class FetchsuggestionLoading extends FetchsuggestionState {}

class FetchsuggestionLoaded extends FetchsuggestionState {
  final List<Suggestion>? fetchedsuggestions;
  const FetchsuggestionLoaded({required this.fetchedsuggestions});
}

class FetchsuggestionError extends FetchsuggestionState {}
