import 'package:flutter/material.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/ui/_dumb_widgets/buttons/full_width_pill_button.dart';
import 'package:mills_music_player/ui/views/playlists/_components/playlist_tile.dart';
import 'package:mills_music_player/ui/views/playlists/playlists_view_model.dart';
import 'package:stacked/stacked.dart';

class PlaylistsView extends StatelessWidget {
  const PlaylistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaylistsViewModel>.reactive(
      viewModelBuilder: () => PlaylistsViewModel(),
      builder: (context, model, child) {
        model.createFakerPlaylists();

        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: model.playlists.length,
                  itemBuilder: (context, index) {
                    final Playlist playlist = model.playlists[index];

                    return PlaylistTile(
                      playlist: playlist,
                      onTap: () => model.onPlaylistTap(
                        context,
                        playlist,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 15.0,
                  ),
                  child: FullWidthPillButton(
                    text: 'Create a new playlist',
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () => model.onNewPlaylist(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
