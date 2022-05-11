// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Song _$$_SongFromJson(Map<String, dynamic> json) => _$_Song(
      id: json['id'] as String,
      title: json['title'] as String?,
      artist: json['artist'] as String?,
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_SongToJson(_$_Song instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'duration': instance.duration?.inMicroseconds,
    };
