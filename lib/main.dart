import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/controller/flash_meter_theme_provider.dart';
import 'package:flash_meter/view/flash_meter_view.dart';
import 'package:flash_meter/view/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  FlashMeterController controller = FlashMeterController(preferences);
  TextEditingController titleController = TextEditingController();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(controller, titleController),
    ),
  );
}

class MyApp extends StatelessWidget {
  final FlashMeterController controller;
  final TextEditingController titleController;

  MyApp(this.controller, this.titleController);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: AppTheme(themeProvider: themeProvider).themeData,
      debugShowCheckedModeBanner: false,
      home: FlashMeterApp(controller),
    );
  }
}
