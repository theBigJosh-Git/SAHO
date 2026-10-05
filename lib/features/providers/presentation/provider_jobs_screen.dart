import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../bookings/data/booking_store.dart';
import '../../bookings/domain/booking_item.dart';

class ProviderJobsScreen extends StatelessWidget {
  final String providerName;

  const ProviderJobsScreen({super.key, required this.providerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Jobs')),
      body: SafeArea(
        child: ValueListenableBuilder<List<BookingItem>>(
          valueListenable: BookingStore.bookings,
          builder: (context, bookings, child) {
            final activeJobs = bookings.where((booking) {
              final belongsToProvider = booking.provider.name == providerName;

              final isActive =
                  booking.status == BookingStatus.confirmed ||
                  booking.status == BookingStatus.providerEnRoute ||
                  booking.status == BookingStatus.inProgress;

              return belongsToProvider && isActive;
            }).toList();

            if (activeJobs.isEmpty) {
              return const _EmptyJobsState();
            }

            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
              children: [
                const Text(
                  'Active jobs',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Manage services you have accepted from customers.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                ...activeJobs.map(
                  (booking) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: _ProviderJobCard(booking: booking),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ProviderJobCard extends StatelessWidget {
  final BookingItem booking;

  const _ProviderJobCard({required this.booking});

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _statusLabel(BookingStatus status) {
    switch (status) {
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.providerEnRoute:
        return 'En Route';
      case BookingStatus.inProgress:
        return 'In Progress';
      default:
        return '';
    }
  }

  Future<void> _confirmStatusChange(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    required BookingStatus newStatus,
    required IconData icon,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(icon, color: AppColors.success, size: 30),
                ),

                const SizedBox(height: 20),

                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 26),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop(false);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.textPrimary,
                          side: const BorderSide(color: AppColors.border),
                          minimumSize: const Size(0, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(dialogContext).pop(true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.success,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(0, 50),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        icon: Icon(icon, size: 19),
                        label: Text(
                          confirmLabel,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (confirmed == true) {
      BookingStore.updateStatus(booking.id, newStatus);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  booking.service.icon,
                  color: AppColors.success,
                  size: 26,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.service.name,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      booking.id,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _statusLabel(booking.status),
                  style: const TextStyle(
                    color: AppColors.success,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 16),

          _JobDetail(
            icon: Icons.calendar_month_outlined,
            text:
                '${_formatDate(booking.scheduledDate)} • ${booking.scheduledTime}',
          ),

          const SizedBox(height: 11),

          _JobDetail(icon: Icons.location_on_outlined, text: booking.address),

          if (booking.notes != null && booking.notes!.trim().isNotEmpty) ...[
            const SizedBox(height: 11),
            _JobDetail(icon: Icons.notes_outlined, text: booking.notes!),
          ],

          const SizedBox(height: 16),

          Row(
            children: [
              const Text(
                'Starting price',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
              const Spacer(),
              Text(
                'AED ${booking.startingPrice.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: AppColors.success,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          if (booking.status == BookingStatus.confirmed) ...[
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  _confirmStatusChange(
                    context,
                    title: 'Start journey?',
                    message:
                        'Confirm that you are ready to begin travelling to the customer location.',
                    confirmLabel: 'Start Journey',
                    newStatus: BookingStatus.providerEnRoute,
                    icon: Icons.directions_car_outlined,
                  );
                },
                icon: const Icon(Icons.directions_car_outlined),
                label: const Text('Start Journey'),
              ),
            ),
          ],

          if (booking.status == BookingStatus.providerEnRoute) ...[
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  _confirmStatusChange(
                    context,
                    title: 'Start service?',
                    message:
                        'Confirm that you have arrived and are ready to begin the service for this customer.',
                    confirmLabel: 'Start Service',
                    newStatus: BookingStatus.inProgress,
                    icon: Icons.play_arrow_rounded,
                  );
                },
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Start Service'),
              ),
            ),
          ],
          if (booking.status == BookingStatus.inProgress) ...[
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  _confirmStatusChange(
                    context,
                    title: 'Complete service?',
                    message:
                        'Confirm that the service has been fully completed for this customer. This will mark the booking as completed.',
                    confirmLabel: 'Complete Service',
                    newStatus: BookingStatus.completed,
                    icon: Icons.check_circle_outline,
                  );
                },
                icon: const Icon(Icons.check_circle_outline_rounded),
                label: const Text('Complete Service'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _JobDetail extends StatelessWidget {
  final IconData icon;
  final String text;

  const _JobDetail({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 19),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _EmptyJobsState extends StatelessWidget {
  const _EmptyJobsState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.work_outline,
                color: AppColors.success,
                size: 38,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'No active jobs',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'Accepted customer bookings will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
