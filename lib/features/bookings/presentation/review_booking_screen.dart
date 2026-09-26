import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../domain/booking_draft.dart';
import '../data/booking_store.dart';
import '../domain/booking_item.dart';
import 'booking_confirmation_screen.dart';

class ReviewBookingScreen extends StatelessWidget {
  final BookingDraft draft;

  const ReviewBookingScreen({super.key, required this.draft});

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

  @override
  Widget build(BuildContext context) {
    final service = draft.service;
    final provider = draft.provider;

    return Scaffold(
      appBar: AppBar(title: const Text('Review Booking')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            const Text(
              'Check your booking',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please review the details before confirming your request.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 26),

            _ReviewSection(
              title: 'Service',
              children: [
                _ReviewRow(
                  icon: service.icon,
                  label: 'Service',
                  value: service.name,
                ),
                _ReviewRow(
                  icon: Icons.person_outline_rounded,
                  label: 'Professional',
                  value: provider.name,
                ),
              ],
            ),

            const SizedBox(height: 18),

            _ReviewSection(
              title: 'Schedule',
              children: [
                _ReviewRow(
                  icon: Icons.calendar_month_outlined,
                  label: 'Date',
                  value: draft.selectedDate == null
                      ? 'Not selected'
                      : _formatDate(draft.selectedDate!),
                ),
                _ReviewRow(
                  icon: Icons.schedule_outlined,
                  label: 'Time',
                  value: draft.selectedTime ?? 'Not selected',
                ),
              ],
            ),

            const SizedBox(height: 18),

            _ReviewSection(
              title: 'Service location',
              children: [
                _ReviewRow(
                  icon: Icons.location_on_outlined,
                  label: 'Address',
                  value: draft.address ?? 'Not provided',
                ),
              ],
            ),

            if (draft.notes != null && draft.notes!.trim().isNotEmpty) ...[
              const SizedBox(height: 18),
              _ReviewSection(
                title: 'Additional notes',
                children: [
                  _ReviewRow(
                    icon: Icons.notes_rounded,
                    label: 'Notes',
                    value: draft.notes!,
                  ),
                ],
              ),
            ],

            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.payments_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Starting price',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'AED ${service.startingPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'The displayed amount is a starting price. The final price may depend on the service requirements.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  final selectedDate = draft.selectedDate;
                  final selectedTime = draft.selectedTime;
                  final address = draft.address;

                  if (selectedDate == null ||
                      selectedTime == null ||
                      address == null ||
                      address.trim().isEmpty) {
                    return;
                  }

                  final now = DateTime.now();

                  final bookingId =
                      'SAHO-'
                      '${now.year.toString().substring(2)}'
                      '${now.month.toString().padLeft(2, '0')}'
                      '${now.day.toString().padLeft(2, '0')}-'
                      '${now.microsecondsSinceEpoch.toString().substring(now.microsecondsSinceEpoch.toString().length - 4)}';

                  final booking = BookingItem(
                    id: bookingId,
                    service: draft.service,
                    provider: draft.provider,
                    scheduledDate: selectedDate,
                    scheduledTime: selectedTime,
                    address: address,
                    notes: draft.notes,
                    startingPrice: draft.service.startingPrice,
                    status: BookingStatus.pending,
                    createdAt: now,
                  );

                  BookingStore.addBooking(booking);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          BookingConfirmationScreen(booking: booking),
                    ),
                  );
                },
                child: const Text('Confirm Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ReviewSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ReviewRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
