import 'package:flutter/material.dart';

import '../controller/flash_meter_controller.dart';

class FavoritesPage extends StatelessWidget {
  final FlashMeterController controller;

  FavoritesPage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoriten'),
      ),
      body: ListView.builder(
        itemCount: controller.favorites.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(controller.favorites[index].number),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              controller.deleteFavorite(controller.favorites[index]);
            },
            direction: DismissDirection.endToStart,
            child: ListTile(
              title: Text(controller.favorites[index].title),
              subtitle: Text('Nummer: ${controller.favorites[index].number}'),
              onTap: () {
                controller.updateInputField(controller.favorites[index].number);
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
