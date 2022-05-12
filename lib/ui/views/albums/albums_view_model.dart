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
    _albums = _albumFactory.generateFakeList(length: 10);
    _albums.sort(
      (a, b) => a.title.compareTo(b.title),
    );
  }

  void onAlbumTap() {
    _navigationService.navigateTo(
      Routes.landingView,
    );
  }
}
