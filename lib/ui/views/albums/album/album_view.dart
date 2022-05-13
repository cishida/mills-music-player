import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/ui/views/albums/album/album_view_model.dart';
import 'package:mills_music_player/ui/views/albums/albums_view_model.dart';
import 'package:stacked/stacked.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumViewModel>.reactive(
      viewModelBuilder: () => AlbumViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.chevron_left,
                  size: 20.0,
                ),
              ),
              Text('Single album view!'),
            ],
          ),
        );
      },
    );
  }
}
