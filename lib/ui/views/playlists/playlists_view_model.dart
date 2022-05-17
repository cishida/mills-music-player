import 'package:flutter/material.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/services/playlist/playlist_service.dart';
import 'package:mills_music_player/ui/views/playlists/playlist/playlist_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

class PlaylistsViewModel extends ReactiveViewModel {
  final _playlistService = locator<PlaylistService>();
  List<Playlist> get playlists => _playlistService.reactivePlaylists.value;

  final PanelController _panelController = PanelController();
  PanelController get panelController => _panelController;

  void onNewPlaylist(
    BuildContext context,
  ) {
    // _panelController.open();
    _panelController.animatePanelToPosition(
      1.0,
      duration: const Duration(
        milliseconds: 250,
      ),
    );
  }

  void onPlaylistTap(
    BuildContext context,
    Playlist playlist,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return PlaylistView(
            playlist: playlist,
          );
        },
      ),
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _playlistService,
      ];
}
