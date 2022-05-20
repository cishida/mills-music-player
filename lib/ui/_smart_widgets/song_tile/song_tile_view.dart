import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/_utils/duration_util.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_tile/song_tile_view_model.dart';
import 'package:stacked/stacked.dart';

class SongTileView extends StatelessWidget {
  const SongTileView({
    Key? key,
    required this.song,
    this.isAlphabetical = false,
  }) : super(key: key);

  final Song song;
  final bool isAlphabetical;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SongTileViewModel>.reactive(
      viewModelBuilder: () => SongTileViewModel(),
      builder: (context, model, child) {
        bool isSelected = model.currentSong.id == song.id;

        return InkWell(
          onTap: () => model.selectSong(song),
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(
              right: isAlphabetical ? 50 : 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Test tempo: ${song.tempo}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        song.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Composed by ${song.composer}',
                        style: const TextStyle(
                          color: ConstColors.navGray,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        'Arranged by ${song.arrangers.join(', ')}',
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
                          color:
                              isSelected ? Colors.orange : ConstColors.navGray,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: ConstColors.lightDivider,
                  height: 1.0,
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
