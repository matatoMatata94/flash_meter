import 'dart:async';

import 'package:flash_meter/model/flash_meter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:torch_light/torch_light.dart';

class FlashMeterController {
  final SharedPreferences preferences;

  FlashMeterController(this.preferences) {
    loadFavorites(preferences);
    _inputNumberController.add(inputNumber);
  }

  int currentIndex = 0;
  bool isFlashOn = false;
  String _inputNumber = '';
  List<FavoriteItem> favorites = [];

  final _inputNumberController = StreamController<String>.broadcast();

  Stream<String> get inputNumberStream => _inputNumberController.stream;

  String get inputNumber => _inputNumber;

  set inputNumber(String value) {
    _inputNumber = value;
    _inputNumberController.add(value);
  }

  void dispose() {
    _inputNumberController.close();
  }

  void switchFlash() {
    if (isFlashOn) {
      isFlashOn = false;
      TorchLight.disableTorch();
    } else {
      TorchLight.enableTorch();
      isFlashOn = true;
    }
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
    saveFavorites(preferences);
  }

  void deleteLastInput() {
    if (inputNumber.isNotEmpty) {
      inputNumber = inputNumber.substring(0, inputNumber.length - 1);
    }
  }

  void updateInputFieldFromFavorites(String selectedInput) {
    inputNumber = selectedInput;
  }

  void updateInputFieldFromInput(String selectedInput) {
    inputNumber += selectedInput;
  }

  void deleteFavorite(FavoriteItem favorite) {
    favorites.remove(favorite);
  }

  Future<void> loadFavorites(SharedPreferences preferences) async {
    preferences = await SharedPreferences.getInstance();
    List<String>? favoriteStrings = preferences.getStringList('favorites');

    if (favoriteStrings != null) {
      favorites = favoriteStrings
          .map((favString) => FavoriteItem.fromJsonString(favString))
          .toList();
    }
  }

  Future<void> saveFavorites(SharedPreferences preferences) async {
    preferences = await SharedPreferences.getInstance();

    List<String> favoriteStrings =
        favorites.map((fav) => fav.toJsonString()).toList();

    preferences.setStringList('favorites', favoriteStrings);
  }
}
