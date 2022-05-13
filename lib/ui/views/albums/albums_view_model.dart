import 'package:flutter/material.dart';
import 'package:mills_music_player/models/album/album.dart';
import 'package:mills_music_player/models/factories/album_factory.dart';
import 'package:mills_music_player/ui/views/albums/album/album_view.dart';
import 'package:stacked/stacked.dart';

class AlbumsViewModel extends BaseViewModel {
  final _albumFactory = AlbumFactory();

  List<Album> _albums = [];
  List<Album> get albums => _albums;

  void createFakerAlbums() {
    _albums = _albumFactory.generateFakeList(length: 10);
    _albums.sort(
      (a, b) => a.title.compareTo(b.title),
    );
  }

  void onAlbumTap(
    BuildContext context,
    Album album,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute<String>(
        builder: (BuildContext context) {
          return AlbumView(
            album: album,
          );
        },
        // fullscreenDialog: true,
      ),
    );
  }
}
