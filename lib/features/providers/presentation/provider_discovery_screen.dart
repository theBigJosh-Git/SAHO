import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../services/domain/service_item.dart';
import '../data/provider_catalog.dart';
import '../domain/provider_item.dart';
import 'provider_profile_screen.dart';

class ProviderDiscoveryScreen extends StatelessWidget {
  final ServiceItem service;

  const ProviderDiscoveryScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final providers = ProviderCatalog.forService(service.name);

    return Scaffold(
      appBar: AppBar(title: const Text('Professionals')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Text(
              'Professionals for ${service.name}',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${providers.length} ${providers.length == 1 ? 'professional' : 'professionals'} available',
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 28),
            if (providers.isEmpty)
              const _EmptyProvidersState()
            else
              ...providers.map(
                (provider) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _ProviderCard(
                    provider: provider,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProviderProfileScreen(
                            provider: provider,
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

class _ProviderCard extends StatelessWidget {
  final ProviderItem provider;
  final VoidCallback? onTap;

  const _ProviderCard({required this.provider, this.onTap});

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
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBEAFE),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.primary,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              provider.name,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          if (provider.isVerified) ...[
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.verified_rounded,
                              color: AppColors.primary,
                              size: 18,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        provider.title,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.warning,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            provider.rating.toStringAsFixed(1),
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${provider.reviewCount} reviews)',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.textSecondary,
                  size: 15,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.border, height: 1),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _ProviderStat(
                    icon: Icons.work_outline_rounded,
                    value: '${provider.completedJobs}',
                    label: 'Jobs',
                  ),
                ),
                Expanded(
                  child: _ProviderStat(
                    icon: Icons.workspace_premium_outlined,
                    value: '${provider.yearsExperience} yrs',
                    label: 'Experience',
                  ),
                ),
                Expanded(
                  child: _ProviderStat(
                    icon: Icons.location_on_outlined,
                    value: provider.location,
                    label: 'Location',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProviderStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _ProviderStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 19),
        const SizedBox(height: 5),
        Text(
          value,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 10),
        ),
      ],
    );
  }
}

class _EmptyProvidersState extends StatelessWidget {
  const _EmptyProvidersState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.person_search_outlined,
            color: AppColors.primary,
            size: 42,
          ),
          SizedBox(height: 14),
          Text(
            'No professionals available yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Please check again later for available professionals.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
