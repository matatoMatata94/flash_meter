import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flutter/material.dart';

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
                    width: 150,
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        inputNumber,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.backspace),
                    onPressed: () => widget.controller.deleteLastInput(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: [
                    buildNumberButton('1'),
                    buildNumberButton('2'),
                    buildNumberButton('3'),
                    buildNumberButton('4'),
                    buildNumberButton('5'),
                    buildNumberButton('6'),
                    buildNumberButton('7'),
                    buildNumberButton('8'),
                    buildNumberButton('9'),
                    buildNumberButton('0'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await widget.controller.flashBasedOnNumber();
                    },
                    child: const Text('Senden'),
                  ),
                  const SizedBox(height: 10),
                  AddToFavoritesButton(
                    titleController: widget.titleController,
                    inputNumber: inputNumber,
                    context: context,
                    showAddFavoritePopup: () {
                      showAddFavoritePopup(context, widget.titleController);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumberButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(70, 60),
        ),
        onPressed: () {
          widget.controller.updateInputFieldFromInput(label);
        },
        child: Text(label),
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

class AddToFavoritesButton extends StatelessWidget {
  final TextEditingController titleController;
  final String inputNumber;
  final VoidCallback showAddFavoritePopup;
  final BuildContext context;

  const AddToFavoritesButton({
    required this.titleController,
    required this.inputNumber,
    required this.showAddFavoritePopup,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showAddFavoritePopup;
      },
      icon: const Icon(Icons.favorite),
      label: const Text('Favorit hinzufügen'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
