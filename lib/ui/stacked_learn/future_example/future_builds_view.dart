import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mills_music_player/ui/stacked_learn/future_example/future_builds_view_model.dart';
import 'package:stacked/stacked.dart';

class FutureExampleView extends StatelessWidget {
  const FutureExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureBuildsViewModel>.reactive(
      viewModelBuilder: () => FutureBuildsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: model.isBusy
              ? CircularProgressIndicator()
              : Text(
                  model.data ?? '',
                ),
        ),
      ),
    );
  }
}
