import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/_utils/duration_util.dart';
import 'package:mills_music_player/models/song/song.dart';

class SongTileView extends StatelessWidget {
  const SongTileView({
    Key? key,
    required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(
              song.title ?? '',
            ),
            subtitle: Text(
              song.artist ?? '',
            ),
            trailing: Text(
              DurationUtil.format(song.duration),
            ),
          ),
          const Divider(
            color: ConstColors.lightDivider,
            height: 1.0,
          ),
        ],
      ),
    );
  }
}
