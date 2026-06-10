import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/slot.dart';
import 'auth_provider.dart';

// Parameter class for (venueId, date)
class SlotParams {
  final String venueId;
  final String date;
  const SlotParams(this.venueId, this.date);

  @override
  bool operator ==(Object other) =>
      other is SlotParams && other.venueId == venueId && other.date == date;

  @override
  int get hashCode => Object.hash(venueId, date);
}

// Polling provider: re-fetches every 5 seconds for live updates (bonus feature)
final slotsProvider =
    AsyncNotifierProviderFamily<SlotsNotifier, List<Slot>, SlotParams>(
  SlotsNotifier.new,
);

class SlotsNotifier extends FamilyAsyncNotifier<List<Slot>, SlotParams> {
  Timer? _timer;

  @override
  Future<List<Slot>> build(SlotParams arg) async {
    // Cancel any previous timer when rebuilt
    ref.onDispose(() => _timer?.cancel());

    // Start polling every 5 s
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => _poll());

    return _fetch();
  }

  Future<List<Slot>> _fetch() async {
    final client = ref.read(apiClientProvider);
    final raw = await client.getSlots(arg.venueId, arg.date);
    return raw.map((e) => Slot.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<void> _poll() async {
    try {
      final slots = await _fetch();
      state = AsyncData(slots);
    } catch (_) {
      // Silent on poll errors; keep last good state
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}
