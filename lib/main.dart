import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/view/flash_meter_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  FlashMeterController controller = FlashMeterController(preferences);
  TextEditingController titleController = TextEditingController();
  runApp(MyApp(controller, titleController));
}

class MyApp extends StatelessWidget {
  final FlashMeterController controller;
  final TextEditingController titleController;

  MyApp(this.controller, this.titleController);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlashMeterApp(controller),
    );
  }
}
