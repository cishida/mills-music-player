import 'dart:math';

import 'package:mills_music_player/app/app.locator.dart';
import 'package:mills_music_player/models/factories/model_factory.dart';
import 'package:mills_music_player/models/album/album.dart';
import 'package:mills_music_player/services/song/song_service.dart';

class AlbumFactory extends ModelFactory<Album> {
  final _songService = locator<SongService>();
  final _random = Random();
  int index = 0;

  @override
  Album generateFake() {
    final albumLength = 5 + _random.nextInt(15);

    final album = Album(
      id: createFakeUuid(),
      title: faker.lorem.words(3).join(' '),
      artists: [
        '${faker.person.firstName()} ${faker.person.lastName()}'.trim()
      ],
      songs: _songService.allSongs.value.skip(index).take(albumLength).toList(),
    );

    index += albumLength;
    return album;
  }

  @override
  List<Album> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
