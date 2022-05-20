import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/models/factories/song_factory.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@LazySingleton()
class SongService with ReactiveServiceMixin {
  final _songFactory = SongFactory();

  int _currentIndex = -1;
  List<String> _queuedSongIds = [];

  final ReactiveValue<List<Song>> _allSongs = ReactiveValue<List<Song>>([]);
  ReactiveValue<List<Song>> get allSongs => _allSongs;

  final ReactiveValue<Song> _currentSong = ReactiveValue<Song>(
    Song(
      id: ConstValues.emptySongID,
      title: '',
      composer: '',
      arrangers: [],
      tempo: 0,
    ),
  );
  ReactiveValue<Song> get currentSong => _currentSong;

  void setQueuedIds(List<Song> songs) {
    if (songs.isEmpty) {
      List<Song> sortedAllSongs = _allSongs.value.toList();
      sortedAllSongs.sort(
        (a, b) => a.title.compareTo(b.title),
      );
      _queuedSongIds = [
        ...sortedAllSongs.map((e) => e.id),
      ];
    } else {
      _queuedSongIds = [...songs.map((e) => e.id)];
    }
  }

  void setCurrentSong() {
    if (_currentIndex < 0) {
      _currentSong.value = Song(
        id: ConstValues.emptySongID,
        title: '',
        composer: '',
        arrangers: [],
        tempo: 0,
      );
    } else {}
    _currentSong.value = _allSongs.value.firstWhere(
      (e) => e.id == _queuedSongIds[_currentIndex],
    );
  }

  SongService() {
    _createFakerSongs();
    listenToReactiveValues([
      _allSongs,
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
    setQueuedIds(songs);

    // Set current index to position of song in queue
    _currentIndex = _queuedSongIds.indexWhere(
      (e) {
        return e == song.id;
      },
    );

    setCurrentSong();
  }

  void previousSong() {
    if (_currentIndex > 0) {
      _currentIndex--;
    }
  }

  void nextSong() {
    if (_currentIndex < _queuedSongIds.length) {
      _currentIndex++;
    }
  }

  void setTempo(double tempo) {}

  void clearSongQueue() {
    _currentIndex = -1;
    _queuedSongIds = [];
  }
}
