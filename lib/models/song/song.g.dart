// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Song _$$_SongFromJson(Map<String, dynamic> json) => _$_Song(
      id: json['id'] as String,
      title: json['title'] as String,
      artists:
          (json['artists'] as List<dynamic>).map((e) => e as String).toList(),
      tempo: (json['tempo'] as num).toDouble(),
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_SongToJson(_$_Song instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artists': instance.artists,
      'tempo': instance.tempo,
      'duration': instance.duration?.inMicroseconds,
    };
