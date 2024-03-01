import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/controller/flash_meter_theme_provider.dart';
import 'package:flash_meter/view/flash_meter_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  FlashMeterController controller = FlashMeterController(preferences);
  // ThemeProvider themeController = ThemeProvider();
  TextEditingController titleController = TextEditingController();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(controller, titleController),
    ),
  );
}

class MyApp extends StatefulWidget {
  final FlashMeterController controller;
  final TextEditingController titleController;

  MyApp(this.controller, this.titleController);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      // theme: themeProvider.themeData,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // themeMode: ,
      debugShowCheckedModeBanner: false,
      home: FlashMeterApp(widget.controller),
    );
  }
}
