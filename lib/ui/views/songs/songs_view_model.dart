import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:stacked/stacked.dart';

class SongsViewModel extends ReactiveViewModel {
  final _songService = locator<SongService>();
  List<Song> get songs => _songService.reactiveSongs.value;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _songService,
      ];
}
