import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../data/service_catalog.dart';
import '../domain/service_item.dart';
import 'service_details_screen.dart';

class ServiceDiscoveryScreen extends StatelessWidget {
  final String categoryName;

  const ServiceDiscoveryScreen({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    final services = ServiceCatalog.forCategory(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Text(
              categoryName,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose a service and find trusted professionals for your home.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 28),
            ...services.map(
              (service) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _ServiceCard(
  service: service,
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ServiceDetailsScreen(
          service: service,
        ),
      ),
    );
  },
),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceItem service;
  final VoidCallback? onTap;

  const _ServiceCard({
    required this.service,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
  onTap: onTap,
  borderRadius: BorderRadius.circular(20),
  child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              service.icon,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  service.description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'From AED ${service.startingPrice.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: AppColors.textSecondary,
          ),
        ],
           ),
      ),
  );
  }
}