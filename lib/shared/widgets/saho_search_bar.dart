import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SahoSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final VoidCallback? onFilterTap;

  const SahoSearchBar({
    super.key,
    this.hintText = 'What service do you need?',
    this.onTap,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.textSecondary,
        ),
        suffixIcon: GestureDetector(
          onTap: onFilterTap,
          child: Container(
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}