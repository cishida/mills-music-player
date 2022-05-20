import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@unfreezed
class Song with _$Song {
  factory Song({
    required final String id,
    required final String title,
    required final String composer,
    required final List<String> arrangers,
    required double tempo,
    Duration? duration,
  }) = _Song;

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
}
