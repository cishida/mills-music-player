import 'package:flutter/material.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_lists/song_list/song_list_view_model.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view.dart';
import 'package:stacked/stacked.dart';

class SongListView extends StatelessWidget {
  const SongListView({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SongListViewModel>.reactive(
      viewModelBuilder: () => SongListViewModel(),
      builder: (context, model, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: songs.length,
          itemBuilder: (context, index) => SongTileView(
            song: songs[index],
          ),
        );
      },
    );
  }
}
