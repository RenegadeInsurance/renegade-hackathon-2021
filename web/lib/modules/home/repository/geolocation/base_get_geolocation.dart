import 'package:geolocator/geolocator.dart';

//Base class for getting current location
//Provides function definition for GetGeoLocationRepository class.
abstract class GetMyGeoLocation {
  //Funtion to get the current locarion.
  Future<Position?> getMyCurrentLocation() async {}
}
