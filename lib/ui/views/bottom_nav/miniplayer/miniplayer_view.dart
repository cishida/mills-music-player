import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mills_music_player/_utils/just_audio_common.dart';
import 'package:mills_music_player/ui/views/bottom_nav/miniplayer/_components/control_buttons.dart';
import 'package:mills_music_player/ui/views/bottom_nav/miniplayer/miniplayer_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:rxdart/rxdart.dart';

class MiniplayerView extends StatefulWidget {
  const MiniplayerView({
    Key? key,
  }) : super(key: key);

  @override
  State<MiniplayerView> createState() => _MiniplayerViewState();
}

class _MiniplayerViewState extends State<MiniplayerView>
    with WidgetsBindingObserver {
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MiniplayerViewModel>.reactive(
      viewModelBuilder: () => MiniplayerViewModel(),
      builder: (context, model, child) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.selectedSong.title,
              ),
              // // Display play/pause button and volume/speed sliders.
              // ControlButtons(_player),
              // // Display seek bar. Using StreamBuilder, this widget rebuilds
              // // each time the position, buffered position or duration changes.
              // StreamBuilder<PositionData>(
              //   stream: _positionDataStream,
              //   builder: (context, snapshot) {
              //     final positionData = snapshot.data;
              //     return SeekBar(
              //       duration: positionData?.duration ?? Duration.zero,
              //       position: positionData?.position ?? Duration.zero,
              //       bufferedPosition:
              //           positionData?.bufferedPosition ?? Duration.zero,
              //       onChangeEnd: _player.seek,
              //     );
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
