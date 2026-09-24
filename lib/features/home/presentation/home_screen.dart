import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/saho_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<_ServiceCategory> _categories = [
    _ServiceCategory(
      name: 'Cleaning',
      icon: Icons.cleaning_services_outlined,
    ),
    _ServiceCategory(
      name: 'Plumbing',
      icon: Icons.plumbing_outlined,
    ),
    _ServiceCategory(
      name: 'Electrical',
      icon: Icons.electrical_services_outlined,
    ),
    _ServiceCategory(
      name: 'AC & Cooling',
      icon: Icons.ac_unit_outlined,
    ),
    _ServiceCategory(
      name: 'Handyman',
      icon: Icons.handyman_outlined,
    ),
    _ServiceCategory(
      name: 'Painting',
      icon: Icons.format_paint_outlined,
    ),
    _ServiceCategory(
      name: 'Appliances',
      icon: Icons.home_repair_service_outlined,
    ),
    _ServiceCategory(
      name: 'Moving',
      icon: Icons.local_shipping_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildHeader(),
                  const SizedBox(height: 28),
                  _buildHeroSection(),
                  const SizedBox(height: 24),
                  const SahoSearchBar(),
                  const SizedBox(height: 32),
                  const SectionHeader(
                  title: 'Services',
                  action: 'See all',
                  ),
                  const SizedBox(height: 18),
                  _buildCategoryGrid(),
                  const SizedBox(height: 32),
                  const SectionHeader(
                  title: 'Popular near you',
                  action: 'View all',
                  ),
                  const SizedBox(height: 16),
                  _buildPopularServiceCard(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SAHO',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 4),
                  const Flexible(
                    child: Text(
                      'Dubai, United Arab Emirates',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services you need,\nright at your doorstep.',
            style: TextStyle(
              color: AppColors.textOnPrimary,
              fontSize: 25,
              height: 1.2,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Book trusted professionals for your home.',
            style: TextStyle(
              color: Color(0xFFDCE7FF),
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 18,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, index) {
        final category = _categories[index];

        return Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.border,
                  ),
                ),
                child: Icon(
                  category.icon,
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPopularServiceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFDBEAFE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.ac_unit_rounded,
              size: 32,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AC Cleaning & Service',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Professional home AC maintenance',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 17,
                      color: AppColors.warning,
                    ),
                    SizedBox(width: 3),
                    Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'From AED 79',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}

class _ServiceCategory {
  final String name;
  final IconData icon;

  const _ServiceCategory({
    required this.name,
    required this.icon,
  });
}