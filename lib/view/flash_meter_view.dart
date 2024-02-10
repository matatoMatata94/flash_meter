import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/view/common_widgets.dart';
import 'package:flash_meter/view/favorites_page.dart';
import 'package:flash_meter/view/input_page.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('FlashMeter')),
      body: Stack(
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: widget.controller.currentIndex,
        onTap: onBottomNavigationBarTap,
      ),
    );
  }
}
