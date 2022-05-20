import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mills_music_player/ui/_dumb_widgets/text/tempo_percent.dart';
import 'package:mills_music_player/ui/views/bottom_nav/miniplayer/control_buttons/control_buttons_view_model.dart';
import 'package:mills_music_player/ui/views/bottom_nav/miniplayer/control_buttons/tempo_dialog/tempo_dialog_view.dart';
import 'package:stacked/stacked.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({
    Key? key,
    required this.player,
  }) : super(key: key);

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ControlButtonsViewModel>.reactive(
      viewModelBuilder: () => ControlButtonsViewModel(),
      builder: (context, model, child) {
        const double tempoIconWidth = 55;

        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: tempoIconWidth,
                ),

                IconButton(
                  icon: const Icon(Icons.skip_previous_rounded),
                  iconSize: 48.0,
                  onPressed: () {
                    debugPrint('Previous song');
                  },
                ),

                /// This StreamBuilder rebuilds whenever the player state changes, which
                /// includes the playing/paused state and also the
                /// loading/buffering/ready state. Depending on the state we show the
                /// appropriate button or loading indicator.
                StreamBuilder<PlayerState>(
                  stream: player.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 64.0,
                        height: 64.0,
                        child: const CircularProgressIndicator(),
                      );
                    } else if (playing != true) {
                      return IconButton(
                        icon: const Icon(Icons.play_arrow_rounded),
                        iconSize: 64.0,
                        onPressed: player.play,
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return IconButton(
                        icon: const Icon(Icons.pause),
                        iconSize: 64.0,
                        onPressed: player.pause,
                      );
                    } else {
                      return IconButton(
                        icon: const Icon(Icons.replay),
                        iconSize: 64.0,
                        onPressed: () => player.seek(Duration.zero),
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next_rounded),
                  iconSize: 48.0,
                  onPressed: () {
                    debugPrint('Next song');
                  },
                ),

                // Opens tempo slider dialog
                GestureDetector(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (context) => const AlertDialog(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        title: Text(
                          'Adjust Tempo',
                          textAlign: TextAlign.center,
                        ),
                        content: TempoDialogView(),
                      ),
                    );
                  },
                  child: Container(
                    width: tempoIconWidth,
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      top: 15.0,
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.speed_rounded,
                          size: 32.0,
                        ),
                        TempoPercent(
                          value: model.currentSong.tempo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
