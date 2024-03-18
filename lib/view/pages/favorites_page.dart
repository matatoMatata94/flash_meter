import 'package:flash_meter/controller/flash_meter_controller.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final FlashMeterController controller;

  FavoritesPage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
          child: Card(
            child: ListTile(
              title: Text(
                controller.favorites[index].title,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              subtitle: Text('Nummer: ${controller.favorites[index].number}'),
              onTap: () {
                controller.currentIndex = 0;
                controller.updateInputFieldFromFavorites(
                    controller.favorites[index].number);
              },
            ),
          ),
        );
      },
    );
  }
}
