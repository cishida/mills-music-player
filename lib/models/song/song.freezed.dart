// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'song.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Song _$SongFromJson(Map<String, dynamic> json) {
  return _Song.fromJson(json);
}

/// @nodoc
mixin _$Song {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get artists => throw _privateConstructorUsedError;
  double get tempo => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongCopyWith<Song> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongCopyWith<$Res> {
  factory $SongCopyWith(Song value, $Res Function(Song) then) =
      _$SongCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      List<String> artists,
      double tempo,
      Duration? duration});
}

/// @nodoc
class _$SongCopyWithImpl<$Res> implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._value, this._then);

  final Song _value;
  // ignore: unused_field
  final $Res Function(Song) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? artists = freezed,
    Object? tempo = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tempo: tempo == freezed
          ? _value.tempo
          : tempo // ignore: cast_nullable_to_non_nullable
              as double,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
abstract class _$$_SongCopyWith<$Res> implements $SongCopyWith<$Res> {
  factory _$$_SongCopyWith(_$_Song value, $Res Function(_$_Song) then) =
      __$$_SongCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      List<String> artists,
      double tempo,
      Duration? duration});
}

/// @nodoc
class __$$_SongCopyWithImpl<$Res> extends _$SongCopyWithImpl<$Res>
    implements _$$_SongCopyWith<$Res> {
  __$$_SongCopyWithImpl(_$_Song _value, $Res Function(_$_Song) _then)
      : super(_value, (v) => _then(v as _$_Song));

  @override
  _$_Song get _value => super._value as _$_Song;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? artists = freezed,
    Object? tempo = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$_Song(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      artists: artists == freezed
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tempo: tempo == freezed
          ? _value.tempo
          : tempo // ignore: cast_nullable_to_non_nullable
              as double,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Song implements _Song {
  _$_Song(
      {required this.id,
      required this.title,
      required final List<String> artists,
      required this.tempo,
      this.duration})
      : _artists = artists;

  factory _$_Song.fromJson(Map<String, dynamic> json) => _$$_SongFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _artists;
  @override
  List<String> get artists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  final double tempo;
  @override
  final Duration? duration;

  @override
  String toString() {
    return 'Song(id: $id, title: $title, artists: $artists, tempo: $tempo, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Song &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other._artists, _artists) &&
            const DeepCollectionEquality().equals(other.tempo, tempo) &&
            const DeepCollectionEquality().equals(other.duration, duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(_artists),
      const DeepCollectionEquality().hash(tempo),
      const DeepCollectionEquality().hash(duration));

  @JsonKey(ignore: true)
  @override
  _$$_SongCopyWith<_$_Song> get copyWith =>
      __$$_SongCopyWithImpl<_$_Song>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SongToJson(this);
  }
}

abstract class _Song implements Song {
  factory _Song(
      {required final String id,
      required final String title,
      required final List<String> artists,
      required final double tempo,
      final Duration? duration}) = _$_Song;

  factory _Song.fromJson(Map<String, dynamic> json) = _$_Song.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  List<String> get artists => throw _privateConstructorUsedError;
  @override
  double get tempo => throw _privateConstructorUsedError;
  @override
  Duration? get duration => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SongCopyWith<_$_Song> get copyWith => throw _privateConstructorUsedError;
}
