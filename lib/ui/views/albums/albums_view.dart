import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/views/albums/albums_view_model.dart';
import 'package:stacked/stacked.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumsViewModel>.reactive(
      viewModelBuilder: () => AlbumsViewModel(),
      builder: (context, model, child) => const Center(
        child: Text(
          'Albums content',
        ),
      ),
    );
  }
}
