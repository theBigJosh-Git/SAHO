import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../bookings/domain/booking_item.dart';
import '../data/review_store.dart';

class LeaveReviewScreen extends StatefulWidget {
  final BookingItem booking;

  const LeaveReviewScreen({super.key, required this.booking});

  @override
  State<LeaveReviewScreen> createState() => _LeaveReviewScreenState();
}

class _LeaveReviewScreenState extends State<LeaveReviewScreen> {
  int _selectedRating = 0;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<bool> _showSubmitReviewDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: AppColors.surface,
          insetPadding: const EdgeInsets.symmetric(horizontal: 28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF3C7),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.star_rounded,
                    color: Color(0xFFF59E0B),
                    size: 38,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Submit your review?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'You are giving ${widget.booking.provider.name} a $_selectedRating-star rating. '
                  'Once submitted, this review cannot be submitted again for this booking.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(dialogContext, false);
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(dialogContext, true);
                          },
                          icon: const Icon(Icons.star_rounded, size: 19),
                          label: const Text('Submit'),
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

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final booking = widget.booking;

    return Scaffold(
      appBar: AppBar(title: const Text('Leave a Review')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          children: [
            const Text(
              'How was your service?',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              'Share your experience with ${booking.provider.name}.',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 28),

            // Service summary
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      booking.service.icon,
                      color: AppColors.success,
                      size: 27,
                    ),
                  ),
                  const SizedBox(width: 14),
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
                  const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.success,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            const Text(
              'Your rating',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Tap a star to rate your experience.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),

            const SizedBox(height: 18),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final star = index + 1;
                final selected = star <= _selectedRating;

                return IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedRating = star;
                    });
                  },
                  iconSize: 40,
                  icon: Icon(
                    selected ? Icons.star_rounded : Icons.star_border_rounded,
                    color: selected
                        ? const Color(0xFFF59E0B)
                        : AppColors.textSecondary,
                  ),
                );
              }),
            ),

            const SizedBox(height: 28),

            const Text(
              'Tell us more',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Your written review is optional.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _commentController,
              maxLines: 5,
              maxLength: 500,
              decoration: InputDecoration(
                hintText:
                    'What did you like about the service? Anything the professional could improve?',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: _selectedRating == 0
                    ? null
                    : () async {
                        if (widget.booking.status != BookingStatus.completed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Only completed bookings can be reviewed.',
                              ),
                            ),
                          );
                          return;
                        }

                        if (ReviewStore.hasReviewForBooking(
                          widget.booking.id,
                        )) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'You have already reviewed this booking.',
                              ),
                            ),
                          );
                          return;
                        }

                        final confirmed = await _showSubmitReviewDialog(
                          context,
                        );

                        if (!confirmed) {
                          return;
                        }

                        if (!context.mounted) {
                          return;
                        }

                        ReviewStore.addReview(
                          bookingId: widget.booking.id,
                          providerName: widget.booking.provider.name,
                          rating: _selectedRating.toDouble(),
                          comment: _commentController.text,
                        );

                        Navigator.pop(context, true);
                      },
                icon: const Icon(Icons.star_rounded),
                label: const Text('Submit Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
