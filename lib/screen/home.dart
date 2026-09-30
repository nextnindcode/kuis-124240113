import 'package:flutter/material.dart';

import '../model/pokemon.dart';
import '../data/pokemon_list.dart';
import '../theme/app_theme.dart';
import '../widget/section.dart';
import '../widget/card.dart';
import 'detail.dart';
import 'root.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.krem,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, ${widget.username}!',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.coklatTua,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: _types
                    .map(
                      (type) => SectionChip(
                        label: type,
                        isActive: _selectedType == type,
                        onTap: () => setState(() => _selectedType = type),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 8),

            
        ),
      ),
    );
  }

  //tampilan kalau pencarian tidak ada hasil
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 56,
            color: AppColors.hijauTua.withOpacity(0.5),
          ),
          const SizedBox(height: 12),
          Text(
            'Satwa "$_keyword" tidak ditemukan',
            style: TextStyle(color: AppColors.hijauTua.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}
