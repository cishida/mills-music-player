import 'package:azlistview/azlistview.dart';
import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/az_item/az_item.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/services/song/song_service.dart';
import 'package:stacked/stacked.dart';

class AZSongListViewModel extends ReactiveViewModel {
  final _songService = locator<SongService>();
  List<Song> get songs {
    return _songService.allSongs.value;
  }

  List<ISuspensionBean> _songData = [];
  List<ISuspensionBean> get songData => _songData;

  List<Song> _sortedSongs = [];
  List<Song> get sortedSongs => _sortedSongs;

  int numTags() {
    return SuspensionUtil.getTagIndexList(
      _songData,
    ).length;
  }

  void setSongData() {
    _sortedSongs = songs.toList();
    _sortedSongs.sort(
      (a, b) => a.title.compareTo(b.title),
    );
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
