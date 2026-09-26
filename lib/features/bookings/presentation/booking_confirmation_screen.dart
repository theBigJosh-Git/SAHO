import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../domain/booking_item.dart';
import '../../../app/customer_shell.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final BookingItem booking;

  const BookingConfirmationScreen({super.key, required this.booking});

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
          child: Column(
            children: [
              const Spacer(),

              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Color(0xFF047857),
                  size: 52,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Booking request sent!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Your request has been sent to ${booking.provider.name}.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    _ConfirmationRow(label: 'Booking ID', value: booking.id),
                    const SizedBox(height: 14),
                    _ConfirmationRow(
                      label: 'Service',
                      value: booking.service.name,
                    ),
                    const SizedBox(height: 14),
                    _ConfirmationRow(
                      label: 'Professional',
                      value: booking.provider.name,
                    ),
                    const SizedBox(height: 14),
                    _ConfirmationRow(
                      label: 'Date',
                      value: _formatDate(booking.scheduledDate),
                    ),
                    const SizedBox(height: 14),
                    _ConfirmationRow(
                      label: 'Time',
                      value: booking.scheduledTime,
                    ),
                    const SizedBox(height: 14),
                    const _ConfirmationRow(label: 'Status', value: 'Pending'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'The professional will need to accept your request before the booking is confirmed.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            const CustomerShell(initialIndex: 1),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text('View Bookings'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConfirmationRow extends StatelessWidget {
  final String label;
  final String value;

  const _ConfirmationRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
