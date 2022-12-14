import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/_smart_widgets/single_increase_counter/single_increase_counter_view_model.dart';
import 'package:stacked/stacked.dart';

class SingleIncreaseCounter extends StatelessWidget {
  const SingleIncreaseCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SingleIncreaseCounterViewModel>.reactive(
      viewModelBuilder: () => SingleIncreaseCounterViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: model.updateCounter,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Tap to increment counter',
                textAlign: TextAlign.center,
              ),
              Text(
                model.counter.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
