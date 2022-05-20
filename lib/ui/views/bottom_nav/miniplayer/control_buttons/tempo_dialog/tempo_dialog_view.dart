import 'package:flutter/material.dart';
import 'package:mills_music_player/ui/_dumb_widgets/text/tempo_percent.dart';
import 'package:mills_music_player/ui/views/bottom_nav/miniplayer/control_buttons/tempo_dialog/tempo_dialog_view_model.dart';
import 'package:stacked/stacked.dart';

class TempoDialogView extends StatelessWidget {
  const TempoDialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TempoDialogViewModel>.reactive(
      viewModelBuilder: () => TempoDialogViewModel(),
      builder: (context, model, child) {
        return SizedBox(
          height: 90.0,
          width: MediaQuery.of(context).size.width * .9,
          child: Column(
            children: [
              TempoPercent(
                value: model.currentSong.tempo,
              ),
              Slider(
                divisions: 190,
                min: 10,
                max: 200,
                value: model.currentSong.tempo,
                onChanged: (tempo) => model.setTempo(tempo),
              ),
            ],
          ),
        );
      },
    );
  }
}
