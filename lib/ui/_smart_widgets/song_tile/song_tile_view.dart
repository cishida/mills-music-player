import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/_utils/duration_util.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view_model.dart';
import 'package:stacked/stacked.dart';

class SongTileView extends StatelessWidget {
  const SongTileView({
    Key? key,
    required this.song,
    this.isAlphabetical = false,
  }) : super(key: key);

  final Song song;
  final bool isAlphabetical;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SongTileViewModel(),
      builder: (context, model, child) {
        return Container(
          padding: EdgeInsets.only(right: isAlphabetical ? 50 : 0),
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(
                  left: 16,
                  right: isAlphabetical ? 0 : 16.0,
                ),
                title: Text(
                  song.title,
                ),
                subtitle: Text(
                  song.artists.join(', '),
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
      },
    );
  }
}
