import 'package:mills_music_player/services/counter_service.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:mills_music_player/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:mills_music_player/ui/views/home/home_view.dart';
import 'package:mills_music_player/ui/views/landing/landing_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: LandingView,
      initial: true,
    ),
    MaterialRoute(
      page: BottomNavView,
    ),
    MaterialRoute(
      page: HomeView,
    )
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
