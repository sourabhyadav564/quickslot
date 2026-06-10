import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../models/booking.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;
  final VoidCallback? onCancel;

  const BookingCard({super.key, required this.booking, this.onCancel});

  @override
  Widget build(BuildContext context) {
    final isActive = booking.status == 'active';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive
              ? AppColors.primary.withOpacity(0.3)
              : AppColors.onSurfaceVariant.withOpacity(0.2),
        ),
        boxShadow: const [
          BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          // Sport color stripe
          Container(
            width: 6,
            height: 90,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.onSurfaceVariant,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          booking.venueName,
                          style: const TextStyle(
                            color: AppColors.onBackground,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.available.withOpacity(0.15)
                              : AppColors.onSurfaceVariant.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isActive ? 'Active' : 'Cancelled',
                          style: TextStyle(
                            color: isActive ? AppColors.available : AppColors.onSurfaceVariant,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${booking.sport} · ${booking.location}',
                    style: const TextStyle(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 13, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text(
                        booking.date,
                        style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.access_time, size: 13, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text(
                        '${booking.startTime}–${booking.endTime}',
                        style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isActive && onCancel != null)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: TextButton(
                onPressed: onCancel,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.booked,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                child: const Text('Cancel', style: TextStyle(fontSize: 13)),
              ),
            ),
        ],
      ),
    );
  }
}
