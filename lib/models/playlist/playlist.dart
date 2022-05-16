import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mills_music_player/models/song/song.dart';

part 'playlist.freezed.dart';
part 'playlist.g.dart';

@freezed
class Playlist with _$Playlist {
  factory Playlist({
    required String id,
    required String title,
    required DateTime createdAt,
    required List<Song> songs,
  }) = _Playlist;

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
}
