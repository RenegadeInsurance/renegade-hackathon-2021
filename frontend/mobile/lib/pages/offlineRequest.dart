import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class OfflineRequest extends StatefulWidget {
  const OfflineRequest({Key? key}) : super(key: key);

  @override
  _OfflineRequestState createState() => _OfflineRequestState();
}

class _OfflineRequestState extends State<OfflineRequest> {
  var _locationMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    setState(() {
      _locationMessage = "$position.latitude, $position.longitude";
    });

    launch('sms:+9779818634306?body=$lastPosition');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.announcement,
            size: 46,
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            child: const Text(
              'Ask Help!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              getCurrentLocation();
            },
          ),
          const Text(
            'Emergency Call: 100',
          ),
        ],
      ),
    );
  }
}
