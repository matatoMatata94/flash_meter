import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/controller/flash_meter_theme_provider.dart';
import 'package:flash_meter/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../color/color_constants.dart';

class InputPage extends StatefulWidget {
  final FlashMeterController controller;
  final TextEditingController titleController;

  InputPage({
    required this.controller,
    required this.titleController,
  });

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late String inputNumber = '';

  @override
  void initState() {
    super.initState();
    widget.controller.inputNumberStream.listen((value) {
      setState(() {
        inputNumber = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorConstants colorConstants = ColorConstants();
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  inputBox(
                    width: size.width / 2.5,
                    inputNumber: inputNumber,
                    height: size.height / 12,
                    boxColor: Colors.black,
                    textColor: Colors.white,
                  ),
                  deleteButton(
                    color: Colors.white,
                    onPressed: () {
                      widget.controller.deleteLastInput();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomNumPad(
                onTap: (label) {
                  widget.controller.updateInputFieldFromInput(label);
                },
                spacing: 10,
                size: size.width,
                numberButtonColor: colorConstants.numberButtonColor,
                numberButtonTextColor: colorConstants.numberButtonTextColor,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Flash on/off Button
                  CustomControlButton(
                    icon: widget.controller.isFlashOn == true
                        ? const Icon(Icons.flashlight_off_outlined)
                        : const Icon(Icons.flashlight_on_outlined),
                    onPressed: () {
                      widget.controller.switchFlash();
                    },
                    foregroundColor:
                        colorConstants.customControlButtonForegroundColor,
                    backgroundColor:
                        colorConstants.customControlButtonBackgroundColor,
                  ),
                  // Send Code-Signal via flash Button
                  CustomControlButton(
                    icon: const Icon(Icons.play_arrow_outlined),
                    onPressed: () async {
                      await widget.controller.flashBasedOnNumber();
                    },
                    foregroundColor:
                        colorConstants.customControlButtonForegroundColor,
                    backgroundColor:
                        colorConstants.customControlButtonBackgroundColor,
                  ),
                  //Add to Favorite Button
                  CustomControlButton(
                    icon: const Icon(Icons.favorite_border_outlined),
                    onPressed: () {
                      showAddFavoritePopup(context, widget.titleController);
                    },
                    foregroundColor:
                        colorConstants.customControlButtonForegroundColor,
                    backgroundColor:
                        colorConstants.customControlButtonBackgroundColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showAddFavoritePopup(
      BuildContext context, TextEditingController titleController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Favorit hinzufügen"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Titel"),
                ),
                // SizedBox(height: 10),
                Text("Nummer: $inputNumber"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Abbrechen"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Hinzufügen"),
              onPressed: () {
                widget.controller
                    .addFavorite(titleController.text, inputNumber);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
