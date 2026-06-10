import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import '../core/constants.dart';
import '../providers/slots_provider.dart';
import '../providers/auth_provider.dart';
import '../models/slot.dart';
import '../widgets/slot_grid.dart';
import '../widgets/app_loading_widget.dart';
import '../widgets/app_error_widget.dart';

class VenueDetailScreen extends ConsumerStatefulWidget {
  final String venueId;
  final String venueName;

  const VenueDetailScreen({
    super.key,
    required this.venueId,
    required this.venueName,
  });

  @override
  ConsumerState<VenueDetailScreen> createState() => _VenueDetailScreenState();
}

class _VenueDetailScreenState extends ConsumerState<VenueDetailScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  String get _formattedDate => DateFormat('yyyy-MM-dd').format(_selectedDate);
  String get _displayDate => DateFormat('EEE, MMM d').format(_selectedDate);

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 6)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: AppColors.surface,
              onSurface: AppColors.onBackground,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _confirmAndBook(Slot slot) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Confirm Booking', style: TextStyle(color: AppColors.onBackground)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.venueName,
                style: const TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: AppColors.onSurfaceVariant, size: 14),
                const SizedBox(width: 6),
                Text(_displayDate, style: const TextStyle(color: AppColors.onSurfaceVariant)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, color: AppColors.onSurfaceVariant, size: 14),
                const SizedBox(width: 6),
                Text('${slot.startTime} – ${slot.endTime}',
                    style: const TextStyle(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel', style: TextStyle(color: AppColors.onSurfaceVariant)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Book Now', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final client = ref.read(apiClientProvider);
    try {
      await client.bookSlot(slot.id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.bookingSuccess),
            backgroundColor: AppColors.available,
            behavior: SnackBarBehavior.floating,
          ),
        );
        // Refresh slots immediately
        ref
            .read(slotsProvider(SlotParams(widget.venueId, _formattedDate)).notifier)
            .refresh();
      }
    } on DioException catch (e) {
      final msg = e.response?.statusCode == 409
          ? AppStrings.slotAlreadyTaken
          : AppStrings.errorGeneric;
      if (mounted) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: AppColors.surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Slot Unavailable',
                style: TextStyle(color: AppColors.booked)),
            content: Text(msg, style: const TextStyle(color: AppColors.onSurfaceVariant)),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
        // Refresh grid so taken slot shows correctly
        ref
            .read(slotsProvider(SlotParams(widget.venueId, _formattedDate)).notifier)
            .refresh();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final slotParams = SlotParams(widget.venueId, _formattedDate);
    final slotsAsync = ref.watch(slotsProvider(slotParams));
    final userId = ref.watch(authProvider)?['id'];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.onBackground),
          onPressed: () => context.pop(),
        ),
        title: Text(
          widget.venueName,
          style: const TextStyle(
            color: AppColors.onBackground,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outlined, color: AppColors.primary),
            onPressed: () => context.push('/bookings'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date picker row
          Container(
            color: AppColors.surface,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: AppColors.primary, size: 18),
                const SizedBox(width: 10),
                Text(
                  _displayDate,
                  style: const TextStyle(
                    color: AppColors.onBackground,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _pickDate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Change Date',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Legend
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                _LegendDot(color: AppColors.available, label: 'Available'),
                const SizedBox(width: 16),
                _LegendDot(color: AppColors.primary, label: 'My Booking'),
                const SizedBox(width: 16),
                _LegendDot(color: AppColors.booked, label: 'Booked'),
                const Spacer(),
                // Polling indicator
                const Icon(Icons.wifi, color: AppColors.onSurfaceVariant, size: 14),
                const SizedBox(width: 4),
                const Text('Live', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 11)),
              ],
            ),
          ),

          // Slot grid
          Expanded(
            child: slotsAsync.when(
              loading: () => const AppLoadingWidget(message: 'Loading slots...'),
              error: (e, _) => AppErrorWidget(
                message: 'Could not load slots.\n${e.toString()}',
                onRetry: () => ref
                    .read(slotsProvider(slotParams).notifier)
                    .refresh(),
              ),
              data: (slots) => SingleChildScrollView(
                child: SlotGrid(
                  slots: slots,
                  currentUserId: userId,
                  onTap: _confirmAndBook,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 11)),
      ],
    );
  }
}
