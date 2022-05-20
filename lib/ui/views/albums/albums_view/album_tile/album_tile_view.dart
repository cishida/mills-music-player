import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/_utils/plurals_util.dart';
import 'package:mills_music_player/models/album/album.dart';
import 'package:mills_music_player/models/song/song.dart';
import 'package:mills_music_player/ui/_dumb_widgets/text/custom_text_scroll.dart';
import 'package:mills_music_player/ui/views/albums/albums_view/album_tile/album_tile_view_model.dart';
import 'package:stacked/stacked.dart';

class AlbumTileView extends StatelessWidget {
  const AlbumTileView({
    Key? key,
    required this.album,
    this.isAlphabetical = false,
    this.songs = const [],
  }) : super(key: key);

  final Album album;
  final bool isAlphabetical;
  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumTileViewModel>.reactive(
      viewModelBuilder: () => AlbumTileViewModel(),
      builder: (context, model, child) {
        return InkWell(
          onTap: () => model.onAlbumTap(
            context,
            album,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextScroll(
                            text: album.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                            ),
                          ),
                          Text(
                            PluralsUtil.songs(album.songs.length),
                            style: const TextStyle(
                              color: ConstColors.navGray,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      size: 32.0,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: ConstColors.divider,
                height: 1.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
