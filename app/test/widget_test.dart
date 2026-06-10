import 'package:flutter_test/flutter_test.dart';
import 'package:quickslot/models/venue.dart';
import 'package:quickslot/models/slot.dart';
import 'package:quickslot/models/booking.dart';

void main() {
  group('QuickSlot Models JSON Serialization Tests', () {
    test('Venue fromJson and toJson matches', () {
      final json = {
        'id': 'venue_1',
        'name': 'Smash Arena',
        'sport': 'Badminton',
        'location': 'Koramangala',
        'image_url': 'https://example.com/image.jpg',
      };

      final venue = Venue.fromJson(json);
      expect(venue.id, 'venue_1');
      expect(venue.name, 'Smash Arena');
      expect(venue.imageUrl, 'https://example.com/image.jpg');

      final serialized = venue.toJson();
      expect(serialized['image_url'], 'https://example.com/image.jpg');
    });

    test('Slot fromJson and toJson matches', () {
      final json = {
        'id': 'slot_1',
        'venue_id': 'venue_1',
        'date': '2026-06-10',
        'start_time': '09:00',
        'end_time': '10:00',
        'status': 'available',
        'booked_by': null,
      };

      final slot = Slot.fromJson(json);
      expect(slot.id, 'slot_1');
      expect(slot.startTime, '09:00');
      expect(slot.status, 'available');

      final serialized = slot.toJson();
      expect(serialized['venue_id'], 'venue_1');
    });

    test('Booking fromJson and toJson matches', () {
      final json = {
        'id': 'booking_1',
        'slot_id': 'slot_1',
        'user_id': 'user_1',
        'venue_id': 'venue_1',
        'date': '2026-06-10',
        'start_time': '09:00',
        'end_time': '10:00',
        'venue_name': 'Smash Arena',
        'sport': 'Badminton',
        'location': 'Koramangala',
        'image_url': 'https://example.com/image.jpg',
        'status': 'active',
        'created_at': '2026-06-10T15:00:00Z',
      };

      final booking = Booking.fromJson(json);
      expect(booking.id, 'booking_1');
      expect(booking.venueName, 'Smash Arena');
      expect(booking.status, 'active');

      final serialized = booking.toJson();
      expect(serialized['created_at'], '2026-06-10T15:00:00Z');
    });
  });
}
