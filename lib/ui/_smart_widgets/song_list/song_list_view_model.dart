import 'package:azlistview/azlistview.dart';
import 'package:mills_music_player/models/az_item/az_item.dart';
import 'package:mills_music_player/models/factories/song_factory.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:stacked/stacked.dart';

class SongListViewModel extends BaseViewModel {
  final _songFactory = SongFactory();
  List<Song> _songs = [];
  List<ISuspensionBean> _songData = [];

  List<Song> get songs => _songs;
  List<ISuspensionBean> get songData => _songData;

  int numTags() {
    return SuspensionUtil.getTagIndexList(
      _songData,
    ).length;
  }

  void createFakerSongs() {
    final fakerSongs = _songFactory.generateFakeList(length: 500);
    fakerSongs.sort(
      ((a, b) => a.title.compareTo(b.title)),
    );

    _songs = fakerSongs;
    _setSongData();
  }

  void _setSongData() {
    _songData = _songs
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
