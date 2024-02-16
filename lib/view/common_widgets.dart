import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: currentIndex,
      onTap: onTap,
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
        showAddFavoritePopup();
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

class CustomNumPad extends StatelessWidget {
  final double size;
  final Function(String) onTap;
  final double spacing;

  const CustomNumPad({
    required this.size,
    required this.onTap,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: spacing,
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
          onTap(label);
        },
        child: Text(label),
      ),
    );
  }
}
