import 'dart:math';

import 'package:mills_music_player/_constants/_names.dart';
import 'package:mills_music_player/models/factories/model_factory.dart';
import 'package:mills_music_player/models/song/song.dart';

class SongFactory extends ModelFactory<Song> {
  final _random = Random();

  String createFakeName() {
    return '${faker.person.firstName()} ${faker.person.lastName()}'.trim();
  }

  @override
  Song generateFake() {
    String title = faker.lorem.words(4).join(' ');
    List<String> arrangers = [];
    int num = 1 + _random.nextInt(2);
    for (var i = 0; i < num; i++) {
      arrangers.add(
        createFakeName(),
      );
    }

    return Song(
      id: createFakeUuid(),
      title: title[0].toUpperCase() + title.substring(1, title.length - 1),
      composer: createFakeName(),
      arrangers: arrangers,
      tempo: 100.0,
      duration: Duration(seconds: faker.randomGenerator.integer(300, min: 100)),
    );
  }

  @override
  List<Song> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }

  List<Song> generatePlaceholderList() {
    List<Song> songs = [];

    for (var title in ConstNames.songs) {
      List<String> arrangers = [];
      int num = 1 + _random.nextInt(2);
      for (var i = 0; i < num; i++) {
        arrangers.add(
          createFakeName(),
        );
      }

      songs.add(
        Song(
          id: createFakeUuid(),
          title: title,
          composer: createFakeName(),
          arrangers: arrangers,
          tempo: 100.0,
          duration: Duration(
            seconds: faker.randomGenerator.integer(300, min: 100),
          ),
        ),
      );
    }

    return songs;
  }
}
