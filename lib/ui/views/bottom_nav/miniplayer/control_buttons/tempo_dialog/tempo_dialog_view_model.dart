import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:stacked/stacked.dart';

class TempoDialogViewModel extends ReactiveViewModel {
  final SongService _songService = locator<SongService>();
  Song get currentSong => _songService.currentSong.value;

  void setTempo(double tempo) {
    _songService.setTempo(tempo);
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _songService,
      ];
}
