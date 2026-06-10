import 'package:freezed_annotation/freezed_annotation.dart';

part 'slot.freezed.dart';
part 'slot.g.dart';

@freezed
abstract class Slot with _$Slot {
  const factory Slot({
    required String id,
    @JsonKey(name: 'venue_id') required String venueId,
    required String date,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    required String status,
    @JsonKey(name: 'booked_by') String? bookedBy,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
}
