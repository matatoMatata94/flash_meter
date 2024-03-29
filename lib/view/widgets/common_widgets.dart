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
      elevation: 1.0,
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

class CustomControlButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;

  const CustomControlButton({
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: icon,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width / 3.5, 50),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildNumberButton('1'),
              buildNumberButton('2'),
              buildNumberButton('3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildNumberButton('4'),
              buildNumberButton('5'),
              buildNumberButton('6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildNumberButton('7'),
              buildNumberButton('8'),
              buildNumberButton('9'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildNumberButton('0'),
            ],
          )
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
          elevation: 1,
        ),
        onPressed: () {
          onTap(label);
        },
        child: Text(
          label,
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({
    required this.width,
    required this.inputNumber,
    required this.height,
    required this.textColor,
  });

  final double width;
  final double height;
  final String inputNumber;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          inputNumber,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.backspace),
      iconSize: 40,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
