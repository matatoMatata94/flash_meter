import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/view/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

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
                  Container(
                    width: size.width / 2.5,
                    height: size.height / 12,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: widget.controller.isLightMode
                            ? ColorConstants.darkInputBoxColor
                            : ColorConstants.lightInputBoxColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        inputNumber,
                        style: TextStyle(
                          fontSize: 20,
                          color: widget.controller.isLightMode
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.backspace),
                    iconSize: 40,
                    onPressed: () => widget.controller.deleteLastInput(),
                    color: widget.controller.isLightMode
                        ? ColorConstants.lightDeleteButtonColor
                        : ColorConstants.darkDeleteButtonColor,
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
                numberButtonColor: widget.controller.isLightMode
                    ? ColorConstants.lightNumberButtonColor
                    : ColorConstants.darkNumberButtonColor,
                numberButtonTextColor: widget.controller.isLightMode
                    ? ColorConstants.lightNumberButtonTextColor
                    : ColorConstants.darkNumberButtonTextColor,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomControlButton(
                    icon: widget.controller.isFlashOn == true
                        ? const Icon(Icons.flashlight_off_outlined)
                        : const Icon(Icons.flashlight_on_outlined),
                    onPressed: () {
                      setState(() {
                        widget.controller.switchFlash();
                      });
                    },
                    foregroundColor: widget.controller.isLightMode
                        ? ColorConstants.lightCustomControlButtonForegroundColor
                        : ColorConstants.darkCustomControlButtonForegroundColor,
                    backgroundColor: widget.controller.isLightMode
                        ? ColorConstants.lightCustomControlButtonBackgroundColor
                        : ColorConstants.darkCustomControlButtonBackgroundColor,
                  ),
                  CustomControlButton(
                    icon: const Icon(Icons.play_arrow_outlined),
                    onPressed: () async {
                      await widget.controller.flashBasedOnNumber();
                    },
                    foregroundColor: widget.controller.isLightMode
                        ? ColorConstants.lightCustomControlButtonForegroundColor
                        : ColorConstants.darkCustomControlButtonForegroundColor,
                    backgroundColor: widget.controller.isLightMode
                        ? ColorConstants.lightCustomControlButtonBackgroundColor
                        : ColorConstants.darkCustomControlButtonBackgroundColor,
                  ),
                  CustomControlButton(
                    icon: const Icon(Icons.favorite_border_outlined),
                    onPressed: () {
                      showAddFavoritePopup(context, widget.titleController);
                    },
                    foregroundColor: widget.controller.isLightMode
                        ? ColorConstants.lightCustomControlButtonForegroundColor
                        : ColorConstants.darkCustomControlButtonForegroundColor,
                    backgroundColor: widget.controller.isLightMode
                        ? ColorConstants.lightCustomControlButtonBackgroundColor
                        : ColorConstants.darkCustomControlButtonBackgroundColor,
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
