// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Booking _$BookingFromJson(Map<String, dynamic> json) => _Booking(
  id: json['id'] as String,
  slotId: json['slot_id'] as String,
  userId: json['user_id'] as String,
  venueId: json['venue_id'] as String,
  date: json['date'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  venueName: json['venue_name'] as String,
  sport: json['sport'] as String,
  location: json['location'] as String,
  imageUrl: json['image_url'] as String?,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$BookingToJson(_Booking instance) => <String, dynamic>{
  'id': instance.id,
  'slot_id': instance.slotId,
  'user_id': instance.userId,
  'venue_id': instance.venueId,
  'date': instance.date,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'venue_name': instance.venueName,
  'sport': instance.sport,
  'location': instance.location,
  'image_url': instance.imageUrl,
  'status': instance.status,
  'created_at': instance.createdAt,
};
