import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/booking.dart';
import 'auth_provider.dart';

const _cacheKey = 'bookings_cache';

final bookingsProvider =
    AsyncNotifierProvider<BookingsNotifier, List<Booking>>(BookingsNotifier.new);

class BookingsNotifier extends AsyncNotifier<List<Booking>> {
  @override
  Future<List<Booking>> build() async {
    return _fetchWithCache();
  }

  Future<List<Booking>> _fetchWithCache() async {
    final userMap = ref.read(authProvider);
    if (userMap == null) return [];
    final userId = userMap['id']!;

    final client = ref.read(apiClientProvider);

    try {
      final raw = await client.getUserBookings(userId);
      final bookings =
          raw.map((e) => Booking.fromJson(e as Map<String, dynamic>)).toList();

      // Persist to offline cache
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        '${_cacheKey}_$userId',
        jsonEncode(bookings.map((b) => b.toJson()).toList()),
      );

      // Mark data as fresh
      ref.read(bookingsIsStaleProvider.notifier).state = false;
      return bookings;
    } on Exception catch (_) {
      // Only fall back to stale cache for network/IO errors, not parse errors
      final prefs = await SharedPreferences.getInstance();
      final cached = prefs.getString('${_cacheKey}_$userId');
      if (cached != null) {
        // Mark data as stale (coming from cache)
        ref.read(bookingsIsStaleProvider.notifier).state = true;
        final list = jsonDecode(cached) as List<dynamic>;
        return list
            .map((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetchWithCache);
  }

  Future<void> cancel(String bookingId) async {
    final client = ref.read(apiClientProvider);
    await client.cancelBooking(bookingId);
    await refresh();
  }
}

// Whether the current bookings data is from cache (for stale banner)
final bookingsIsStaleProvider = StateProvider<bool>((ref) => false);
