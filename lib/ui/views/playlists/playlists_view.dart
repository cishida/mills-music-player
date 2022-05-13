import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/ui/views/playlists/playlists_view_model.dart';
import 'package:stacked/stacked.dart';

class PlaylistsView extends StatelessWidget {
  const PlaylistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaylistsViewModel>.reactive(
      viewModelBuilder: () => PlaylistsViewModel(),
      builder: (context, model, child) {
        model.createFakerPlaylists();

        return ListView.builder(
          shrinkWrap: true,
          itemCount: model.playlists.length,
          itemBuilder: (context, index) {
            final Playlist playlist = model.playlists[index];

            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    selectedColor: ConstColors.offWhite,
                    onTap: () => model.onPlaylistTap(
                      context,
                      playlist,
                    ),
                    title: Text(
                      playlist.title,
                    ),
                    trailing: Text(
                      '${playlist.songs.length.toString()} songs',
                    ),
                  ),
                  const Divider(
                    color: ConstColors.lightDivider,
                    height: 1.0,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
