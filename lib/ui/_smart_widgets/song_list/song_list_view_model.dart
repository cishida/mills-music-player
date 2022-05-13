import 'package:azlistview/azlistview.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/az_item/az_item.dart';
import 'package:mills_music_player/models/factories/song_factory.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:stacked/stacked.dart';

class SongListViewModel extends ReactiveViewModel {
  final _songService = locator<SongService>();
  List<Song> get songs => _songService.reactiveSongs.value;

  List<ISuspensionBean> _songData = [];
  List<ISuspensionBean> get songData => _songData;

  int numTags() {
    return SuspensionUtil.getTagIndexList(
      _songData,
    ).length;
  }

  void setSongData() {
    _songData = songs
        .map(
          (e) => AZItem(
            title: e.title,
            tag: e.title[0].toUpperCase(),
          ),
        )
        .toList();
    SuspensionUtil.sortListBySuspensionTag(_songData);
    SuspensionUtil.setShowSuspensionStatus(_songData);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _songService,
      ];
}