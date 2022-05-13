import 'package:flutter/material.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/ui/views/playlists/new_playlist/new_playlist_view_model.dart';
import 'package:stacked/stacked.dart';

class NewPlaylistView extends StatelessWidget {
  const NewPlaylistView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewPlaylistViewModel>.reactive(
      viewModelBuilder: () => NewPlaylistViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Text('New playlist screen'),
          ],
        ),
      ),
    );
  }
}
