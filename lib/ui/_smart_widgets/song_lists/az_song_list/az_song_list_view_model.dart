import 'package:azlistview/azlistview.dart';
import 'package:mills_music_player/models/az_item/az_item.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:stacked/stacked.dart';

class AZSongListViewModel extends BaseViewModel {
  List<ISuspensionBean> _songData = [];
  List<ISuspensionBean> get songData => _songData;

  List<Song> _sortedSongs = [];
  List<Song> get sortedSongs => _sortedSongs;

  int numTags() {
    return SuspensionUtil.getTagIndexList(
      _songData,
    ).length;
  }

  void setSongData(List<Song> songs) {
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
}
