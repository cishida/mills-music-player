import 'package:flutter/material.dart';

class TempoPercent extends StatelessWidget {
  const TempoPercent({
    Key? key,
    required this.value,
    this.style,
  }) : super(key: key);

  final double value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${value.toStringAsFixed(0)}%',
      style: style ??
          const TextStyle(
            fontFamily: 'Fixed',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
    );
  }
}
