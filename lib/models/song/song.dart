import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class Song with _$Song {
  factory Song({
    required String id,
    required String title,
    required List<String> artists,
    required double tempo,
    Duration? duration,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
