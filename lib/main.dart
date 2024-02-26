import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/controller/flash_meter_theme_controller.dart';
import 'package:flash_meter/view/flash_meter_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  FlashMeterController controller = FlashMeterController(preferences);
  ThemeController themeController = ThemeController();
  TextEditingController titleController = TextEditingController();
  runApp(MyApp(controller, titleController, themeController));
}

class MyApp extends StatefulWidget {
  final FlashMeterController controller;
  final TextEditingController titleController;
  final ThemeController themeController;

  MyApp(this.controller, this.titleController, this.themeController);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: FlashMeterApp(widget.controller, widget.themeController),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
