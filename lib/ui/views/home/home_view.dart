import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/_smart_widgets/song_list/song_list_view.dart';
import 'package:mills_music_player/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => const SongListView(),
    );
  }
}
