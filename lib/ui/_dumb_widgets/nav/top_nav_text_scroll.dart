import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:text_scroll/text_scroll.dart';

class TopNavTextScroll extends StatelessWidget {
  const TopNavTextScroll({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextScroll(
      text,
      delayBefore: const Duration(milliseconds: 500),
      textAlign: TextAlign.center,
      style: style ??
          const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: ConstColors.offBlack,
          ),
    );
  }
}
