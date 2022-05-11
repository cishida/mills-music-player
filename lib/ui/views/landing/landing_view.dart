import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/views/landing/landing_view_model.dart';
import 'package:stacked/stacked.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: Text('LANDING'),
        ),
      ),
    );
  }
}
