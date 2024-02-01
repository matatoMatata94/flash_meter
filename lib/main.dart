import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/view/flash_meter_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlashMeterController controller = FlashMeterController();

    return MaterialApp(
      home: FlashMeterApp(),
    );
  }
}
