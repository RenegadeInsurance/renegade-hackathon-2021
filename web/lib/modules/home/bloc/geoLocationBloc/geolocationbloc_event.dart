part of 'geolocationbloc_bloc.dart';

abstract class GeolocationblocEvent extends Equatable {
  const GeolocationblocEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentLocationEvent extends GeolocationblocEvent {}

class DisableHomeAlert extends GeolocationblocEvent {}

class GetLocationFromDB extends GeolocationblocEvent {
  final double latitude;
  final double longitude;
  const GetLocationFromDB({
    required this.latitude,
    required this.longitude,
  });
}

class FetchAddressDetails extends GeolocationblocEvent {
  final String placeId;
  const FetchAddressDetails({required this.placeId});
  @override
  List<Object> get props => [placeId];
}

class SetStateToInitial extends GeolocationblocEvent {}
