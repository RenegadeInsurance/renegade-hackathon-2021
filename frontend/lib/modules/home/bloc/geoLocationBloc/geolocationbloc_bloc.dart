import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:we_alert/modules/home/repository/fetchaddresssugestion/fetchaddresssuggestion_impl.dart';
import 'package:we_alert/modules/home/repository/geolocation/get_geolocation_impl.dart';
part 'geolocationbloc_event.dart';
part 'geolocationbloc_state.dart';

class GeolocationblocBloc
    extends Bloc<GeolocationblocEvent, GeolocationblocState> {
  final GetGeoLocationRepository _getGeoLocationRepository;
  final FetchAddressSuggestion _fetchAddressSuggestion;
  GeolocationblocBloc(
      {required GetGeoLocationRepository getGeoLocationRepository,
      required FetchAddressSuggestion fetchAddressSuggestion})
      : _getGeoLocationRepository = getGeoLocationRepository,
        _fetchAddressSuggestion = fetchAddressSuggestion,
        super(GeolocationblocState.initial()) {
    add(GetCurrentLocationEvent());
  }

  @override
  Stream<GeolocationblocState> mapEventToState(
    GeolocationblocEvent event,
  ) async* {
    if (event is GetCurrentLocationEvent) {
      yield state.copyWith(geoLocationStatus: GeoLocationStatus.loading);
      try {
        //Get the position from repository
        final Position position =
            await _getGeoLocationRepository.getMyCurrentLocation();
        //emit the loaded stated after geting position
        final Set<Marker> markers = {};

        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        yield state.copyWith(
            position: position,
            currentPosition: position,
            markers: markers,
            address: placemarks[0].name.toString().length > 1
                ? placemarks[0].name.toString()
                : "Unknown Place",
            geoLocationStatus: GeoLocationStatus.loaded);
      } catch (e) {
        //emit error state upon any wrror
        yield state.copyWith(message: e.toString());
      }
    } else if (event is GetLocationFromDB) {
      yield state.copyWith(geoLocationStatus: GeoLocationStatus.loading);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(event.latitude, event.longitude);
      final Set<Marker> markers = {};
      final Position position = Position(
        longitude: event.longitude,
        latitude: event.latitude,
        timestamp: DateTime.now(),
        speed: 1.0,
        accuracy: 1.0,
        altitude: 1.0,
        heading: 1.0,
        speedAccuracy: 1.0,
      );
      yield state.copyWith(
          position: position,
          markers: markers,
          address: placemarks[0].name.toString().length > 1
              ? placemarks[0].name.toString()
              : "Unknown Place",
          geoLocationStatus: GeoLocationStatus.loaded);
    } else if (event is DisableHomeAlert) {
      yield state.copyWith(showHomeAlert: false);
    } else if (event is FetchAddressDetails) {
      yield state.copyWith(geoLocationStatus: GeoLocationStatus.loading);
      try {
        //Get the position from repository
        var res =
            await _fetchAddressSuggestion.getPlaceDetailFromId(event.placeId);
        final Position position = Position(
          longitude: res.lang,
          latitude: res.lat,
          timestamp: DateTime.now(),
          speed: 1.0,
          accuracy: 1.0,
          altitude: 1.0,
          heading: 1.0,
          speedAccuracy: 1.0,
        );
        //emit the loaded stated after geting position
        final Set<Marker> markers = {};
        markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId("${res.lang}${res.lat}"),
          position: LatLng(res.lat, res.lang),
          infoWindow: const InfoWindow(
            // title is the address
            title: "Your Location",
          ),
          icon: BitmapDescriptor.defaultMarker,
        ));
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        yield state.copyWith(
            position: position,
            markers: markers,
            address: placemarks[0].name.toString().length > 1
                ? placemarks[0].name.toString()
                : "Unknown Place",
            geoLocationStatus: GeoLocationStatus.loaded);
      } catch (e) {
        //emit error state upon any wrror
        yield state.copyWith(message: e.toString());
      }
    } else if (event is SetStateToInitial) {
      yield state.copyWith(geoLocationStatus: GeoLocationStatus.uninitialized);
    }
  }
}
