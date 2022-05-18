import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/player/player_service.dart';
import 'package:stacked/stacked.dart';

class MiniplayerViewModel extends ReactiveViewModel {
  final PlayerService _playerService = locator<PlayerService>();
  Song get selectedSong => _playerService.reactiveSong.value;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _playerService,
      ];
}
