import 'package:flutter/material.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:stacked/stacked.dart';

class ControlButtonsViewModel extends ReactiveViewModel {
  // final PlayerService _playerService = locator<PlayerService>();
  // Song get selectedSong => _playerService.reactiveSong.value;

  final SongService _songService = locator<SongService>();
  Song get currentSong => _songService.currentSong.value;

  void setTempo(double tempo) {
    _songService.setTempo(tempo);
    debugPrint(currentSong.tempo.toString());
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _songService,
      ];
}
