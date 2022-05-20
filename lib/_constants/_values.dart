import 'package:flutter/material.dart';
import 'package:mills_music_player/models/page_info.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/ui/views/albums/albums_view/albums_view.dart';
import 'package:mills_music_player/ui/views/songs/songs_view.dart';
import 'package:mills_music_player/ui/views/playlists/playlists_view.dart';
import 'package:mills_music_player/ui/views/settings/settings_view.dart';

class ConstValues {
  static const int bottomNavRouterId = 1;
  static const int albumsRouterId = 2;

  static const double azHeight = 0.5;
  static const double miniplayerHeight = 200;

  // static const String emptySongID = 'EMPTY_SONG_ID';
  static Song emptySong = Song(
    id: 'EMPTY_SONG_ID',
    title: '',
    composer: '',
    arrangers: [],
    tempo: 0,
  );

  static List<PageInfo> pageInfos = [
    PageInfo(
      title: 'Songs',
      icon: const Icon(Icons.music_note),
      view: const SongsView(),
    ),
    PageInfo(
      title: 'Albums',
      icon: const Icon(Icons.folder),
      view: const AlbumsView(),
    ),
    PageInfo(
      title: 'Playlists',
      icon: const Icon(Icons.playlist_add),
      view: const PlaylistsView(),
    ),
    PageInfo(
      title: 'Settings',
      icon: const Icon(Icons.settings),
      view: const SettingsView(),
    ),
  ];
}
