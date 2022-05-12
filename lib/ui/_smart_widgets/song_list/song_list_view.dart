import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_list/components/song_list_divider.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_list/song_list_view_model.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view.dart';
import 'package:stacked/stacked.dart';

class SongListView extends StatelessWidget {
  const SongListView({
    Key? key,
  }) : super(key: key);

  final indexBarOptions = const IndexBarOptions(
    needRebuild: true,
    indexHintAlignment: Alignment.centerRight,
    indexHintOffset: Offset(-20, 0),
    selectTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    selectItemDecoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final double indexBarHeight = MediaQuery.of(context).size.height * .6;

    return ViewModelBuilder<SongListViewModel>.reactive(
      viewModelBuilder: () => SongListViewModel(),
      builder: (context, model, child) {
        model.createFakerSongs();

        return AzListView(
          data: model.songData,
          itemCount: model.songs.length,
          itemBuilder: (BuildContext context, int index) => SongTileView(
            song: model.songs[index],
          ),
          physics: const BouncingScrollPhysics(),
          indexBarData: SuspensionUtil.getTagIndexList(model.songData),
          indexBarItemHeight: indexBarHeight / model.numTags(),
          susItemBuilder: (context, index) => SongListDivider(
            tag: model.songData[index].getSuspensionTag(),
          ),
          indexBarMargin: const EdgeInsets.only(right: 8),
          indexBarOptions: indexBarOptions,
        );
      },
    );
  }
}
