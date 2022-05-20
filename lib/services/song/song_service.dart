import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/models/factories/song_factory.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class SongService with ReactiveServiceMixin {
  final _songFactory = SongFactory();

  final ReactiveValue<List<Song>> _allSongs = ReactiveValue<List<Song>>([]);
  ReactiveValue<List<Song>> get allSongs => _allSongs;

  final ReactiveValue<int> _currentIndex = ReactiveValue<int>(-1);
  ReactiveValue<int> get currentIndex => _currentIndex;

  final ReactiveValue<List<String>> _queuedSongIds =
      ReactiveValue<List<String>>([]);
  ReactiveValue<List<String>> get queuedSongIds => _queuedSongIds;

  final ReactiveValue<Song> _currentSong = ReactiveValue<Song>(
    Song(
      id: ConstValues.emptySongID,
      title: '',
      composer: '',
      arrangers: [],
      tempo: 0,
    ),
  );
  ReactiveValue<Song> get currentSong {
    if (_currentIndex.value < 0) {
      return ReactiveValue<Song>(
        Song(
          id: ConstValues.emptySongID,
          title: '',
          composer: '',
          arrangers: [],
          tempo: 0,
        ),
      );
    }
    var test = ReactiveValue<Song>(
      _allSongs.value.firstWhere(
        (e) => e.id == _queuedSongIds.value[_currentIndex.value],
      ),
    );

    return test;
  }

  SongService() {
    _createFakerSongs();
    listenToReactiveValues([
      _allSongs,
      _currentIndex,
      _queuedSongIds,
      _currentSong,
    ]);
  }

  void _createFakerSongs() {
    _allSongs.value = _songFactory.generateFakeList(length: 500);
  }

  void selectSong({
    required Song song,
    List<Song> songs = const [],
  }) {
    // If no songs passed to queue then queue entire song list ids

    // Overly complicated once not dealing with factory data
    // TODO: Randomize songs for album/playlist factories and treat
    // master song list as alphabetized. Remove all sorting app-wide
    if (songs.isEmpty) {
      List<Song> sortedAllSongs = _allSongs.value.toList();
      sortedAllSongs.sort(
        (a, b) => a.title.compareTo(b.title),
      );
      _queuedSongIds.value = [
        ...sortedAllSongs.map((e) => e.id),
      ];
    } else {
      _queuedSongIds.value = [...songs.map((e) => e.id)];
    }

    // Set current index to position of song in queue
    _currentIndex.value = _queuedSongIds.value.indexWhere(
      (e) {
        return e == song.id;
      },
    );
  }

  void previousSong() {
    if (_currentIndex.value > 0) {
      _currentIndex.value--;
    }
  }

  void nextSong() {
    if (_currentIndex.value < _queuedSongIds.value.length) {
      _currentIndex.value++;
    }
  }

  void setTempo(double tempo) {}

  void clearSongQueue() {
    _currentIndex.value = -1;
    _queuedSongIds.value = [];
  }
}
