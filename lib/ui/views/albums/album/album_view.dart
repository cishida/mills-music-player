import 'package:flutter/material.dart';
import 'package:mills_music_player/models/album/album.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/top_nav_bar.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_lists/song_list/song_list_view.dart';
import 'package:mills_music_player/ui/views/albums/album/album_view_model.dart';
import 'package:stacked/stacked.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumViewModel>.reactive(
      viewModelBuilder: () => AlbumViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            children: [
              TopNavBar(
                title: album.title,
                subtitle: album.artists.join(','),
                canGoBack: true,
                trailing: Text(
                  '${album.songs.length.toString()} songs',
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(
                child: SongListView(
                  songs: album.songs,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
