import 'package:flutter/material.dart';
import 'package:mills_music_player/models/page_info.dart';
import 'package:mills_music_player/ui/views/albums/albums_view.dart';
import 'package:mills_music_player/ui/views/home/home_view.dart';
import 'package:mills_music_player/ui/views/playlists/playlists_view.dart';
import 'package:mills_music_player/ui/views/settings/settings_view.dart';

class ConstValues {
  static List<PageInfo> pageInfos = [
    PageInfo(
      title: 'Home',
      icon: const Icon(Icons.home),
      view: const HomeView(),
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
