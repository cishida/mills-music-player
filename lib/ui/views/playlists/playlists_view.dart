import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/ui/_dumb_widgets/buttons/full_width_pill_button.dart';
import 'package:mills_music_player/ui/views/playlists/_components/playlist_tile.dart';
import 'package:mills_music_player/ui/views/playlists/new_playlist/new_playlist_view.dart';
import 'package:mills_music_player/ui/views/playlists/playlists_view_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

class PlaylistsView extends StatelessWidget {
  const PlaylistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaylistsViewModel>.reactive(
      viewModelBuilder: () => PlaylistsViewModel(),
      builder: (context, model, child) {
        return SlidingUpPanel(
          minHeight: 0.0,
          maxHeight: MediaQuery.of(context).size.height * 0.85,
          backdropEnabled: true,
          backdropTapClosesPanel: true,
          parallaxEnabled: true,
          isDraggable: true,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          controller: model.panelController,
          panel: NewPlaylistView(
            close: () => model.panelController.close(),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return <Widget>[
                const CupertinoSliverNavigationBar(
                  largeTitle: Text('Playlists'),
                  transitionBetweenRoutes: false,
                  automaticallyImplyLeading: false,
                )
              ];
            },
            body: Column(
              children: [
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
              ],
            ),
          ),
          // SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 30.0,
          //           vertical: 15.0,
          //         ),
          //         child: FullWidthPillButton(
          //           text: 'Create a new playlist',
          //           color: Colors.white,
          //           textColor: Colors.black,
          //           onPressed: () => model.onNewPlaylist(context),
          //         ),
          //       ),
          //       ListView.builder(
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemCount: model.playlists.length,
          //         itemBuilder: (context, index) {
          //           final Playlist playlist = model.playlists[index];

          //           return PlaylistTile(
          //             playlist: playlist,
          //             onTap: () => model.onPlaylistTap(
          //               context,
          //               playlist,
          //             ),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
