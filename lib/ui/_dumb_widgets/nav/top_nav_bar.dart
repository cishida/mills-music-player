import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mills_music_player/_constants/_colors.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({
    Key? key,
    this.title = '',
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: ConstColors.divider,
          ),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
