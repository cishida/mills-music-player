import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';

class LandingSubheader extends StatelessWidget {
  const LandingSubheader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut ipsum erat. Proin rhoncus lectus vel sagittis convallis.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
