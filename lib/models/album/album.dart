import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mills_music_player/models/song/song.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  factory Album({
    required String id,
    required String title,
    required List<String> artists,
    required List<Song> songs,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
