import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TypeChip extends StatelessWidget {
  final String label;

  const TypeChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.krem,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.orangeTerang),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.orangGelap,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
