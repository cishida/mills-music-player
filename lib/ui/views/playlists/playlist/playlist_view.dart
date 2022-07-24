import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/_utils/duration_util.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/ui/_dumb_widgets/buttons/full_width_pill_button.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/sliver_nav_bar.dart';
import 'package:mills_music_player/ui/_dumb_widgets/text/custom_text_scroll.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view.dart';
import 'package:mills_music_player/ui/views/playlists/playlist/playlist_view_model.dart';
import 'package:stacked/stacked.dart';

class PlaylistView extends StatelessWidget {
  const PlaylistView({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    var moviesTitles = ['Inception', 'Heat', 'Spider Man'];

    return ViewModelBuilder<PlaylistViewModel>.reactive(
      viewModelBuilder: () => PlaylistViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return <Widget>[
                SliverNavBar(
                  title: playlist.title,
                  previousPageTitle: 'Playlists',
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 200.0,
                        child: FullWidthPillButton(
                          text: 'Add songs',
                          color: Colors.white,
                          textColor: Colors.black,
                          onPressed: model.showRemoveSongs,
                        ),
                      ),
                      SizedBox(
                        width: 200.0,
                        child: FullWidthPillButton(
                          text: 'Remove songs',
                          color: Colors.white,
                          textColor: Colors.black,
                          onPressed: model.showRemoveSongs,
                        ),
                      ),
                    ],
                  ),

                  ReorderableListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    buildDefaultDragHandles: false,
                    onReorder: (oldIndex, newIndex) {
                      // Handle reorder
                    },
                    children: playlist.songs.map((song) {
                      var index = playlist.songs.indexOf(song);
                      bool isSelected = model.currentSong.id == song.id;
                      // return SongTileView(
                      //   key: Key('$index'),
                      //   song: playlist.songs[index],
                      //   songs: playlist.songs,
                      // );
                      return ListTile(
                        key: Key('${index}'),
                        tileColor: Colors.white,
                        leading: model.isRemovingSongs
                            ? Checkbox(
                                onChanged: (value) {
                                  print('onChanged');
                                },
                                value: true,
                              )
                            : null,
                        title: CustomTextScroll(
                          text: song.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextScroll(
                              text: 'Composed by ${song.composer}',
                              style: const TextStyle(
                                color: ConstColors.navGray,
                                fontSize: 16.0,
                              ),
                            ),
                            CustomTextScroll(
                              text: 'Arranged by ${song.arrangers.join(', ')}',
                              style: const TextStyle(
                                color: ConstColors.navGray,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              isSelected
                                  ? 'Now Playing'
                                  : DurationUtil.format(song.duration),
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.orange
                                    : ConstColors.navGray,
                              ),
                            ),
                          ],
                        ),
                        trailing: ReorderableDragStartListener(
                          index: index,
                          child: const Icon(
                            Icons.more_vert_rounded,
                            size: 24.0,
                          ),
                        ),
                        onTap: () {
                          // Handle tap
                        },
                      );
                    }).toList(),
                  ),

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: playlist.songs.length,
                  //   itemBuilder: (context, index) => SongTileView(
                  //     song: playlist.songs[index],
                  //     songs: playlist.songs,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },

      // Scaffold(
      //   body: Column(
      //     children: [
      //       TopNavBar(
      //         title: playlist.title,
      //         trailing: Text(
      //           PluralsUtil.songs(playlist.songs.length),
      //           textAlign: TextAlign.right,
      //         ),
      //       ),
      //       Expanded(
      //         child: ListView.builder(
      //           shrinkWrap: true,
      //           itemCount: playlist.songs.length,
      //           itemBuilder: (context, index) => SongTileView(
      //             song: playlist.songs[index],
      //             songs: playlist.songs,
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
