// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AyoMaemUserCWProxy {
  AyoMaemUser email(String? email);

  AyoMaemUser name(String? name);

  AyoMaemUser uid(String uid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AyoMaemUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AyoMaemUser(...).copyWith(id: 12, name: "My name")
  /// ````
  AyoMaemUser call({
    String? email,
    String? name,
    String? uid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAyoMaemUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAyoMaemUser.copyWith.fieldName(...)`
class _$AyoMaemUserCWProxyImpl implements _$AyoMaemUserCWProxy {
  final AyoMaemUser _value;

  const _$AyoMaemUserCWProxyImpl(this._value);

  @override
  AyoMaemUser email(String? email) => this(email: email);

  @override
  AyoMaemUser name(String? name) => this(name: name);

  @override
  AyoMaemUser uid(String uid) => this(uid: uid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AyoMaemUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AyoMaemUser(...).copyWith(id: 12, name: "My name")
  /// ````
  AyoMaemUser call({
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
  }) {
    return AyoMaemUser(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      uid: uid == const $CopyWithPlaceholder() || uid == null
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String,
    );
  }
}

extension $AyoMaemUserCopyWith on AyoMaemUser {
  /// Returns a callable class that can be used as follows: `instanceOfAyoMaemUser.copyWith(...)` or like so:`instanceOfAyoMaemUser.copyWith.fieldName(...)`.
  _$AyoMaemUserCWProxy get copyWith => _$AyoMaemUserCWProxyImpl(this);
}
