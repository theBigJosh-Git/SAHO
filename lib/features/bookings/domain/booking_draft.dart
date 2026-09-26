import '../../providers/domain/provider_item.dart';
import '../../services/domain/service_item.dart';

class BookingDraft {
  final ServiceItem service;
  final ProviderItem provider;
  final DateTime? selectedDate;
  final String? selectedTime;
  final String? address;
  final String? notes;

  const BookingDraft({
    required this.service,
    required this.provider,
    this.selectedDate,
    this.selectedTime,
    this.address,
    this.notes,
  });

  BookingDraft copyWith({
    ServiceItem? service,
    ProviderItem? provider,
    DateTime? selectedDate,
    String? selectedTime,
    String? address,
    String? notes,
  }) {
    return BookingDraft(
      service: service ?? this.service,
      provider: provider ?? this.provider,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      address: address ?? this.address,
      notes: notes ?? this.notes,
    );
  }
}
