import '../../providers/domain/provider_item.dart';
import '../../services/domain/service_item.dart';

enum BookingStatus {
  pending,
  confirmed,
  providerEnRoute,
  inProgress,
  completed,
  cancelled,
  rejected,
}

class BookingItem {
  final String id;
  final ServiceItem service;
  final ProviderItem provider;
  final DateTime scheduledDate;
  final String scheduledTime;
  final String address;
  final String? notes;
  final double startingPrice;
  final BookingStatus status;
  final DateTime createdAt;

  const BookingItem({
    required this.id,
    required this.service,
    required this.provider,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.address,
    required this.startingPrice,
    required this.status,
    required this.createdAt,
    this.notes,
  });

  BookingItem copyWith({
    String? id,
    ServiceItem? service,
    ProviderItem? provider,
    DateTime? scheduledDate,
    String? scheduledTime,
    String? address,
    String? notes,
    double? startingPrice,
    BookingStatus? status,
    DateTime? createdAt,
  }) {
    return BookingItem(
      id: id ?? this.id,
      service: service ?? this.service,
      provider: provider ?? this.provider,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      startingPrice: startingPrice ?? this.startingPrice,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
