import 'package:flutter/material.dart';
import 'package:mills_music_player/models/factories/song_factory.dart';
import 'package:mills_music_player/test_data/song_data.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view.dart';
import 'package:mills_music_player/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

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

  @override
  Widget build(BuildContext context) {
    final songFactory = SongFactory();
    final fakeSongs = songFactory.generateFakeList(length: 100);

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
