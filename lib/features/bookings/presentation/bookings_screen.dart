import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../data/booking_store.dart';
import '../domain/booking_item.dart';
import '../../reviews/data/review_store.dart';
import '../../reviews/presentation/leave_review_screen.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder<List<BookingItem>>(
        valueListenable: BookingStore.bookings,
        builder: (context, bookings, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 24, 20, 6),
                child: Text(
                  'Bookings',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'View and manage your service requests.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Expanded(
                child: bookings.isEmpty
                    ? const _EmptyBookingsState()
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                        itemCount: bookings.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 14),
                        itemBuilder: (context, index) {
                          return _BookingCard(booking: bookings[index]);
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyBookingsState extends StatelessWidget {
  const _EmptyBookingsState();

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
                color: const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.calendar_month_outlined,
                color: AppColors.primary,
                size: 38,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'No bookings yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'Your service requests will appear here after you make a booking.',
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

class _BookingCard extends StatelessWidget {
  final BookingItem booking;

  const _BookingCard({required this.booking});

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
      case BookingStatus.pending:
        return 'Pending';
      case BookingStatus.confirmed:
        return 'Confirmed';
      case BookingStatus.providerEnRoute:
        return 'Provider En Route';
      case BookingStatus.inProgress:
        return 'In Progress';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.cancelled:
        return 'Cancelled';
      case BookingStatus.rejected:
        return 'Rejected';
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
                  color: const Color(0xFFDBEAFE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  booking.service.icon,
                  color: AppColors.primary,
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
                    const SizedBox(height: 4),
                    Text(
                      booking.provider.name,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusBadge(
                label: _statusLabel(booking.status),
                status: booking.status,
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: AppColors.primary,
                size: 19,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${_formatDate(booking.scheduledDate)} • ${booking.scheduledTime}',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.primary,
                size: 19,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  booking.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
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
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          if (booking.status == BookingStatus.completed) ...[
            const SizedBox(height: 16),
            const Divider(color: AppColors.border, height: 1),
            const SizedBox(height: 16),

            ValueListenableBuilder(
              valueListenable: ReviewStore.reviews,
              builder: (context, reviews, child) {
                final hasReview = ReviewStore.hasReviewForBooking(booking.id);
                final review = ReviewStore.getReviewForBooking(booking.id);

                if (hasReview && review != null) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFBBF7D0)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.success,
                          size: 21,
                        ),
                        const SizedBox(width: 9),
                        const Expanded(
                          child: Text(
                            'Review submitted',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFF59E0B),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          review.rating.toStringAsFixed(0),
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LeaveReviewScreen(booking: booking),
                        ),
                      );
                    },
                    icon: const Icon(Icons.star_outline_rounded),
                    label: const Text('Leave a Review'),
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final BookingStatus status;

  const _StatusBadge({required this.label, required this.status});

  @override
  Widget build(BuildContext context) {
    final isNegative =
        status == BookingStatus.cancelled || status == BookingStatus.rejected;

    final foregroundColor = isNegative
        ? const Color(0xFFB91C1C)
        : status == BookingStatus.completed
        ? const Color(0xFF047857)
        : status == BookingStatus.pending
        ? const Color(0xFFB45309)
        : AppColors.primary;

    final backgroundColor = isNegative
        ? const Color(0xFFFEE2E2)
        : status == BookingStatus.completed
        ? const Color(0xFFD1FAE5)
        : status == BookingStatus.pending
        ? const Color(0xFFFEF3C7)
        : const Color(0xFFDBEAFE);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foregroundColor,
          fontSize: 10,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
