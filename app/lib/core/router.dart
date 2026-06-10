import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../screens/user_select_screen.dart';
import '../screens/venue_list_screen.dart';
import '../screens/venue_detail_screen.dart';
import '../screens/my_bookings_screen.dart';
import '../providers/auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final loggedIn = auth != null;
      final atLogin = state.matchedLocation == '/';
      if (!loggedIn && !atLogin) return '/';
      if (loggedIn && atLogin) return '/venues';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const UserSelectScreen(),
      ),
      GoRoute(
        path: '/venues',
        builder: (context, state) => const VenueListScreen(),
      ),
      GoRoute(
        path: '/venues/:id',
        builder: (context, state) {
          final venueId = state.pathParameters['id']!;
          final venueName =
              state.uri.queryParameters['name'] ?? 'Venue';
          return VenueDetailScreen(venueId: venueId, venueName: venueName);
        },
      ),
      GoRoute(
        path: '/bookings',
        builder: (context, state) => const MyBookingsScreen(),
      ),
    ],
  );
});
