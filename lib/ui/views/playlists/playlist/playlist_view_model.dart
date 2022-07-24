import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:stacked/stacked.dart';

class PlaylistViewModel extends BaseViewModel {
  bool _isRemovingSongs = false;
  bool get isRemovingSongs => _isRemovingSongs;

  final SongService _songService = locator<SongService>();
  Song get currentSong => _songService.currentSong.value;

  void showRemoveSongs() {
    _isRemovingSongs = !_isRemovingSongs;
  }
}
