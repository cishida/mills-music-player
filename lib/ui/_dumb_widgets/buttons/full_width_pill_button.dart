import 'package:flutter/material.dart';

class FullWidthPillButton extends StatelessWidget {
  const FullWidthPillButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFFd34049),
    this.textColor = Colors.white,
  }) : super(key: key);

  final String text;
  final Function onPressed;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
        ),
        primary: color,
        shape: const StadiumBorder(),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
