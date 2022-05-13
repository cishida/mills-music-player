import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mills_music_player/ui/stacked_learn/partial_builds/partial_builds_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class PartialBuildsView extends StatelessWidget {
  const PartialBuildsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PartialBuildsViewModel>.nonReactive(
      viewModelBuilder: () => PartialBuildsViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Partial builds view'),
            _StringForm(),
            _TitleAndValue(),
          ],
        ),
      ),
    );
  }
}

class _StringForm extends HookViewModelWidget<PartialBuildsViewModel> {
  const _StringForm({Key? key})
      : super(
          key: key,
          reactive: false,
        );

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    PartialBuildsViewModel model,
  ) {
    var text = useTextEditingController();

    return TextField(
      controller: text,
      onChanged: model.updateString,
    );
  }
}

class _TitleAndValue extends ViewModelWidget<PartialBuildsViewModel> {
  const _TitleAndValue({Key? key})
      : super(
          key: key,
          reactive: true,
        );

  @override
  Widget build(
    BuildContext context,
    PartialBuildsViewModel model,
  ) {
    return Column(
      children: [
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 40.0,
          ),
        ),
      ],
    );
  }
}
