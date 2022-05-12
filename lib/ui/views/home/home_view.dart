import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/models/factories/song_factory.dart';
import 'package:mills_music_player/test_data/song_data.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view.dart';
import 'package:mills_music_player/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class _AZItem extends ISuspensionBean {
  final String title;
  final String tag;

  _AZItem({
    required this.title,
    required this.tag,
  });

  @override
  String getSuspensionTag() => tag;
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => const SongList(),
    );
  }
}

class SongList extends StatelessWidget {
  const SongList({
    Key? key,
  }) : super(key: key);

  Decoration getIndexBarDecoration(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.0),
      border: Border.all(
        color: Colors.grey[300]!,
        width: .5,
      ),
    );
  }

  Widget buildHeader(String tag) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        left: 16.0,
      ),
      child: Text(
        tag,
        softWrap: false,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final songFactory = SongFactory();
    final fakeSongs = songFactory.generateFakeList(length: 500);
    fakeSongs.sort(
      ((a, b) => a.title.compareTo(b.title)),
    );
    final fakeSongsData = fakeSongs
        .map(
          (e) => _AZItem(
            title: e.title,
            tag: e.title[0].toUpperCase(),
          ),
        )
        .toList();
    SuspensionUtil.sortListBySuspensionTag(fakeSongsData);
    SuspensionUtil.setShowSuspensionStatus(fakeSongsData);

    return AzListView(
      data: fakeSongsData,
      itemCount: fakeSongs.length,
      itemBuilder: (BuildContext context, int index) {
        final item = fakeSongsData[index];
        final tag = item.getSuspensionTag();
        final offstage = !item.isShowSuspension;

        return Column(
          children: [
            // Offstage(
            //   offstage: offstage,
            //   child: buildHeader(tag),
            // ),
            SongTileView(
              song: fakeSongs[index],
            ),
          ],
        );
      },
      physics: const BouncingScrollPhysics(),
      indexBarData: SuspensionUtil.getTagIndexList(
        fakeSongsData,
      ),
      indexBarItemHeight: MediaQuery.of(context).size.height *
          .6 /
          (SuspensionUtil.getTagIndexList(
            fakeSongsData,
          )).length,
      indexBarHeight: MediaQuery.of(context).size.height * .75,
      // indexHintBuilder: (context, hint) {
      //   return Container(
      //     alignment: Alignment.center,
      //     width: 60.0,
      //     height: 60.0,
      //     decoration: BoxDecoration(
      //       // color: Colors.blue[700]!.withAlpha(200),
      //       shape: BoxShape.circle,
      //     ),
      //     child:
      //         Text(hint, style: TextStyle(color: Colors.white, fontSize: 30.0)),
      //   );
      // },
      susItemBuilder: (context, index) {
        final item = fakeSongsData[index];
        final tag = item.getSuspensionTag();
        final offstage = !item.isShowSuspension;
        return Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          color: ConstColors.offWhite,
          padding: const EdgeInsets.only(
            left: 16.0,
          ),
          child: Text(
            tag,
            softWrap: false,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      indexBarMargin: const EdgeInsets.only(right: 8),
      indexBarOptions: const IndexBarOptions(
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
        // decoration: getIndexBarDecoration(Colors.grey[50]!),
        // downDecoration: getIndexBarDecoration(Colors.grey[200]!),
      ),
    );

    // use same scrollController object to listview and scrollbar to support drag functionality
    ScrollController scrollController = ScrollController();

    return VsScrollbar(
      controller: scrollController,
      showTrackOnHover: true, // default false
      isAlwaysShown: true, // default false
      // scrollbarFadeDuration: Duration(
      //   milliseconds: 500,
      // ), // default : Duration(milliseconds: 300)
      // scrollbarTimeToFade: Duration(
      //   milliseconds: 800,
      // ), // default : Duration(milliseconds: 600)
      style: const VsScrollbarStyle(
        // hoverThickness: 10.0, // default 12.0
        radius: Radius.circular(40), // default Radius.circular(8.0)
        thickness: 12.0, // [ default 8.0 ]
        // color: Colors.purple.shade900, // default ColorScheme Theme
      ),
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        itemCount: fakeSongs.length,
        itemBuilder: (context, index) {
          return SongTileView(
            song: fakeSongs[index],
          );
        },
      ),

      // ListView.builder(
      //   controller: _scrollController,
      //   shrinkWrap: true,
      //   physics: BouncingScrollPhysics(),
      //   itemCount: 6,
      //   scrollDirection: Axis.vertical,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       height: 100,
      //       width: MediaQuery.of(context).size.width,
      //       color: Colors.purple[900],
      //       margin: EdgeInsets.all(15),
      //     );
      //   },
      // ),
    );

    // return ListView.builder(
    //   padding: const EdgeInsets.symmetric(
    //     vertical: 20.0,
    //   ),
    //   itemCount: fakeSongs.length,
    //   itemBuilder: (context, index) {
    //     return SongTileView(
    //       song: fakeSongs[index],
    //     );
    //   },
    // );
  }
}
