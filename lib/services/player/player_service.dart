import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class PlayerService with ReactiveServiceMixin {
  final ReactiveValue<Song> _reactiveSong = ReactiveValue<Song>(
    Song(
      id: ConstValues.emptySongID,
      title: '',
      artists: [],
      tempo: 0,
    ),
  );
  ReactiveValue<Song> get reactiveSong => _reactiveSong;

  PlayerService() {
    listenToReactiveValues([_reactiveSong]);
  }

  void selectSong(Song song) {
    _reactiveSong.value = song;
  }
}
