import 'package:mills_music_player/models/factories/model_factory.dart';
import 'package:mills_music_player/models/song/song.dart';

class SongFactory extends ModelFactory<Song> {
  @override
  Song generateFake() {
    return Song(
      id: createFakeUuid(),
      title: faker.lorem.words(4).join(' '),
      artists: [
        '${faker.person.firstName()} ${faker.person.lastName()}'.trim()
      ],
      duration: Duration(seconds: faker.randomGenerator.integer(300, min: 100)),
    );
  }

  @override
  List<Song> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }
}
