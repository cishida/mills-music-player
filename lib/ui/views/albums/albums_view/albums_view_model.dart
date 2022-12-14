import 'package:mills_music_player/models/album/album.dart';
import 'package:mills_music_player/models/factories/album_factory.dart';
import 'package:stacked/stacked.dart';

class AlbumsViewModel extends BaseViewModel {
  final _albumFactory = AlbumFactory();

  List<Album> _albums = [];
  List<Album> get albums => _albums;

  void createFakerAlbums() {
    _albums = _albumFactory.generatePlaceholderList();
    _albums.sort(
      (a, b) => a.title.compareTo(b.title),
    );
  }
}
