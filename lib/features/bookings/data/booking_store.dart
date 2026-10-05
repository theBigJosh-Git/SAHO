import 'package:flutter/foundation.dart';

import '../domain/booking_item.dart';

class BookingStore {
  BookingStore._();

  static final ValueNotifier<List<BookingItem>> bookings =
      ValueNotifier<List<BookingItem>>([]);

  static void addBooking(BookingItem booking) {
    bookings.value = [booking, ...bookings.value];
  }

  static void updateBooking(BookingItem updatedBooking) {
    bookings.value = bookings.value.map((booking) {
      return booking.id == updatedBooking.id ? updatedBooking : booking;
    }).toList();
  }

  static bool updateStatus(String bookingId, BookingStatus newStatus) {
    final booking = findById(bookingId);

    if (booking == null) {
      return false;
    }

    final allowedTransitions = <BookingStatus, Set<BookingStatus>>{
      BookingStatus.pending: {
        BookingStatus.confirmed,
        BookingStatus.rejected,
        BookingStatus.cancelled,
      },
      BookingStatus.confirmed: {
        BookingStatus.providerEnRoute,
        BookingStatus.cancelled,
      },
      BookingStatus.providerEnRoute: {BookingStatus.inProgress},
      BookingStatus.inProgress: {BookingStatus.completed},
    };

    final allowedNextStatuses = allowedTransitions[booking.status];

    if (allowedNextStatuses == null ||
        !allowedNextStatuses.contains(newStatus)) {
      return false;
    }

    updateBooking(booking.copyWith(status: newStatus));

    return true;
  }

  static BookingItem? findById(String bookingId) {
    for (final booking in bookings.value) {
      if (booking.id == bookingId) {
        return booking;
      }
    }

    return null;
  }

  static void clear() {
    bookings.value = [];
  }
}
