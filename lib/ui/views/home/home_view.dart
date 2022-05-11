import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/top_nav_bar.dart';
import 'package:mills_music_player/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Column(
        children: const [
          TopNavBar(
            title: 'Home',
          ),
          Center(
            child: Text('Home'),
          ),
        ],
      ),
    );
  }
}
