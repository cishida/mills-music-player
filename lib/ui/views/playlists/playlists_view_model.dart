import 'package:flutter/material.dart';
import 'package:mills_music_player/models/factories/playlist_factory.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/ui/views/playlists/new_playlist/new_playlist_view.dart';
import 'package:mills_music_player/ui/views/playlists/playlist/playlist_view.dart';
import 'package:stacked/stacked.dart';

class PlaylistsViewModel extends BaseViewModel {
  final _playlistFactory = PlaylistFactory();

  List<Playlist> _playlists = [];
  List<Playlist> get playlists => _playlists;

  void createFakerPlaylists() {
    _playlists = _playlistFactory.generateFakeList(length: 0);
    _playlists.sort(
      (a, b) => a.title.compareTo(b.title),
    );
  }

  void onNewPlaylist(
    BuildContext context,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return const NewPlaylistView();
        },
        fullscreenDialog: true,
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
}
