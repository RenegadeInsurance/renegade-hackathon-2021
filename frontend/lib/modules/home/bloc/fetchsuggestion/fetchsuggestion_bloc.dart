import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:we_alert/modules/home/models/fetchaddresssuggestionmodels/suggestions.dart';
import 'package:we_alert/modules/home/repository/fetchaddresssugestion/fetchaddresssuggestion_impl.dart';
part 'fetchsuggestion_event.dart';
part 'fetchsuggestion_state.dart';

class FetchsuggestionBloc
    extends Bloc<FetchsuggestionEvent, FetchsuggestionState> {
  final FetchAddressSuggestion _fetchAddressSuggestion;
  FetchsuggestionBloc({required FetchAddressSuggestion fetchAddressSuggestion})
      : _fetchAddressSuggestion = fetchAddressSuggestion,
        super(FetchsuggestionInitial());

  @override
  Stream<Transition<FetchsuggestionEvent, FetchsuggestionState>>
      transformEvents(Stream<FetchsuggestionEvent> events, transitionFn) {
    return events
        .debounceTime(const Duration(milliseconds: 500))
        .switchMap((transitionFn));
  }

  @override
  Stream<FetchsuggestionState> mapEventToState(
    FetchsuggestionEvent event,
  ) async* {
    if (event is FetchSuggestion) {
      yield FetchsuggestionLoading();
      try {
        List<Suggestion> fetchedsuggestions = await _fetchAddressSuggestion
            .fetchSuggestions(event.querytext, 'en');
        yield FetchsuggestionLoaded(fetchedsuggestions: fetchedsuggestions);
      } catch (e) {
        yield FetchsuggestionError();
      }
    }
  }
}
