import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class InfoStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoStat({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.krem,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hijauSage.withOpacity(0.5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.hijauTua, size: 22),
          const SizedBox(height: 6), // SizedBox = spacer kosong
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.coklatTua,
              fontSize: 13,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: AppColors.hijauTua.withOpacity(0.8),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
