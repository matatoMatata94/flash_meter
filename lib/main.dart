import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

import 'favorites_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlashMeterApp(),
    );
  }
}

class FlashMeterApp extends StatefulWidget {
  @override
  _FlashMeterAppState createState() => _FlashMeterAppState();
}

class _FlashMeterAppState extends State<FlashMeterApp> {
  bool _isFlashOn = false;
  String _inputNumber = '';
  List<FavoriteItem> favorites = [];

  @override
  void dispose() {
    TorchLight.disableTorch();
    super.dispose();
  }

  Future<void> _toggleFlash() async {
    _isFlashOn = true;
    TorchLight.enableTorch();
    await Future.delayed(const Duration(milliseconds: 500));
    _isFlashOn = false;
    TorchLight.disableTorch();
  }

  Future<void> _flashBasedOnNumber() async {
    for (int i = 0; i < _inputNumber.length; i++) {
      int signalCount = int.tryParse(_inputNumber[i]) ?? 0;

      for (int j = 0; j < signalCount; j++) {
        await Future.delayed(const Duration(milliseconds: 500));
        await _toggleFlash();
      }
      if (i < _inputNumber.length - 1) {
        await Future.delayed(const Duration(seconds: 3));
      }
    }

    setState(() {
      _inputNumber = '';
    });
  }

  void _addFavorite(String title, String number) {
    FavoriteItem favorite = FavoriteItem(title: title, number: number);
    setState(() {
      favorites.add(favorite);
    });
  }

  void _deleteLastInput() {
    if (_inputNumber.isNotEmpty) {
      setState(() {
        _inputNumber = _inputNumber.substring(0, _inputNumber.length - 1);
      });
    }
  }

  void _updateInputField(String selectedFavorite) {
    setState(() {
      _inputNumber = selectedFavorite;
    });
  }

  void _navigateToFavorites() async {
    final selectedFavorite = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritesPage(
          favorites: favorites,
          onFavoriteSelected: (selectedFavorite) {
            _updateInputField(selectedFavorite.number);
          },
          onDeleteFavorite: (favorite) {
            _deleteFavorite(favorite);
          },
        ),
      ),
    );
  }

  Widget _buildNumberButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(60, 60),
        ),
        onPressed: () {
          setState(() {
            _inputNumber += label;
          });
        },
        child: Text(label),
      ),
    );
  }

  void _showAddFavoritePopup() {
    TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Favorit hinzufügen"),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Titel"),
              ),
              SizedBox(height: 10),
              Text("Nummer: $_inputNumber"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Abbrechen"),
            ),
            TextButton(
              onPressed: () {
                _addFavorite(titleController.text, _inputNumber);
                Navigator.of(context).pop();
              },
              child: Text("Hinzufügen"),
            ),
          ],
        );
      },
    );
  }

  void _deleteFavorite(FavoriteItem favorite) {
    setState(() {
      favorites.remove(favorite);
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
                    _inputNumber,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.backspace),
                onPressed: () => _deleteLastInput(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNumberButton('1'),
                  _buildNumberButton('2'),
                  _buildNumberButton('3'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNumberButton('4'),
                  _buildNumberButton('5'),
                  _buildNumberButton('6'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNumberButton('7'),
                  _buildNumberButton('8'),
                  _buildNumberButton('9'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 75),
                  _buildNumberButton('0'),
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
                  await _flashBasedOnNumber();
                },
                child: const Text('Senden'),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  _showAddFavoritePopup();
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
            _navigateToFavorites();
          }
        },
      ),
    );
  }
}
