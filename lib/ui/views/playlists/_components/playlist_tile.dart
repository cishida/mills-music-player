import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';

class PlaylistTile extends StatelessWidget {
  const PlaylistTile({
    Key? key,
    required this.playlist,
    required this.onTap,
  }) : super(key: key);

  final Playlist playlist;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            selectedColor: ConstColors.offWhite,
            onTap: () => onTap(),
            title: Text(
              playlist.title,
            ),
            trailing: Text(
              '${playlist.songs.length.toString()} songs',
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
