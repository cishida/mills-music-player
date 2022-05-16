import 'package:flutter/material.dart';
import 'package:mills_music_player/_utils/plurals_util.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/top_nav_bar.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_lists/song_list/song_list_view.dart';
import 'package:mills_music_player/ui/views/playlists/playlist/playlist_view_model.dart';
import 'package:stacked/stacked.dart';

class PlaylistView extends StatelessWidget {
  const PlaylistView({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaylistViewModel>.reactive(
      viewModelBuilder: () => PlaylistViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            TopNavBar(
              title: playlist.title,
              canGoBack: true,
              trailing: Text(
                PluralsUtil.songs(playlist.songs.length),
                textAlign: TextAlign.right,
              ),
            ),
            Expanded(
              child: SongListView(
                songs: playlist.songs,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
