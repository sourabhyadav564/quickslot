// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Slot {

 String get id;@JsonKey(name: 'venue_id') String get venueId; String get date;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime; String get status;// 'available' | 'booked'
@JsonKey(name: 'booked_by') String? get bookedBy;
/// Create a copy of Slot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SlotCopyWith<Slot> get copyWith => _$SlotCopyWithImpl<Slot>(this as Slot, _$identity);

  /// Serializes this Slot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Slot&&(identical(other.id, id) || other.id == id)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.bookedBy, bookedBy) || other.bookedBy == bookedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,venueId,date,startTime,endTime,status,bookedBy);

@override
String toString() {
  return 'Slot(id: $id, venueId: $venueId, date: $date, startTime: $startTime, endTime: $endTime, status: $status, bookedBy: $bookedBy)';
}


}

/// @nodoc
abstract mixin class $SlotCopyWith<$Res>  {
  factory $SlotCopyWith(Slot value, $Res Function(Slot) _then) = _$SlotCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'venue_id') String venueId, String date,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime, String status,@JsonKey(name: 'booked_by') String? bookedBy
});




}
/// @nodoc
class _$SlotCopyWithImpl<$Res>
    implements $SlotCopyWith<$Res> {
  _$SlotCopyWithImpl(this._self, this._then);

  final Slot _self;
  final $Res Function(Slot) _then;

/// Create a copy of Slot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? venueId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? status = null,Object? bookedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,bookedBy: freezed == bookedBy ? _self.bookedBy : bookedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Slot].
extension SlotPatterns on Slot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Slot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Slot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Slot value)  $default,){
final _that = this;
switch (_that) {
case _Slot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Slot value)?  $default,){
final _that = this;
switch (_that) {
case _Slot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'venue_id')  String venueId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  String status, @JsonKey(name: 'booked_by')  String? bookedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Slot() when $default != null:
return $default(_that.id,_that.venueId,_that.date,_that.startTime,_that.endTime,_that.status,_that.bookedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'venue_id')  String venueId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  String status, @JsonKey(name: 'booked_by')  String? bookedBy)  $default,) {final _that = this;
switch (_that) {
case _Slot():
return $default(_that.id,_that.venueId,_that.date,_that.startTime,_that.endTime,_that.status,_that.bookedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'venue_id')  String venueId,  String date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime,  String status, @JsonKey(name: 'booked_by')  String? bookedBy)?  $default,) {final _that = this;
switch (_that) {
case _Slot() when $default != null:
return $default(_that.id,_that.venueId,_that.date,_that.startTime,_that.endTime,_that.status,_that.bookedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Slot implements Slot {
  const _Slot({required this.id, @JsonKey(name: 'venue_id') required this.venueId, required this.date, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, required this.status, @JsonKey(name: 'booked_by') this.bookedBy});
  factory _Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);

@override final  String id;
@override@JsonKey(name: 'venue_id') final  String venueId;
@override final  String date;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override final  String status;
// 'available' | 'booked'
@override@JsonKey(name: 'booked_by') final  String? bookedBy;

/// Create a copy of Slot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SlotCopyWith<_Slot> get copyWith => __$SlotCopyWithImpl<_Slot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Slot&&(identical(other.id, id) || other.id == id)&&(identical(other.venueId, venueId) || other.venueId == venueId)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.bookedBy, bookedBy) || other.bookedBy == bookedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,venueId,date,startTime,endTime,status,bookedBy);

@override
String toString() {
  return 'Slot(id: $id, venueId: $venueId, date: $date, startTime: $startTime, endTime: $endTime, status: $status, bookedBy: $bookedBy)';
}


}

/// @nodoc
abstract mixin class _$SlotCopyWith<$Res> implements $SlotCopyWith<$Res> {
  factory _$SlotCopyWith(_Slot value, $Res Function(_Slot) _then) = __$SlotCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'venue_id') String venueId, String date,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime, String status,@JsonKey(name: 'booked_by') String? bookedBy
});




}
/// @nodoc
class __$SlotCopyWithImpl<$Res>
    implements _$SlotCopyWith<$Res> {
  __$SlotCopyWithImpl(this._self, this._then);

  final _Slot _self;
  final $Res Function(_Slot) _then;

/// Create a copy of Slot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? venueId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? status = null,Object? bookedBy = freezed,}) {
  return _then(_Slot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,bookedBy: freezed == bookedBy ? _self.bookedBy : bookedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
