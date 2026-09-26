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
