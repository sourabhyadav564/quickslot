// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Booking {

 String get id;@JsonKey(name: 'slot_id') String get slotId;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'venue_id') String get venueId; String get date;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'venue_name') String get venueName; String get sport; String get location;@JsonKey(name: 'image_url') String? get imageUrl; String get status;// 'active' | 'cancelled'
@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCopyWith<Booking> get copyWith => _$BookingCopyWithImpl<Booking>(this as Booking, _$identity);

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Booking&&(identical(other.id, id) || other.id == id)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.venueName, venueName) || other.venueName == venueName)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slotId,userId,venueId,date,startTime,endTime,venueName,sport,location,imageUrl,status,createdAt);

@override
String toString() {
  return 'Booking(id: $id, slotId: $slotId, userId: $userId, venueId: $venueId, date: $date, startTime: $startTime, endTime: $endTime, venueName: $venueName, sport: $sport, location: $location, imageUrl: $imageUrl, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookingCopyWith<$Res>  {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) _then) = _$BookingCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'slot_id') String slotId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'venue_id') String venueId, String date,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'venue_name') String venueName, String sport, String location,@JsonKey(name: 'image_url') String? imageUrl, String status,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$BookingCopyWithImpl<$Res>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._self, this._then);

  final Booking _self;
  final $Res Function(Booking) _then;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slotId = null,Object? userId = null,Object? venueId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? venueName = null,Object? sport = null,Object? location = null,Object? imageUrl = freezed,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,venueName: null == venueName ? _self.venueName : venueName // ignore: cast_nullable_to_non_nullable
as String,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Booking].
extension BookingPatterns on Booking {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Booking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Booking value)  $default,){
final _that = this;
switch (_that) {
case _Booking():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Booking value)?  $default,){
final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'slot_id')  String slotId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'venue_id')  String venueId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'venue_name')  String venueName,  String sport,  String location, @JsonKey(name: 'image_url')  String? imageUrl,  String status, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that.id,_that.slotId,_that.userId,_that.venueId,_that.date,_that.startTime,_that.endTime,_that.venueName,_that.sport,_that.location,_that.imageUrl,_that.status,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'slot_id')  String slotId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'venue_id')  String venueId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'venue_name')  String venueName,  String sport,  String location, @JsonKey(name: 'image_url')  String? imageUrl,  String status, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Booking():
return $default(_that.id,_that.slotId,_that.userId,_that.venueId,_that.date,_that.startTime,_that.endTime,_that.venueName,_that.sport,_that.location,_that.imageUrl,_that.status,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'slot_id')  String slotId, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'venue_id')  String venueId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'venue_name')  String venueName,  String sport,  String location, @JsonKey(name: 'image_url')  String? imageUrl,  String status, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that.id,_that.slotId,_that.userId,_that.venueId,_that.date,_that.startTime,_that.endTime,_that.venueName,_that.sport,_that.location,_that.imageUrl,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Booking implements Booking {
  const _Booking({required this.id, @JsonKey(name: 'slot_id') required this.slotId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'venue_id') required this.venueId, required this.date, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'venue_name') required this.venueName, required this.sport, required this.location, @JsonKey(name: 'image_url') this.imageUrl, required this.status, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);

@override final  String id;
@override@JsonKey(name: 'slot_id') final  String slotId;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'venue_id') final  String venueId;
@override final  String date;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'venue_name') final  String venueName;
@override final  String sport;
@override final  String location;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  String status;
// 'active' | 'cancelled'
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCopyWith<_Booking> get copyWith => __$BookingCopyWithImpl<_Booking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Booking&&(identical(other.id, id) || other.id == id)&&(identical(other.slotId, slotId) || other.slotId == slotId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.venueName, venueName) || other.venueName == venueName)&&(identical(other.sport, sport) || other.sport == sport)&&(identical(other.location, location) || other.location == location)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slotId,userId,venueId,date,startTime,endTime,venueName,sport,location,imageUrl,status,createdAt);

@override
String toString() {
  return 'Booking(id: $id, slotId: $slotId, userId: $userId, venueId: $venueId, date: $date, startTime: $startTime, endTime: $endTime, venueName: $venueName, sport: $sport, location: $location, imageUrl: $imageUrl, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) _then) = __$BookingCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'slot_id') String slotId,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'venue_id') String venueId, String date,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'venue_name') String venueName, String sport, String location,@JsonKey(name: 'image_url') String? imageUrl, String status,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$BookingCopyWithImpl<$Res>
    implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(this._self, this._then);

  final _Booking _self;
  final $Res Function(_Booking) _then;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slotId = null,Object? userId = null,Object? venueId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? venueName = null,Object? sport = null,Object? location = null,Object? imageUrl = freezed,Object? status = null,Object? createdAt = null,}) {
  return _then(_Booking(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slotId: null == slotId ? _self.slotId : slotId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,venueName: null == venueName ? _self.venueName : venueName // ignore: cast_nullable_to_non_nullable
as String,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
