import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../models/slot.dart';

class SlotGrid extends StatelessWidget {
  final List<Slot> slots;
  final void Function(Slot slot) onTap;
  final String? currentUserId;

  const SlotGrid({
    super.key,
    required this.slots,
    required this.onTap,
    this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    if (slots.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            AppStrings.noSlots,
            style: TextStyle(color: AppColors.onSurfaceVariant),
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.8,
      ),
      itemCount: slots.length,
      itemBuilder: (context, index) => _SlotTile(
        slot: slots[index],
        onTap: onTap,
        currentUserId: currentUserId,
      ),
    );
  }
}

class _SlotTile extends StatelessWidget {
  final Slot slot;
  final void Function(Slot) onTap;
  final String? currentUserId;

  const _SlotTile({
    required this.slot,
    required this.onTap,
    this.currentUserId,
  });

  bool get _isAvailable => slot.status == 'available';
  bool get _isMyBooking => slot.bookedBy == currentUserId;

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    if (_isAvailable) {
      bgColor = AppColors.available.withOpacity(0.15);
      textColor = AppColors.available;
    } else if (_isMyBooking) {
      bgColor = AppColors.primary.withOpacity(0.2);
      textColor = AppColors.primary;
    } else {
      bgColor = AppColors.booked.withOpacity(0.12);
      textColor = AppColors.booked;
    }

    return GestureDetector(
      onTap: _isAvailable ? () => onTap(slot) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: textColor.withOpacity(0.4),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              slot.startTime,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            if (!_isAvailable)
              Icon(
                _isMyBooking ? Icons.check_circle : Icons.lock,
                color: textColor,
                size: 12,
              ),
          ],
        ),
      ),
    );
  }
}
