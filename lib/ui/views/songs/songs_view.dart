import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_lists/az_song_list/az_song_list_view.dart';
import 'package:mills_music_player/ui/views/songs/songs_view_model.dart';
import 'package:stacked/stacked.dart';

class SongsView extends StatelessWidget {
  const SongsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SongsViewModel>.reactive(
      viewModelBuilder: () => SongsViewModel(),
      builder: (context, model, child) {
        return NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return <Widget>[
              const CupertinoSliverNavigationBar(
                largeTitle: Text('Songs'),
                transitionBetweenRoutes: false,
                automaticallyImplyLeading: false,
              )
            ];
          },
          body: AZSongListView(
            unsortedSongs: model.songs,
          ),
        );
      },
    );
  }
}
