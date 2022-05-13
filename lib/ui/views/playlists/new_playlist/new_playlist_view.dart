import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/ui/views/playlists/new_playlist/new_playlist_view_model.dart';
import 'package:stacked/stacked.dart';

class NewPlaylistView extends StatelessWidget {
  const NewPlaylistView({
    Key? key,
    required this.close,
  }) : super(key: key);

  final Function close;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewPlaylistViewModel>.reactive(
      viewModelBuilder: () => NewPlaylistViewModel(),
      builder: (context, model, child) {
        return Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => close(),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.close,
                    size: 20.0,
                    color: ConstColors.navGray,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Give your playlist a name.',
              style: TextStyle(
                fontSize: 18.0,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }
}
