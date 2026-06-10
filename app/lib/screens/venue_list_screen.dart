import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../core/constants.dart';
import '../providers/venues_provider.dart';
import '../providers/auth_provider.dart';
import '../models/venue.dart';
import '../widgets/app_loading_widget.dart';
import '../widgets/app_error_widget.dart';

class VenueListScreen extends ConsumerWidget {
  const VenueListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final venuesAsync = ref.watch(venuesProvider);
    final userId = ref.watch(authProvider) ?? 'user_1';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.onBackground,
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton.icon(
              onPressed: () => context.go('/bookings'),
              icon: const Icon(Icons.bookmark_outlined, color: AppColors.primary, size: 18),
              label: const Text(
                'My Bookings',
                style: TextStyle(color: AppColors.primary, fontSize: 13),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: AppColors.primary.withOpacity(0.15),
              radius: 18,
              child: Text(
                userId.split('_').last.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: venuesAsync.when(
        loading: () => const AppLoadingWidget(message: 'Fetching venues...'),
        error: (e, _) => AppErrorWidget(
          message: 'Could not load venues.\n${e.toString()}',
          onRetry: () => ref.invalidate(venuesProvider),
        ),
        data: (venues) {
          if (venues.isEmpty) {
            return const Center(
              child: Text('No venues found.', style: TextStyle(color: AppColors.onSurfaceVariant)),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: venues.length,
            itemBuilder: (context, i) => _VenueCard(venue: venues[i]),
          );
        },
      ),
    );
  }
}

class _VenueCard extends StatelessWidget {
  final Venue venue;
  const _VenueCard({required this.venue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/venues/${venue.id}?name=${Uri.encodeComponent(venue.name)}'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: AppColors.cardShadow, blurRadius: 12, offset: Offset(0, 6)),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              if (venue.imageUrl != null)
                CachedNetworkImage(
                  imageUrl: venue.imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(color: AppColors.surfaceVariant),
                  errorWidget: (_, __, ___) => Container(
                    color: AppColors.surfaceVariant,
                    child: const Icon(Icons.sports, color: AppColors.onSurfaceVariant, size: 48),
                  ),
                )
              else
                Container(color: AppColors.surfaceVariant),

              // Gradient overlay
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xDD000000)],
                  ),
                ),
              ),

              // Content
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        venue.sport.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      venue.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: AppColors.onSurfaceVariant, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          venue.location,
                          style: const TextStyle(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Arrow
              const Positioned(
                top: 16,
                right: 16,
                child: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
