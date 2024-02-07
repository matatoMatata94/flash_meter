import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flash_meter/view/common_widgets.dart';
import 'package:flash_meter/view/favorites_page.dart';
import 'package:flutter/material.dart';

class FlashMeterApp extends StatefulWidget {
  final FlashMeterController controller;
  TextEditingController titleController = TextEditingController();

  FlashMeterApp(this.controller);

  @override
  _FlashMeterAppState createState() => _FlashMeterAppState();
}

class _FlashMeterAppState extends State<FlashMeterApp> {
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
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  Widget buildNumberButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(60, 60),
        ),
        onPressed: () {
          widget.controller.updateInputField(label);
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
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Abbrechen"),
            ),
            TextButton(
              onPressed: () {
                widget.controller
                    .addFavorite(titleController.text, inputNumber);
                Navigator.of(context).pop();
              },
              child: const Text("Hinzufügen"),
            ),
          ],
        );
      },
    );
  }

  void onBottomNavigationBarTap(int index) {
    if (index == 1) {
      setState(() {
        widget.controller.currentIndex = index;
      });
    } else {
      setState(() {
        widget.controller.currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlashMeter')),
      body: Stack(
        children: [
          Offstage(
            offstage: widget.controller.currentIndex == 0,
            child: StreamBuilder<String>(
                stream: widget.controller.inputNumberStream,
                builder: (context, snapshot) {
                  return SingleChildScrollView(
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
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  snapshot.data ?? '',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.backspace),
                              onPressed: () =>
                                  widget.controller.deleteLastInput(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildNumberButton('1'),
                                buildNumberButton('2'),
                                buildNumberButton('3'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildNumberButton('4'),
                                buildNumberButton('5'),
                                buildNumberButton('6'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildNumberButton('7'),
                                buildNumberButton('8'),
                                buildNumberButton('9'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Expanded(child: SizedBox.shrink()),
                                buildNumberButton('0'),
                                const Expanded(child: SizedBox.shrink()),
                              ],
                            ),
                          ],
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
                            ElevatedButton.icon(
                              onPressed: () {
                                showAddFavoritePopup(
                                    context, widget.titleController);
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Offstage(
            offstage: widget.controller.currentIndex == 1,
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
