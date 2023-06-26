// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Credit _$CreditFromJson(Map<String, dynamic> json) {
  return _Credit.fromJson(json);
}

/// @nodoc
mixin _$Credit {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profile_path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditCopyWith<Credit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCopyWith<$Res> {
  factory $CreditCopyWith(Credit value, $Res Function(Credit) then) =
      _$CreditCopyWithImpl<$Res, Credit>;
  @useResult
  $Res call({int id, String name, String? profile_path});
}

/// @nodoc
class _$CreditCopyWithImpl<$Res, $Val extends Credit>
    implements $CreditCopyWith<$Res> {
  _$CreditCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profile_path = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profile_path: freezed == profile_path
          ? _value.profile_path
          : profile_path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreditCopyWith<$Res> implements $CreditCopyWith<$Res> {
  factory _$$_CreditCopyWith(_$_Credit value, $Res Function(_$_Credit) then) =
      __$$_CreditCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? profile_path});
}

/// @nodoc
class __$$_CreditCopyWithImpl<$Res>
    extends _$CreditCopyWithImpl<$Res, _$_Credit>
    implements _$$_CreditCopyWith<$Res> {
  __$$_CreditCopyWithImpl(_$_Credit _value, $Res Function(_$_Credit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profile_path = freezed,
  }) {
    return _then(_$_Credit(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profile_path: freezed == profile_path
          ? _value.profile_path
          : profile_path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Credit implements _Credit {
  const _$_Credit(
      {required this.id, required this.name, required this.profile_path});

  factory _$_Credit.fromJson(Map<String, dynamic> json) =>
      _$$_CreditFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? profile_path;

  @override
  String toString() {
    return 'Credit(id: $id, name: $name, profile_path: $profile_path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Credit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profile_path, profile_path) ||
                other.profile_path == profile_path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, profile_path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreditCopyWith<_$_Credit> get copyWith =>
      __$$_CreditCopyWithImpl<_$_Credit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreditToJson(
      this,
    );
  }
}

abstract class _Credit implements Credit {
  const factory _Credit(
      {required final int id,
      required final String name,
      required final String? profile_path}) = _$_Credit;

  factory _Credit.fromJson(Map<String, dynamic> json) = _$_Credit.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get profile_path;
  @override
  @JsonKey(ignore: true)
  _$$_CreditCopyWith<_$_Credit> get copyWith =>
      throw _privateConstructorUsedError;
}
