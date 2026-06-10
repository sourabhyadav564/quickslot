import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/venue.dart';
import 'auth_provider.dart';

final venuesProvider = FutureProvider<List<Venue>>((ref) async {
  final client = ref.watch(apiClientProvider);
  final raw = await client.getVenues();
  return raw.map((e) => Venue.fromJson(e as Map<String, dynamic>)).toList();
});
