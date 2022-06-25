// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MenuCWProxy {
  Menu description(String? description);

  Menu image(String? image);

  Menu name(String? name);

  Menu price(double? price);

  Menu rating(double? rating);

  Menu ratingCount(double? ratingCount);

  Menu restaurantId(String restaurantId);

  Menu uid(String uid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Menu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Menu(...).copyWith(id: 12, name: "My name")
  /// ````
  Menu call({
    String? description,
    String? image,
    String? name,
    double? price,
    double? rating,
    double? ratingCount,
    String? restaurantId,
    String? uid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMenu.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMenu.copyWith.fieldName(...)`
class _$MenuCWProxyImpl implements _$MenuCWProxy {
  final Menu _value;

  const _$MenuCWProxyImpl(this._value);

  @override
  Menu description(String? description) => this(description: description);

  @override
  Menu image(String? image) => this(image: image);

  @override
  Menu name(String? name) => this(name: name);

  @override
  Menu price(double? price) => this(price: price);

  @override
  Menu rating(double? rating) => this(rating: rating);

  @override
  Menu ratingCount(double? ratingCount) => this(ratingCount: ratingCount);

  @override
  Menu restaurantId(String restaurantId) => this(restaurantId: restaurantId);

  @override
  Menu uid(String uid) => this(uid: uid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Menu(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Menu(...).copyWith(id: 12, name: "My name")
  /// ````
  Menu call({
    Object? description = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? ratingCount = const $CopyWithPlaceholder(),
    Object? restaurantId = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
  }) {
    return Menu(
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      price: price == const $CopyWithPlaceholder()
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double?,
      rating: rating == const $CopyWithPlaceholder()
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as double?,
      ratingCount: ratingCount == const $CopyWithPlaceholder()
          ? _value.ratingCount
          // ignore: cast_nullable_to_non_nullable
          : ratingCount as double?,
      restaurantId:
          restaurantId == const $CopyWithPlaceholder() || restaurantId == null
              ? _value.restaurantId
              // ignore: cast_nullable_to_non_nullable
              : restaurantId as String,
      uid: uid == const $CopyWithPlaceholder() || uid == null
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String,
    );
  }
}

extension $MenuCopyWith on Menu {
  /// Returns a callable class that can be used as follows: `instanceOfMenu.copyWith(...)` or like so:`instanceOfMenu.copyWith.fieldName(...)`.
  _$MenuCWProxy get copyWith => _$MenuCWProxyImpl(this);
}
