import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/stacked_learn/second/second_view_model.dart';
import 'package:stacked/stacked.dart';

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: model.doSomething,
        ),
        body: Center(
          child: Container(
            color: Colors.red,
            height: 100,
            width: 100,
            child: Text(model.title),
          ),
        ),
      ),
      viewModelBuilder: () => SecondViewModel(),
    );
  }
}
