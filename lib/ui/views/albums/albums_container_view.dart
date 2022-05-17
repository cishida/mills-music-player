import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_values.dart';
import 'package:mills_music_player/app/app.router.dart';
import 'package:mills_music_player/ui/views/albums/albums_container_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AlbumsContainerView extends StatelessWidget {
  const AlbumsContainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumsContainerViewModel>.reactive(
      viewModelBuilder: () => AlbumsContainerViewModel(),
      builder: (context, model, child) {
        return ExtendedNavigator(
          router: AlbumsContainerViewRouter(),
          navigatorKey: StackedService.nestedNavigationKey(
            ConstValues.albumsRouterId,
          ),
        );
      },
    );
  }
}
