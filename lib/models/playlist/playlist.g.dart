// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Playlist _$$_PlaylistFromJson(Map<String, dynamic> json) => _$_Playlist(
      id: json['id'] as String,
      title: json['title'] as String,
      songs: (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlaylistToJson(_$_Playlist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'songs': instance.songs,
    };
