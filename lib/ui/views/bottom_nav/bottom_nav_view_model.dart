import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/app/app.router.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BottomNavViewModel extends ReactiveViewModel {
  // final PlayerService _playerService = locator<PlayerService>();
  // Song get selectedSong => _playerService.reactiveSong.value;
  final SongService _songService = locator<SongService>();
  Song get currentSong => _songService.currentSong.value;

  final _navigationService = locator<NavigationService>();
  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;

  void setTabIndex(int value) {
    _currentTabIndex = value;

    String routeName = '';
    switch (value) {
      case 0:
        routeName = BottomNavViewRoutes.songsView;
        break;
      case 1:
        routeName = BottomNavViewRoutes.albumsContainerView;
        break;
      case 2:
        routeName = BottomNavViewRoutes.playlistsView;
        break;
      case 3:
        routeName = BottomNavViewRoutes.settingsView;
        break;
      default:
    }

    _navigationService.replaceWith(
      routeName,
      id: ConstValues.bottomNavRouterId,
      parameters: {},
    );

    notifyListeners();
  }

  bool get shouldShowPlayer =>
      _songService.currentSong.value.id != ConstValues.emptySong.id;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _songService,
      ];
}
