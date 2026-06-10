// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Venue _$VenueFromJson(Map<String, dynamic> json) => _Venue(
  id: json['id'] as String,
  name: json['name'] as String,
  sport: json['sport'] as String,
  location: json['location'] as String,
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$VenueToJson(_Venue instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sport': instance.sport,
  'location': instance.location,
  'image_url': instance.imageUrl,
};
