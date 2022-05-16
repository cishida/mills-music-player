import 'package:mills_music_player/models/factories/playlist_factory.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:uuid/uuid.dart';

@LazySingleton()
class PlaylistService with ReactiveServiceMixin {
  final _playlistFactory = PlaylistFactory();

  final ReactiveValue<List<Playlist>> _reactivePlaylists =
      ReactiveValue<List<Playlist>>([]);
  ReactiveValue<List<Playlist>> get reactivePlaylists => _reactivePlaylists;

  PlaylistService() {
    _createFakerPlaylists();
    listenToReactiveValues([_reactivePlaylists]);
  }

  void _createFakerPlaylists() {
    _reactivePlaylists.value = _playlistFactory.generateFakeList(length: 2);
  }

  void createPlaylist({
    required String title,
  }) {
    Playlist newPlaylist = Playlist(
      id: const Uuid().v4(),
      title: title,
      createdAt: DateTime.now(),
      songs: [],
    );

    _reactivePlaylists.value.add(newPlaylist);
    notifyListeners();
  }
}
