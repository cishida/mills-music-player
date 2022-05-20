import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:stacked/stacked.dart';

class SongTileViewModel extends ReactiveViewModel {
  final SongService _songService = locator<SongService>();
  Song get currentSong => _songService.currentSong.value;

  void selectSong(
    Song song,
    List<Song> songs,
  ) {
    _songService.selectSong(
      song: song,
      songs: songs,
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _songService,
      ];
}
