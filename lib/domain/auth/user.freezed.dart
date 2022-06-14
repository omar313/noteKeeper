// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DomainUser {
  UniqueId get userID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DomainUserCopyWith<DomainUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainUserCopyWith<$Res> {
  factory $DomainUserCopyWith(
          DomainUser value, $Res Function(DomainUser) then) =
      _$DomainUserCopyWithImpl<$Res>;
  $Res call({UniqueId userID});
}

/// @nodoc
class _$DomainUserCopyWithImpl<$Res> implements $DomainUserCopyWith<$Res> {
  _$DomainUserCopyWithImpl(this._value, this._then);

  final DomainUser _value;
  // ignore: unused_field
  final $Res Function(DomainUser) _then;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc
abstract class _$$_DomainUserCopyWith<$Res>
    implements $DomainUserCopyWith<$Res> {
  factory _$$_DomainUserCopyWith(
          _$_DomainUser value, $Res Function(_$_DomainUser) then) =
      __$$_DomainUserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId userID});
}

/// @nodoc
class __$$_DomainUserCopyWithImpl<$Res> extends _$DomainUserCopyWithImpl<$Res>
    implements _$$_DomainUserCopyWith<$Res> {
  __$$_DomainUserCopyWithImpl(
      _$_DomainUser _value, $Res Function(_$_DomainUser) _then)
      : super(_value, (v) => _then(v as _$_DomainUser));

  @override
  _$_DomainUser get _value => super._value as _$_DomainUser;

  @override
  $Res call({
    Object? userID = freezed,
  }) {
    return _then(_$_DomainUser(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$_DomainUser implements _DomainUser {
  const _$_DomainUser({required this.userID});

  @override
  final UniqueId userID;

  @override
  String toString() {
    return 'DomainUser(userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DomainUser &&
            const DeepCollectionEquality().equals(other.userID, userID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userID));

  @JsonKey(ignore: true)
  @override
  _$$_DomainUserCopyWith<_$_DomainUser> get copyWith =>
      __$$_DomainUserCopyWithImpl<_$_DomainUser>(this, _$identity);
}

abstract class _DomainUser implements DomainUser {
  const factory _DomainUser({required final UniqueId userID}) = _$_DomainUser;

  @override
  UniqueId get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DomainUserCopyWith<_$_DomainUser> get copyWith =>
      throw _privateConstructorUsedError;
}
