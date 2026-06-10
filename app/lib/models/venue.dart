import 'package:freezed_annotation/freezed_annotation.dart';

part 'venue.freezed.dart';
part 'venue.g.dart';

@freezed
abstract class Venue with _$Venue {
  const factory Venue({
    required String id,
    required String name,
    required String sport,
    required String location,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _Venue;

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}
