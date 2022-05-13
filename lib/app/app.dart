import 'package:mills_music_player/services/counter_service.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:mills_music_player/ui/views/albums/album/album_view.dart';
import 'package:mills_music_player/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:mills_music_player/ui/views/home/home_view.dart';
import 'package:mills_music_player/ui/views/landing/landing_view.dart';
import 'package:mills_music_player/ui/views/playlists/playlists_view.dart';
import 'package:mills_music_player/ui/views/albums/albums_view.dart';
import 'package:mills_music_player/ui/views/settings/settings_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: LandingView,
      initial: true,
    ),
    // MaterialRoute(
    //   page: BottomNavView,
    // ),
    MaterialRoute(
      page: BottomNavView,
      // children: [
      //   MaterialRoute(
      //     page: HomeView,
      //     initial: true,
      //   ),
      //   MaterialRoute(
      //     page: AlbumsRouter,
      //     children: [
      //       MaterialRoute(
      //         page: AlbumsView,
      //         initial: true,
      //       ),
      //       MaterialRoute(
      //         page: AlbumView,
      //       )
      //     ],
      //   ),
      //   MaterialRoute(
      //     page: PlaylistsView,
      //   ),
      //   MaterialRoute(
      //     page: SettingsView,
      //   ),
      // ],
    ),
    // MaterialRoute(
    //   page: HomeView,
    // ),
    // MaterialRoute(
    //   page: AlbumsView,
    // ),
    // MaterialRoute(
    //   page: AlbumView,
    // ),
  ],
  dependencies: [
    LazySingleton(
      classType: NavigationService,
    ),
    LazySingleton(
      classType: CounterService,
    ),
    LazySingleton(
      classType: SongService,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /* Serves no purpose besides annotation */
}
