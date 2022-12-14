import 'dart:async';

import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LandingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void initialise() {
    Timer(
      const Duration(seconds: 1),
      enter,
    );
  }

  void enter() {
    _navigationService.navigateTo(
      Routes.bottomNavView,
    );
  }
}
