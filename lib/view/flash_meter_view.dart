import 'package:flutter/material.dart';

import '../controller/flash_meter_controller.dart';

class FlashMeterApp extends StatefulWidget {
  final FlashMeterController controller;

  FlashMeterApp({required this.controller});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlashMeter')),
      body: Column(
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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widget.controller.buildNumberButton('1'),
                  widget.controller.buildNumberButton('2'),
                  widget.controller.buildNumberButton('3'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widget.controller.buildNumberButton('4'),
                  widget.controller.buildNumberButton('5'),
                  widget.controller.buildNumberButton('6'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widget.controller.buildNumberButton('7'),
                  widget.controller.buildNumberButton('8'),
                  widget.controller.buildNumberButton('9'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 75),
                  widget.controller.buildNumberButton('0'),
                  const SizedBox(width: 75),
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
                  widget.controller.showAddFavoritePopup(context);
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Eingabe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoriten',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            widget.controller.navigateToFavorites(context);
          }
        },
      ),
    );
  }
}
