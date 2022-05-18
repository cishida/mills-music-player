import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mills_music_player/_utils/just_audio_common.dart';

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 55,
        ),

        IconButton(
          icon: const Icon(Icons.skip_previous_rounded),
          iconSize: 48.0,
          onPressed: () {
            debugPrint('Previous song');
          },
        ),
        // IconButton(
        //   icon: const Icon(Icons.volume_up),
        //   onPressed: () {
        //     showSliderDialog(
        //       context: context,
        //       title: "Adjust volume",
        //       divisions: 10,
        //       min: 0.0,
        //       max: 1.0,
        //       value: player.volume,
        //       stream: player.volumeStream,
        //       onChanged: player.setVolume,
        //     );
        //   },
        // ),

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

        // IconButton(
        //   icon: const Icon(Icons.speed_rounded),
        //   iconSize: 30.0,
        //   onPressed: () {
        //     debugPrint('Increase tempo');
        //   },
        // ),

        // Opens speed slider dialog
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) {
            return GestureDetector(
              onTap: () {
                showSliderDialog(
                  context: context,
                  title: "Adjust tempo",
                  divisions: 190,
                  min: 0.10,
                  max: 2.00,
                  value: player.speed,
                  stream: player.speedStream,
                  onChanged: player.setSpeed,
                );
              },
              child: Container(
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
                    Text(
                      '${((snapshot.data ?? 1) * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
