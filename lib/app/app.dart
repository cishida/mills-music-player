import 'package:mills_music_player/services/counter_service.dart';
import 'package:mills_music_player/ui/stacked_learn/second/second_view.dart';
import 'package:mills_music_player/ui/stacked_learn/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: StartupView,
      initial: true,
    ),
    CupertinoRoute(
      page: SecondView,
    )
  ],
  dependencies: [
    LazySingleton(
      classType: NavigationService,
    ),
    LazySingleton(
      classType: CounterService,
    ),
  ],
)
class AppSetup {
  /* Serves no purpose besides annotation */
}
