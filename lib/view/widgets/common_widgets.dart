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
  // final Color numberButtonColor;
  // final Color numberButtonTextColor;

  const CustomNumPad({
    required this.size,
    required this.onTap,
    required this.spacing,
    // required this.numberButtonColor,
    // required this.numberButtonTextColor,
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
          // backgroundColor: numberButtonColor,
          elevation: 1,
        ),
        onPressed: () {
          onTap(label);
        },
        child: Text(
          label,
          // style: TextStyle(color: numberButtonTextColor),
        ),
      ),
    );
  }
}

class GradientBackgroundPainter extends CustomPainter {
  final List<Color> backgroundColor;

  GradientBackgroundPainter(this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: backgroundColor,
      stops: const [0.2, 1.0],
    );

    final Paint paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class InputBox extends StatelessWidget {
  const InputBox({
    required this.width,
    required this.inputNumber,
    required this.height,
    required this.textColor,
    required this.boxColor,
  });

  final double width;
  final double height;
  final String inputNumber;
  final Color textColor;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: boxColor,
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
    required this.color,
    required this.onPressed,
  });

  final Color color;
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
      color: color,
    );
  }
}
