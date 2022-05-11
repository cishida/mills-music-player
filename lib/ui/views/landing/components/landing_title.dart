import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';

class LandingTitle extends StatelessWidget {
  const LandingTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Mills Mechanical\nMusic Player',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        color: ConstColors.offWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
