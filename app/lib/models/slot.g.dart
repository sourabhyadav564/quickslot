// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Slot _$SlotFromJson(Map<String, dynamic> json) => _Slot(
  id: json['id'] as String,
  venueId: json['venue_id'] as String,
  date: json['date'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  status: json['status'] as String,
  bookedBy: json['booked_by'] as String?,
);

Map<String, dynamic> _$SlotToJson(_Slot instance) => <String, dynamic>{
  'id': instance.id,
  'venue_id': instance.venueId,
  'date': instance.date,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'status': instance.status,
  'booked_by': instance.bookedBy,
};
