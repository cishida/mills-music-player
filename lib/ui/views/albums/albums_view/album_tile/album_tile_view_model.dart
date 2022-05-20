import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/app/app.router.dart';
import 'package:mills_music_player/models/album/album.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AlbumTileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void onAlbumTap(
    BuildContext context,
    Album album,
  ) {
    _navigationService.navigateTo(
      AlbumsContainerViewRoutes.albumView,
      id: ConstValues.albumsRouterId,
      arguments: AlbumViewArguments(album: album),
    );
  }
}
