import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/startup/startup_view_model.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
 const StartupView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<StartupViewModel>.reactive(
     builder: (context, model, child) => const Scaffold(),
     viewModelBuilder: () => StartupViewModel(),
   );
 }
}
