import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/constants.dart';
import '../providers/bookings_provider.dart';
import '../widgets/booking_card.dart';
import '../widgets/app_loading_widget.dart';
import '../widgets/app_error_widget.dart';

class MyBookingsScreen extends ConsumerWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingsAsync = ref.watch(bookingsProvider);
    final isStale = ref.watch(bookingsIsStaleProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.onBackground),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          AppStrings.myBookings,
          style: TextStyle(
            color: AppColors.onBackground,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: AppColors.primary),
            onPressed: () => ref.read(bookingsProvider.notifier).refresh(),
          ),
        ],
      ),
      body: Column(
        children: [
          // Stale cache banner — shown when offline data is displayed
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isStale
                ? Container(
                    key: const ValueKey('stale_banner'),
                    width: double.infinity,
                    color: const Color(0xFFF59E0B).withOpacity(0.12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.wifi_off_rounded,
                            color: Color(0xFFF59E0B), size: 16),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            'Offline — showing cached bookings',
                            style: TextStyle(
                              color: Color(0xFFF59E0B),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              ref.read(bookingsProvider.notifier).refresh(),
                          child: const Text(
                            'Retry',
                            style: TextStyle(
                              color: Color(0xFFF59E0B),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFF59E0B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(key: ValueKey('no_banner')),
          ),
          Expanded(
            child: bookingsAsync.when(
        loading: () => const AppLoadingWidget(message: 'Loading bookings...'),
        error: (e, _) => AppErrorWidget(
          message: 'Could not load bookings.\nShowing cached data if available.\n${e.toString()}',
          onRetry: () => ref.read(bookingsProvider.notifier).refresh(),
        ),
        data: (bookings) {
          if (bookings.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_today_outlined,
                      color: AppColors.onSurfaceVariant, size: 64),
                  SizedBox(height: 16),
                  Text(
                    AppStrings.noBookings,
                    style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Browse venues and book a slot!',
                    style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            color: AppColors.primary,
            backgroundColor: AppColors.surface,
            onRefresh: () => ref.read(bookingsProvider.notifier).refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: bookings.length,
              itemBuilder: (context, i) {
                final booking = bookings[i];
                return BookingCard(
                  booking: booking,
                  onCancel: booking.status == 'active'
                      ? () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              backgroundColor: AppColors.surface,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              title: const Text('Cancel Booking?',
                                  style: TextStyle(color: AppColors.onBackground)),
                              content: const Text(
                                'This will release the slot and it will be available to others.',
                                style: TextStyle(color: AppColors.onSurfaceVariant),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx, false),
                                  child: const Text('Keep It',
                                      style: TextStyle(color: AppColors.onSurfaceVariant)),
                                ),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(ctx, true),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.booked),
                                  child: const Text('Cancel Slot',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          );
                          if (confirmed == true && context.mounted) {
                            try {
                              await ref
                                  .read(bookingsProvider.notifier)
                                  .cancel(booking.id);
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(AppStrings.bookingCancelled),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: AppColors.available,
                                  ),
                                );
                              }
                            } catch (_) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(AppStrings.errorGeneric),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: AppColors.booked,
                                  ),
                                );
                              }
                            }
                          }
                        }
                      : null,
                );
              },
            ),
          );
        },
          ),
          ),
        ],
      ),
    );
  }
}
