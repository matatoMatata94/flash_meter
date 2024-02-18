import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/view/pages/favorites_page.dart';
import 'package:flash_meter/view/pages/input_page.dart';
import 'package:flash_meter/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class FlashMeterApp extends StatefulWidget {
  final FlashMeterController controller;
  TextEditingController titleController = TextEditingController();

  FlashMeterApp(this.controller);

  @override
  _FlashMeterAppState createState() => _FlashMeterAppState();
}

class _FlashMeterAppState extends State<FlashMeterApp> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void onBottomNavigationBarTap(int index) {
    setState(() {
      widget.controller.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'FlashMeter',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Theme.of(context).brightness == Brightness.light
                  ? MyApp.of(context).changeTheme(ThemeMode.dark)
                  : MyApp.of(context).changeTheme(ThemeMode.light);
            },
            icon: Theme.of(context).brightness == Brightness.light
                ? const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.light_mode_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
          ),
        ],
      ),
      body: Container(
        child: CustomPaint(
          painter: GradientBackgroundPainter(),
          child: Stack(
            children: [
              Offstage(
                offstage: widget.controller.currentIndex != 0,
                child: InputPage(
                  controller: widget.controller,
                  titleController: widget.titleController,
                ),
              ),
              Offstage(
                offstage: widget.controller.currentIndex != 1,
                child: FavoritesPage(
                  controller: widget.controller,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: widget.controller.currentIndex,
        onTap: onBottomNavigationBarTap,
      ),
    );
  }
}
