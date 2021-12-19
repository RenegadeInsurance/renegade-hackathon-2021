import 'package:geolocator/geolocator.dart';

import 'base_get_geolocation.dart';

class GetGeoLocationRepository extends GetMyGeoLocation {
  //Function for getting current location
  //We are using geolocator plugin to fetch the location based on Gps Device
  @override
  Future<Position> getMyCurrentLocation() async {
    //Return current position after fetching.
    //Position class provides latitide and longitude.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }
}
