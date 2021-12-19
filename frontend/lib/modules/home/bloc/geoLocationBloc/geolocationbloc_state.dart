part of 'geolocationbloc_bloc.dart';

enum GeoLocationStatus { uninitialized, loading, loaded, error }

class GeolocationblocState extends Equatable {
  final String message;
  final Position position;
  final Position currentPosition;
  final Set<Marker> markers;
  final bool showHomeAlert;
  final String? address;
  final GeoLocationStatus geoLocationStatus;
  const GeolocationblocState({
    required this.message,
    required this.position,
    required this.currentPosition,
    required this.markers,
    required this.showHomeAlert,
    this.address,
    required this.geoLocationStatus,
  });

  factory GeolocationblocState.initial() {
    return GeolocationblocState(
        message: '',
        currentPosition: Position(
            longitude: 10.0,
            latitude: 10.0,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1),
        position: Position(
            longitude: 10.0,
            latitude: 10.0,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1),
        address: " ",
        showHomeAlert: true,
        markers: const {},
        geoLocationStatus: GeoLocationStatus.uninitialized);
  }

  GeolocationblocState copyWith({
    String? message,
    Position? position,
    Set<Marker>? markers,
    Position? currentPosition,
    bool? showHomeAlert,
    String? address,
    GeoLocationStatus? geoLocationStatus,
  }) {
    return GeolocationblocState(
      currentPosition: currentPosition ?? this.currentPosition,
      showHomeAlert: showHomeAlert ?? this.showHomeAlert,
      message: message ?? this.message,
      position: position ?? this.position,
      markers: markers ?? this.markers,
      address: address ?? this.address,
      geoLocationStatus: geoLocationStatus ?? this.geoLocationStatus,
    );
  }

  @override
  List<Object?> get props => [
        message,
        currentPosition,
        position,
        markers,
        address,
        geoLocationStatus,
        showHomeAlert
      ];
}
