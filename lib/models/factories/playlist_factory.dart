import 'dart:math';

import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/factories/model_factory.dart';
import 'package:mills_music_player/models/playlist/playlist.dart';
import 'package:mills_music_player/services/song/song_service.dart';

class PlaylistFactory extends ModelFactory<Playlist> {
  final _songService = locator<SongService>();
  final _random = Random();
  int index = 0;

  @override
  Playlist generateFake() {
    final playlistLength = 2 + _random.nextInt(10);

    final playlist = Playlist(
      id: createFakeUuid(),
      title: faker.lorem.words(3).join(' '),
      songs: _songService.reactiveSongs.value
          .skip(index)
          .take(playlistLength)
          .toList(),
    );

    index += playlistLength;
    return playlist;
  }

  @override
  List<Playlist> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
