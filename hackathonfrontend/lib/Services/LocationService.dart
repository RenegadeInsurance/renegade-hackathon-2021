import 'dart:convert';

import 'package:hackathonfrontend/Entity/Location.dart';
import 'package:http/http.dart' as http;

import '../data.dart';

class LocationService {
  final String getUrl = "$localhost/location/";
  final String postUrl = "$localhost/location/insert/";
  final String updateUrl = "$localhost/location/update/";

  Future<List<Location>> fetchLocations() async {
    final response = await http.get(Uri.parse(getUrl));
    List<dynamic> values = jsonDecode(response.body);
    List<Location> locations = values.map((e) => Location.fromJson(e)).toList();
    if (response.statusCode == 200) {
      return locations;
    } else {
      throw Exception("failed to load post");
    }
  }

  Future<int> postLocation(
    String country,
    String state,
    String city,
  ) async {
    final response = await http.post(
      Uri.parse(postUrl),
      body: <String, String>{
        "country": country.toString(),
        "state": state.toString(),
        "city": city.toString(),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return int.parse(jsonDecode(response.body));
    } else {
      return -1;
    }
  }

  Future<bool> updateLocation(Location location) async {
    final res = await http.put(
      Uri.parse(updateUrl),
      body: <String, String>{
        "locationID": location.locationID.toString(),
        "country": location.country.toString(),
        "state": location.state.toString(),
        "city": location.city.toString(),
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
