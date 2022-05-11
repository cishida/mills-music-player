import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/views/playlists/playlists_view_model.dart';
import 'package:stacked/stacked.dart';

class PlaylistsView extends StatelessWidget {
  const PlaylistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaylistsViewModel>.reactive(
      viewModelBuilder: () => PlaylistsViewModel(),
      builder: (context, model, child) => const Center(
        child: Text(
          'Playlists content',
        ),
      ),
    );
  }
}
