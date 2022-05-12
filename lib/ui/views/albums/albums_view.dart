import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/ui/views/albums/albums_view_model.dart';
import 'package:stacked/stacked.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumsViewModel>.reactive(
      viewModelBuilder: () => AlbumsViewModel(),
      builder: (context, model, child) {
        model.createFakerAlbums();

        return ListView.builder(
          itemCount: model.albums.length,
          itemBuilder: (context, index) {
            final album = model.albums[index];

            return Container(
              padding: const EdgeInsets.only(right: 50),
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                      left: 16,
                    ),
                    title: Text(
                      album.title,
                    ),
                    subtitle: Text(
                      album.artists.join(', '),
                    ),
                    trailing: Text(
                      '${album.songs.length.toString()} songs',
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
