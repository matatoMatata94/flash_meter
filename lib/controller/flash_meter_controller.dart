import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:torch_light/torch_light.dart';

import '../model/flash_meter_model.dart';
import '../view/favorites_page.dart';

class FlashMeterController {
  bool isFlashOn = false;
  String _inputNumber = '';
  List<FavoriteItem> favorites = [];

  FlashMeterController() {
    loadFavorites();
  }

  final _inputNumberController = StreamController<String>.broadcast();

  Stream<String> get inputNumberStream => _inputNumberController.stream;

  String get inputNumber => _inputNumber;

  set inputNumber(String value) {
    _inputNumber = value;
    _inputNumberController.add(value);
  }

  Future<void> toggleFlash() async {
    isFlashOn = true;
    TorchLight.enableTorch();
    await Future.delayed(const Duration(milliseconds: 500));
    isFlashOn = false;
    TorchLight.disableTorch();
  }

  Future<void> flashBasedOnNumber() async {
    for (int i = 0; i < inputNumber.length; i++) {
      int signalCount = int.tryParse(inputNumber[i]) ?? 0;

      for (int j = 0; j < signalCount; j++) {
        await toggleFlash();
        await Future.delayed(const Duration(milliseconds: 500));
      }

      if (i < inputNumber.length - 1) {
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    inputNumber = '';
  }

  void addFavorite(String title, String number) {
    FavoriteItem favorite = FavoriteItem(title: title, number: number);
    favorites.add(favorite);
    saveFavorites();
  }

  void deleteLastInput() {
    if (inputNumber.isNotEmpty) {
      inputNumber = inputNumber.substring(0, inputNumber.length - 1);
    }
  }

  void updateInputField(String selectedInput) {
    inputNumber += selectedInput;
  }

  void navigateToFavorites(BuildContext context) async {
    final selectedFavorite = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritesPage(
          controller: this,
        ),
      ),
    );
  }

  Widget buildNumberButton(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(60, 60),
        ),
        onPressed: () {
          updateInputField(label);
        },
        child: Text(label),
      ),
    );
  }

  void showAddFavoritePopup(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Favorit hinzufügen"),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Titel"),
              ),
              SizedBox(height: 10),
              Text("Nummer: $inputNumber"),
            ],
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
                addFavorite(titleController.text, inputNumber);
                Navigator.of(context).pop();
              },
              child: const Text("Hinzufügen"),
            ),
          ],
        );
      },
    );
  }

  void deleteFavorite(FavoriteItem favorite) {
    favorites.remove(favorite);
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoriteStrings = prefs.getStringList('favorites');

    if (favoriteStrings != null) {
      favorites = favoriteStrings
          .map((favString) => FavoriteItem.fromJsonString(favString))
          .toList();
    }
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> favoriteStrings =
        favorites.map((fav) => fav.toJsonString().toString()).toList();

    prefs.setStringList('favorites', favoriteStrings);
  }
}
