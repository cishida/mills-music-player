import 'package:mills_music_player/models/factories/song_factory.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class SongService with ReactiveServiceMixin {
  final _songFactory = SongFactory();

  final ReactiveValue<List<Song>> _reactiveSongs =
      ReactiveValue<List<Song>>([]);
  ReactiveValue<List<Song>> get reactiveSongs => _reactiveSongs;

  SongService() {
    _createFakerSongs();
    listenToReactiveValues([_reactiveSongs]);
  }

  void _createFakerSongs() {
    _reactiveSongs.value = _songFactory.generateFakeList(length: 500);
    print(_reactiveSongs.value);
  }
}
