import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../domain/booking_draft.dart';
import 'review_booking_screen.dart';

class BookingAddressScreen extends StatefulWidget {
  final BookingDraft initialDraft;

  const BookingAddressScreen({super.key, required this.initialDraft});

  @override
  State<BookingAddressScreen> createState() => _BookingAddressScreenState();
}

class _BookingAddressScreenState extends State<BookingAddressScreen> {
  late BookingDraft _draft;

  final _addressController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _draft = widget.initialDraft;

    _addressController.text = _draft.address ?? '';
    _notesController.text = _draft.notes ?? '';

    _addressController.addListener(_handleAddressChanged);
  }

  void _handleAddressChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _addressController.removeListener(_handleAddressChanged);
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _continue() {
    final address = _addressController.text.trim();
    final notes = _notesController.text.trim();

    if (address.isEmpty) {
      return;
    }

    final updatedDraft = _draft.copyWith(address: address, notes: notes);

    setState(() {
      _draft = updatedDraft;
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ReviewBookingScreen(draft: updatedDraft),
      ),
    );

    // Review Booking screen will be connected here next.
  }

  @override
  Widget build(BuildContext context) {
    final hasAddress = _addressController.text.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: const Text('Service Location')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            const Text(
              'Where do you need the service?',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the address where the professional should provide the service.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 28),

            const Text(
              'Service address',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _addressController,
              keyboardType: TextInputType.streetAddress,
              textCapitalization: TextCapitalization.words,
              maxLines: 3,
              minLines: 2,
              decoration: InputDecoration(
                hintText: 'Building, street, area, city',
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 14, right: 12, bottom: 34),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primary,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 48),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            Row(
              children: [
                const Text(
                  'Additional notes',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  '(Optional)',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _notesController,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 4,
              minLines: 3,
              decoration: InputDecoration(
                hintText:
                    'Add access instructions or anything the professional should know.',
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.primary,
                    size: 22,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Make sure the address is accurate so the professional can find the service location.',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: hasAddress ? _continue : null,
                child: const Text('Review Booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
