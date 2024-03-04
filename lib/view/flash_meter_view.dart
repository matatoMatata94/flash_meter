import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/controller/flash_meter_theme_provider.dart';
import 'package:flash_meter/view/pages/favorites_page.dart';
import 'package:flash_meter/view/pages/input_page.dart';
import 'package:flash_meter/view/theme/color/color_palette.dart';
import 'package:flash_meter/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    ColorConstants colorConstants = ColorConstants();
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorConstants.appBarBackgroundColor,
        title: const Text(
          'FlashMeter',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.isLightMode
                  ? themeProvider.changeThemeMode(ThemeData.light())
                  : themeProvider.changeThemeMode(ThemeData.dark());
            },
            icon: themeProvider.isLightMode
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
      body: CustomPaint(
        painter:
            GradientBackgroundPainter(colorConstants.scaffoldBackgroundColor),
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: widget.controller.currentIndex,
        onTap: onBottomNavigationBarTap,
        backgroundColor: colorConstants.bottomNavigationBackgroundColor,
        unselectedItemColor: colorConstants.bottomNavigationUnselectedItemColor,
        selectedItemColor: colorConstants.bottomNavigationSelectedItemColor,
      ),
    );
  }
}
