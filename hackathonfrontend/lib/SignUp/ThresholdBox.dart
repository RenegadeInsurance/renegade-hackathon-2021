import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathonfrontend/Services/InitiateThreshold.dart';
import 'package:hackathonfrontend/components/Button.dart';
import 'package:hackathonfrontend/components/Presets.dart';

import '../data.dart';

class ThresholdBox extends StatefulWidget {
  const ThresholdBox({Key? key}) : super(key: key);

  @override
  State<ThresholdBox> createState() => _ThresholdBoxState();
}

class _ThresholdBoxState extends State<ThresholdBox> {
  bool disabled = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.hardEdge,
        child: Material(
          color: const Color(0xff0B122F),
          child: SizedBox(
            height: 150,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration:
                            textFieldDecoration("Threshold", "Threshold"),
                        controller: controller,
                      ),
                    ),
                  ),
                  !disabled
                      ? Button("Confirm", () {
                          setState(() {
                            disabled = true;
                          });
                          Geolocator.getCurrentPosition().then((value) {
                            InitialThresholdService().sendInitialThreshold(
                                meUser!.userID,
                                double.parse(controller.text),
                                value.latitude,
                                value.longitude);
                            Navigator.pop(context);
                            setState(() {
                              disabled = false;
                            });
                          });
                        }, Colors.blue, Icons.add, false)
                      : Container(
                          clipBehavior: Clip.hardEdge,
                          decoration:
                              BoxDecoration(borderRadius: borderRadius12()),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                color: Colors.blue,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
