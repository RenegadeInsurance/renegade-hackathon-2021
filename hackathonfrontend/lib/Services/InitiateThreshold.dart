import '../data.dart';

import 'package:http/http.dart' as http;

class InitialThresholdService {
  void sendInitialThreshold(int userID, double threshold, double latitude, double longitude) {
    const String url = "$localhost/initiatethreshold/";

    http.post(
      Uri.parse(url),
      body: <String, String>{
        "userID": userID.toString(),
        "threshold": threshold.toString(),
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
      },
    );
  }
}
