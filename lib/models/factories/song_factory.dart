import 'package:mills_music_player/models/factories/model_factory.dart';
import 'package:mills_music_player/models/song/song.dart';

class SongFactory extends ModelFactory<Song> {
  @override
  Song generateFake() {
    String title = faker.lorem.words(4).join(' ');
    return Song(
      id: createFakeUuid(),
      title: title[0].toUpperCase() + title.substring(1, title.length - 1),
      artists: [
        '${faker.person.firstName()} ${faker.person.lastName()}'.trim()
      ],
      tempo: 100.0,
      duration: Duration(seconds: faker.randomGenerator.integer(300, min: 100)),
    );
  }

  @override
  List<Song> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
