import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';

class SongListDivider extends StatelessWidget {
  const SongListDivider({
    Key? key,
    required this.tag,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: 40,
      width: width,
      alignment: Alignment.centerLeft,
      color: ConstColors.offWhite,
      padding: const EdgeInsets.only(
        left: 16.0,
      ),
      child: Text(
        tag,
        softWrap: false,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
