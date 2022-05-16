import 'package:intl/intl.dart';

class PluralsUtil {
  static songs(int howMany) {
    return '$howMany ${Intl.plural(
      howMany,
      one: 'song',
      other: 'songs',
    )}';
  }
}
