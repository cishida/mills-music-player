import 'package:mills_music_player/services/counter_service.dart';
import 'package:mills_music_player/services/player/player_service.dart';
import 'package:mills_music_player/services/playlist/playlist_service.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:mills_music_player/ui/views/albums/album/album_view.dart';
import 'package:mills_music_player/ui/views/albums/albums_container_view.dart';
import 'package:mills_music_player/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:mills_music_player/ui/views/landing/landing_view.dart';
import 'package:mills_music_player/ui/views/albums/albums_view/albums_view.dart';
import 'package:mills_music_player/ui/views/playlists/playlists_view.dart';
import 'package:mills_music_player/ui/views/settings/settings_view.dart';
import 'package:mills_music_player/ui/views/songs/songs_view.dart';
import 'package:stacked/stacked.dart';
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
      maintainState: true,
      children: [
        CustomRoute(
          page: SongsView,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
          opaque: true,
          maintainState: true,
        ),
        CustomRoute(
          page: AlbumsContainerView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
          opaque: true,
          maintainState: true,
          children: [
            MaterialRoute(
              page: AlbumsView,
              initial: true,
              maintainState: true,
            ),
            MaterialRoute(
              page: AlbumView,
              maintainState: true,
            ),
          ],
        ),
        CustomRoute(
          page: PlaylistsView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
          opaque: true,
          maintainState: true,
        ),
        CustomRoute(
          page: SettingsView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 0,
          reverseDurationInMilliseconds: 0,
          opaque: true,
          maintainState: true,
        ),
      ],
      // children: [
      //   MaterialRoute(
      //     page: SongsView,
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
    //   page: SongsView,
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
    LazySingleton(
      classType: PlaylistService,
    ),
    LazySingleton(
      classType: PlayerService,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {
  /* Serves no purpose besides annotation */
}
