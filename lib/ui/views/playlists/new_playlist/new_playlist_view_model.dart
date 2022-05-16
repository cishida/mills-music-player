import 'package:flutter/material.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/services/playlist/playlist_service.dart';
import 'package:stacked/stacked.dart';

class NewPlaylistViewModel extends BaseViewModel {
  final _playlistService = locator<PlaylistService>();

  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  void createPlaylist() {
    if (_controller.text.isEmpty) {
      debugPrint('Empty text, handle error');
      return;
    }

    _playlistService.createPlaylist(title: _controller.text);
    _controller.clear();
  }
}
