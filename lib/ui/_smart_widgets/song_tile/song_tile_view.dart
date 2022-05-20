import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/_utils/duration_util.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/ui/_dumb_widgets/text/custom_text_scroll.dart';
import 'package:mills_music_player/ui/_dumb_widgets/text/tempo_percent.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view_model.dart';
import 'package:stacked/stacked.dart';

class SongTileView extends StatelessWidget {
  const SongTileView({
    Key? key,
    required this.song,
    this.isAlphabetical = false,
    this.songs = const [],
  }) : super(key: key);

  final Song song;
  final bool isAlphabetical;
  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SongTileViewModel>.reactive(
      viewModelBuilder: () => SongTileViewModel(),
      builder: (context, model, child) {
        bool isSelected = model.currentSong.id == song.id;

        return InkWell(
          onTap: () => model.selectSong(
            song,
            songs,
          ),
          child: Container(
            // width: double.infinity,
            // elevation: 8.0,
            // margin: const EdgeInsets.symmetric(
            //   horizontal: 10.0,
            //   vertical: 6.0,
            // ),
            // color: ConstColors.secondaryBackground,
            // padding: EdgeInsets.only(
            //   right: isAlphabetical ? 50 : 16.0,
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: isAlphabetical ? 50 : 16.0,
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextScroll(
                              text: song.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                              ),
                            ),
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
                            // TempoPercent(
                            //   value: song.tempo,
                            //   style: const TextStyle(
                            //     color: Colors.black,
                            //     fontSize: 15.0,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.star_border,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: ConstColors.lightDivider,
                  height: 1.0,
                  endIndent: 0,
                ),
              ],
            ),
          ),
        );

        // return Container(
        //   padding: EdgeInsets.only(right: isAlphabetical ? 50 : 0),
        //   color: Colors.white,
        //   child: Column(
        //     children: [
        //       Theme(
        //         data: Theme.of(context).copyWith(
        //           dividerColor: Colors.transparent,
        //         ),
        //         child: ExpansionTile(
        //           title: Text(
        //             song.title,
        //           ),
        //           subtitle: Text(
        //             song.artists.join(', '),
        //           ),
        //           trailing: Text(
        //             DurationUtil.format(song.duration),
        //           ),
        //           children: <Widget>[
        //             ListTile(
        //               title: Text('This is tile number 1'),
        //             ),
        //           ],
        //         ),
        //       ),
        //       const Divider(
        //         color: ConstColors.lightDivider,
        //         height: 1.0,
        //       ),
        //     ],
        //   ),
        // );

        // Container(
        //   padding: EdgeInsets.only(right: isAlphabetical ? 50 : 0),
        //   color: Colors.white,
        //   child: Column(
        //     children: [
        //       ListTile(
        //         contentPadding: EdgeInsets.only(
        //           left: 16,
        //           right: isAlphabetical ? 50 : 16.0,
        //         ),
        //         title: Text(
        //           song.title,
        //         ),
        //         subtitle: Text(
        //           song.artists.join(', '),
        //         ),
        //         trailing: Text(
        //           DurationUtil.format(song.duration),
        //         ),
        //       ),
        //       const Divider(
        //         color: ConstColors.lightDivider,
        //         height: 1.0,
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }
}
