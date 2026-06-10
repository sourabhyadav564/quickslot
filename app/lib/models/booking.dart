import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
abstract class Booking with _$Booking {
  const factory Booking({
    required String id,
    @JsonKey(name: 'slot_id') required String slotId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'venue_id') required String venueId,
    required String date,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'venue_name') required String venueName,
    required String sport,
    required String location,
    @JsonKey(name: 'image_url') String? imageUrl,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}
