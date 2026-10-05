import 'package:flutter/foundation.dart';

import '../domain/review_item.dart';

class ReviewStore {
  static final ValueNotifier<List<ReviewItem>> reviews =
      ValueNotifier<List<ReviewItem>>([]);

  static bool hasReviewForBooking(String bookingId) {
    return reviews.value.any((review) => review.bookingId == bookingId);
  }

  static ReviewItem? getReviewForBooking(String bookingId) {
    for (final review in reviews.value) {
      if (review.bookingId == bookingId) {
        return review;
      }
    }

    return null;
  }

  static void addReview({
    required String bookingId,
    required String providerName,
    required double rating,
    String? comment,
  }) {
    if (hasReviewForBooking(bookingId)) {
      return;
    }

    if (rating < 1 || rating > 5) {
      throw ArgumentError('Rating must be between 1 and 5.');
    }

    final review = ReviewItem(
      id: 'REV-${DateTime.now().millisecondsSinceEpoch}',
      bookingId: bookingId,
      providerName: providerName,
      rating: rating,
      comment: comment?.trim().isEmpty == true ? null : comment?.trim(),
      createdAt: DateTime.now(),
    );

    reviews.value = [...reviews.value, review];
  }
}
