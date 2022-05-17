import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/app/app.router.dart';
import 'package:mills_music_player/models/album/album.dart';
import 'package:mills_music_player/models/factories/album_factory.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AlbumsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _albumFactory = AlbumFactory();

  List<Album> _albums = [];
  List<Album> get albums => _albums;

  void createFakerAlbums() {
    _albums = _albumFactory.generateFakeList(length: 30);
    _albums.sort(
      (a, b) => a.title.compareTo(b.title),
    );
  }

  void onAlbumTap(
    BuildContext context,
    Album album,
  ) {
    _navigationService.navigateTo(
      AlbumsContainerViewRoutes.albumView,
      id: ConstValues.albumsRouterId,
      arguments: AlbumViewArguments(album: album),
    );
    // Navigator.of(context).push(
    //   MaterialPageRoute<String>(
    //     builder: (BuildContext context) {
    //       return AlbumView(
    //         album: album,
    //       );
    //     },
    //     // fullscreenDialog: true,
    //   ),
    // );
  }
}
