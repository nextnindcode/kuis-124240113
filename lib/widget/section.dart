import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SectionChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isActive;
  final VoidCallback? onTap;

  const SectionChip({
    super.key,
    required this.label,
    this.icon,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        margin: const EdgeInsets.only(right: 8, bottom: 8),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.hijauTua
              : AppColors.krem, //warna ikut status aktif
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? AppColors.hijauTua : AppColors.hijauSage,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 14,
                color: isActive ? AppColors.krem : AppColors.hijauTua,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.krem : AppColors.hijauTua,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
