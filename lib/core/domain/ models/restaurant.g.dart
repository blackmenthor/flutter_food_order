// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RestaurantCWProxy {
  Restaurant category(List<dynamic>? category);

  Restaurant image(String? image);

  Restaurant isFreeDelivery(bool isFreeDelivery);

  Restaurant name(String? name);

  Restaurant rating(double? rating);

  Restaurant ratingCount(int? ratingCount);

  Restaurant timeEstimation(String? timeEstimation);

  Restaurant uid(String uid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Restaurant(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Restaurant(...).copyWith(id: 12, name: "My name")
  /// ````
  Restaurant call({
    List<String>? category,
    String? image,
    bool? isFreeDelivery,
    String? name,
    double? rating,
    int? ratingCount,
    String? timeEstimation,
    String? uid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRestaurant.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRestaurant.copyWith.fieldName(...)`
class _$RestaurantCWProxyImpl implements _$RestaurantCWProxy {
  final Restaurant _value;

  const _$RestaurantCWProxyImpl(this._value);

  @override
  Restaurant category(List<dynamic>? category) => this(category: category);

  @override
  Restaurant image(String? image) => this(image: image);

  @override
  Restaurant isFreeDelivery(bool isFreeDelivery) =>
      this(isFreeDelivery: isFreeDelivery);

  @override
  Restaurant name(String? name) => this(name: name);

  @override
  Restaurant rating(double? rating) => this(rating: rating);

  @override
  Restaurant ratingCount(int? ratingCount) => this(ratingCount: ratingCount);

  @override
  Restaurant timeEstimation(String? timeEstimation) =>
      this(timeEstimation: timeEstimation);

  @override
  Restaurant uid(String uid) => this(uid: uid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Restaurant(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Restaurant(...).copyWith(id: 12, name: "My name")
  /// ````
  Restaurant call({
    Object? category = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
    Object? isFreeDelivery = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? ratingCount = const $CopyWithPlaceholder(),
    Object? timeEstimation = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
  }) {
    return Restaurant(
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as List<String>?,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as String?,
      isFreeDelivery: isFreeDelivery == const $CopyWithPlaceholder() ||
              isFreeDelivery == null
          ? _value.isFreeDelivery
          // ignore: cast_nullable_to_non_nullable
          : isFreeDelivery as bool,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      rating: rating == const $CopyWithPlaceholder()
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as double?,
      ratingCount: ratingCount == const $CopyWithPlaceholder()
          ? _value.ratingCount
          // ignore: cast_nullable_to_non_nullable
          : ratingCount as double?,
      timeEstimation: timeEstimation == const $CopyWithPlaceholder()
          ? _value.timeEstimation
          // ignore: cast_nullable_to_non_nullable
          : timeEstimation as String?,
      uid: uid == const $CopyWithPlaceholder() || uid == null
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String,
    );
  }
}

extension $RestaurantCopyWith on Restaurant {
  /// Returns a callable class that can be used as follows: `instanceOfRestaurant.copyWith(...)` or like so:`instanceOfRestaurant.copyWith.fieldName(...)`.
  _$RestaurantCWProxy get copyWith => _$RestaurantCWProxyImpl(this);
}
