import 'package:flash_meter/view/color/color_constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    required this.backgroundColor,
    required this.selectedItemColor,
    required this.unselectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: backgroundColor,
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
  final Color foregroundColor;
  final Color backgroundColor;

  const CustomControlButton({
    required this.onPressed,
    required this.icon,
    required this.foregroundColor,
    required this.backgroundColor,
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
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
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
  final Color numberButtonColor;
  final Color numberButtonTextColor;

  const CustomNumPad({
    required this.size,
    required this.onTap,
    required this.spacing,
    required this.numberButtonColor,
    required this.numberButtonTextColor,
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
          backgroundColor: numberButtonColor,
          elevation: 1,
        ),
        onPressed: () {
          onTap(label);
        },
        child: Text(
          label,
          style: TextStyle(color: numberButtonTextColor),
        ),
      ),
    );
  }
}

class GradientBackgroundPainter extends CustomPainter {
  bool isLightMode;

  GradientBackgroundPainter(this.isLightMode);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: isLightMode
          ? ColorConstants.lightScaffoldBackgroundColor
          : ColorConstants.darkScaffoldBackgroundColor,
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
