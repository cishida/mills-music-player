import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AlbumViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.back(
      id: ConstValues.albumsRouterId,
    );
  }
}
