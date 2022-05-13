import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/_smart_widgets/double_increase_counter/double_increase_counter.dart';
import 'package:mills_music_player/ui/_smart_widgets/single_increase_counter/single_increase_counter.dart';

class ReactiveExampleView extends StatelessWidget {
  const ReactiveExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: const [
            SingleIncreaseCounter(),
            SizedBox(
              width: 50,
            ),
            DoubleIncreaseCounter(),
          ],
        ),
      ),
    );
  }
}
