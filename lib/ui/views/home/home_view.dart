import 'package:flutter/material.dart';
import 'package:mills_music_player/test_data/song_data.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view.dart';
import 'package:mills_music_player/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => const SongList(),
    );
  }
}

class SongList extends StatelessWidget {
  const SongList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      itemCount: SongData.songs.length,
      itemBuilder: (context, index) {
        return SongTileView(
          song: SongData.songs[index],
        );
      },
    );
  }
}
