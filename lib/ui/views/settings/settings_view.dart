import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/views/settings/settings_view_model.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) {
        return NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return <Widget>[
              const CupertinoSliverNavigationBar(
                largeTitle: Text('Settings'),
                transitionBetweenRoutes: false,
                automaticallyImplyLeading: false,
              )
            ];
          },
          body: const Center(
            child: Text(
              'Settings content',
            ),
          ),
        );
      },
    );
  }
}
